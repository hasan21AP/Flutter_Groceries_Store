
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/utils/size_config.dart';

import '../../../onboarding/presentation/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {

  AnimationController? animationController;
  Animation<double>? animationFading;

  @override
  void initState() {
    super.initState();

    animationController = 
                          AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animationFading = 
                      Tween<double>(begin: 0.2, end: 1).animate(animationController!);   
    animationController?.repeat(reverse: true);  

    goToNextView();                 
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeTransition(
            opacity: animationFading!,
            child: Image.asset(klogo)
            )
      ]),
    );
  }
}

void goToNextView(){
  Future.delayed(const Duration(seconds: 3), (){
    Get.to(() => const OnBoardingView(), transition: Transition.fade);
  });
}