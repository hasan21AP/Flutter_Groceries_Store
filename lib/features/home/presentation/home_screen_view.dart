import 'package:flutter/material.dart';
import 'package:online_groceries_store/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
          body: HomeScreenBody(),
    );
  }
}