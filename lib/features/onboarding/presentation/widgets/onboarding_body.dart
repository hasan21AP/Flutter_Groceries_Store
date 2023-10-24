

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/utils/size_config.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
// import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';
import 'package:online_groceries_store/features/sign_in/presentation/sign_in_view.dart';

class OnBoardingBody extends StatefulWidget {
  const OnBoardingBody({super.key});

  @override
  State<OnBoardingBody> createState() => _OnBoardingBodyState();
}

class _OnBoardingBodyState extends State<OnBoardingBody> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
          Image.asset(
                  kOnboarding_2,
                  width: SizeConfig.screenWidth,
                  height: SizeConfig.screenHeight,
                  fit: BoxFit.cover
          ),
          Column(
            children: [
              const VerticalSpace(value: 30),
              Image.asset(klogo2),
              const VerticalSpace(value: 6),
              const Text(
                    'Welcome',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                    ),
                  ),

              const VerticalSpace(value: 6),
              const Text(
                    'to our store',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w600,
                      height: 0.01,
                    ),
                  ),
              const VerticalSpace(value: 4),
              const Text(
                    'Ger your groceries in as fast as one hour',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xB2FCFCFC),
                      fontSize: 16,
                      fontFamily: 'Gilroy-Medium',
                      fontWeight: FontWeight.w400,
                      height: 0.06,
                    ),
                  ),
                  const VerticalSpace(value: 4),
                  CustomElevetedButton(
                    onPressed: () {
                      Future.delayed(
                      const Duration(milliseconds: 200),
                      () {
                        Get.to(
                          () => const SignIn(),transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 500),
                          );
                      });
                    },
                    text: 'Get Started',
                    mainColor: kMainColor,
                    secondColor: kSecondColor
                  )
                  ]
            )  
      ]
      ,);
  }
}