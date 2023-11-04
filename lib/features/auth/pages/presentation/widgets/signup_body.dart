
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/custom_pages_route.dart';
import 'package:online_groceries_store/core/widgets/custom_text_forms.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';
import 'package:online_groceries_store/features/auth/auth_provider/auth_prov.dart';
import 'package:online_groceries_store/features/home/presentation/home_screen_view.dart';
import 'package:provider/provider.dart';

import '../login_view.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();

  

}

class _SignUpBodyState extends State<SignUpBody> {

  final GlobalKey<FormState> formState1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formState2 = GlobalKey<FormState>();
  final GlobalKey<FormState> formState3 = GlobalKey<FormState>();
  bool _passwordVisible = true;

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<AuthProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack( 
          alignment: Alignment.center,
          children: [
            Image.asset(kBackground),
            Image.asset(kColoringCarrot)]),
            const VerticalSpace(value: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF181725),
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  height: 0.04,
                ),
              ),
            ),
            const VerticalSpace(value: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Enter your credentials to continuepassword',
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 0.06,
                ),
              ),
            ),

            const VerticalSpace(value: 4),
            CustomTextFieldFormForEmail(
              formKey: formState1,
              borderColor: kMainColor,
              focusColor: kMainColor,
              text: 'Username',
              obscureText: false,
              validator: (value){
                if (value == null || value.isEmpty ){
                  return 'Empty Field';
                }
                return null;
              }
              ),
            const VerticalSpace(value: 3),
            CustomTextFieldFormForEmail(
              myController: email,
              formKey: formState2,
              borderColor: kMainColor,
              focusColor: kMainColor,
              text: 'Email',
              obscureText: false,
              validator: (value){
                if (value == null || value.isEmpty ){
                  return 'Empty Field';
                }
                return null;
              }
              ),
            const VerticalSpace(value: 3),
            CustomTextFieldFormForPassword(
              myController: password,
              formKey: formState3,
              borderColor: kMainColor,
              focusColor: kMainColor,
              text: 'Password',
              obscureText: _passwordVisible,
              validator: (value){
                if (value == null || value.isEmpty ){
                  return 'Empty Field';
                }
                return null;
              },
              icon: Icon(
                      _passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: kMainColor,
                      ),
              onPressed: (){
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              ),
              CustomFormsForEmailAndPassword(
                text1: 'By continuing you agree to our',
                text2: 'Terms of Service',
                onPressed: (){},
                textColor: const Color(0xFF7C7C7C),
                textButtonColor: kMainColor,
                heightOfText: 0.08,
                heightOfTextButton: 0.08,
              ),
              CustomFormsForEmailAndPassword(
                text1: 'and',
                text2: 'Privacy Policy.',
                onPressed: (){},
                textColor: const Color(0xFF7C7C7C),
                textButtonColor: kMainColor,
                heightOfText: -2,
                heightOfTextButton: -2,
              ),
              Container(
                alignment: Alignment.center,
                child: CustomElevetedButton(
                  onPressed: () async{
                    if (formState1.currentState!.validate() || 
                    formState2.currentState!.validate() ||
                     formState3.currentState!.validate()) {
                      await prov.signUpWithEmailAndPassword(email.text, password.text);
                        Future.microtask(() => Navigator.of(context).pushReplacement(
                          CustomSlidePageRoute(page: const HomeScreenView())
                        ));
                      
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Something Wrong'))
                      );
                    }
                  },
                  text: 'Sign Up',
                  mainColor: kMainColor,
                  secondColor: kSecondColor,
                ),
              ),
              const VerticalSpace(value: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Alread have an account?",
                      style: TextStyle(
                        color: Color(0xFF181725),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                        letterSpacing: 0.70,
                      ),
                  ),
                  // HorizanintalSpace(value: 1),
                  GeneralCustomTextButtons(
                    onPressed: (){
                      Future.microtask(
                        () => Navigator.of(context).push(
                          CustomSlidePageRoute(page: const LogInView()
                          ))
                      );
                    },
                    text: 'Login',
                    color: kMainColor,
                    heightOfText: 0.08,
                  )
                ],
              )
          ],
        );
  }
}