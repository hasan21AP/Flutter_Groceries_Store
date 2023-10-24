
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/splash_view.dart';

void main() {
  runApp(const OnlineGroceriesStore());
}


class OnlineGroceriesStore extends StatelessWidget {
  const OnlineGroceriesStore({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Groceries Store',
      debugShowCheckedModeBanner: false,
      home: SplashView()
    );
  }
}


