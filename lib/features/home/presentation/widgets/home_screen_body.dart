
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/features/auth/auth_provider/auth_prov.dart';
import 'package:online_groceries_store/features/sign_in/presentation/sign_in_view.dart';
import 'package:provider/provider.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('This is Home page Welcome!'),
        Center(
          child: CustomElevetedButton(
            onPressed: () async{
                await prov.signOutwithGoogle();
                Future.delayed(const Duration(milliseconds: 300),(){
                  Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInView())
                );
                });
            },
            mainColor: kMainColor,
            secondColor: kSecondColor,
            text: 'Sign Out from google'
        
          ),
        )
        ],
      
    );
  }
}