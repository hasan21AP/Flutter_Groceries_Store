
// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/utils/size_config.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/custom_pages_route.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';
import 'package:online_groceries_store/features/auth/auth_provider/auth_prov.dart';
import 'package:online_groceries_store/features/auth/pages/presentation/login_view.dart';
import 'package:online_groceries_store/features/home/presentation/home_screen_view.dart';
import 'package:provider/provider.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
              Image.asset(kMask),
              const VerticalSpace(value: 8),
              const Row(
                children: [
                    HorizanintalSpace(value: 2),
                    Text(
                      'Get your groceries',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xFF030303),
                        fontSize: 26,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        height: 0.04,
                      ),
                    ),
                  ],
              ),

              const VerticalSpace(value: 3),
              const Row(
              children: [
                  HorizanintalSpace(value: 2),
                  Text(
                    'with netcar',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Color(0xFF030303),
                      fontSize: 26,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0.04,
                    ),
                  ), 
                ],
            ),

            const VerticalSpace(value: 2),
            CustomSignInButton(
                  onPressed: () {
                   Future.delayed( const Duration(milliseconds: 300),
                   (){
                    Navigator.of(context).push(
                      CustomSlidePageRoute(page: const LogInView()
                      ));
                  });
            },
            mainColor: const Color.fromARGB(121, 4, 4, 4),
            secondColor: kSecondColor,
            text: 'Continue with Email',
            iconData: Icons.email,
            iconSize: 26,
            iconColor: kSecondColor,
            horizontalPadding: SizeConfig.screenWidth! * .12,
            ),

            const VerticalSpace(value: 2),
            CustomSignInButton(
                  onPressed: () {
            
            },
            mainColor: kMainColor,
            secondColor: kSecondColor,
            text: 'Continue with Phone Number',
            iconData: FontAwesomeIcons.phone,
            iconSize: 26,
            iconColor: kSecondColor,
            horizontalPadding: SizeConfig.screenWidth! * .04,
            ),
          const VerticalSpace(value: 2),
          const Text(
                'Or connect with social media',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF828282),
                  fontSize: 14,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
          const VerticalSpace(value: 3),
          CustomSignInButton(
            onPressed: () async{

                    showDialog(context: context, 
                    builder: (context){
                      return const Center(
                        child: CircularProgressIndicator(color: kMainColor,)
                      );
                    }
                    );
                    await prov.signInWithGoogle();
                      if (prov.user == null){
                        return;
                      }
                      Future.microtask( () =>
                      Navigator.of(context).push(
                        CustomSlidePageRoute(page: const HomeScreenView()
                        ))
                  );

            },
            mainColor: const Color(0xFF5383EC),
            secondColor: kSecondColor,
            text: 'Continue with Google',
            iconData: FontAwesomeIcons.google,
            iconSize: 26,
            iconColor: kSecondColor,
            horizontalPadding: SizeConfig.screenWidth! * .11,
          ),
          const VerticalSpace(value: 2),
          CustomSignInButton(
            onPressed: () async{
                  showDialog(context: context, 
                    builder: (context){
                      return const Center(
                        child: CircularProgressIndicator(color: kMainColor,)
                      );
                    }
                    );
                    await prov.signInWithFacebook();
                    if (prov.user == null){
                      return;
                    }
                    Future.microtask( () =>
                      Navigator.of(context).push(
                        CustomSlidePageRoute(page: const HomeScreenView()
                        ))
                  );

            },
            mainColor: const Color(0xFF4A66AC),
            secondColor: kSecondColor,
            text: 'Continue with Facebook',
            iconData: FontAwesomeIcons.facebookF,
            iconSize: 26,
            iconColor: kSecondColor,
            horizontalPadding: SizeConfig.screenWidth! * .088,
          )
      ],
    );
  }
}


