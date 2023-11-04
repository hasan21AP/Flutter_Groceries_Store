
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/utils/size_config.dart';

import '../../../onboarding/presentation/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {




  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnimatedSplashScreen(
      splash: Image.asset(kSplash), 
      nextScreen: const OnBoardingView(),
      duration: 3000,
      backgroundColor: kMainColor,
      splashTransition: SplashTransition.slideTransition,


    );
  }
}

