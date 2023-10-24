
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IntlPhoneField(
                          decoration: 
                          InputDecoration(
                            labelText: 'Enter your number',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
              ),
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
            onPressed: () {
              
            },
            mainColor: const Color(0xFF5383EC),
            secondColor: kSecondColor,
            text: 'Continue with Google',
            iconData: FontAwesomeIcons.google,
            iconSize: 26,
            iconColor: kSecondColor,
          ),
          const VerticalSpace(value: 2),
          CustomSignInButton(
            onPressed: () {
              
            },
            mainColor: const Color(0xFF4A66AC),
            secondColor: kSecondColor,
            text: 'Continue with Facebook',
            iconData: FontAwesomeIcons.facebookF,
            iconSize: 26,
            iconColor: kSecondColor,
          )
      ],
    );
  }
}