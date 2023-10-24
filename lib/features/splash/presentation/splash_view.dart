import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: kMainColor,
        body: SplashViewBody(),
    );
  }
}