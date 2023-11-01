
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/custom_pages_route.dart';
import 'package:online_groceries_store/core/widgets/custom_text_forms.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';
import 'package:online_groceries_store/features/auth/pages/presentation/signup_view.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}


class _LogInBodyState extends State<LogInBody> {

  final GlobalKey<FormState> formState1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formState2 = GlobalKey<FormState>();
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    
  }

  @override
  Widget build(BuildContext context) {
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
                'Loging',
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
                'Enter your email and password',
                style: TextStyle(
                  color: Color(0xFF7C7C7C),
                  fontSize: 16,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w400,
                  height: 0.06,
                ),
              ),
            ),

            const VerticalSpace(value: 7),
            CustomTextFieldFormForEmail(
              formKey: formState1,
              borderColor: kMainColor,
              focusColor: kMainColor,
              text: 'Email',
              obscureText: false,
              validator: (value){
                if (value == null || value.isEmpty ) return 'Empty Field';
                return null;
              }
              ),
            const VerticalSpace(value: 3),
            CustomTextFieldFormForPassword(
              formKey: formState2,
              borderColor: kMainColor,
              focusColor: kMainColor,
              text: 'Password',
              validator: (value){
                  if (value == null || value.isEmpty) return 'Empty Field';
                  return null;
              },
              obscureText: _passwordVisible,
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
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GeneralCustomTextButtons(
                    onPressed: (){},
                    text: 'Forgot Password?',
                    color: const Color(0xFF181725),
                    heightOfText: 0.08,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: CustomElevetedButton(
                  onPressed: (){
                    if (formState1.currentState!.validate() || formState2.currentState!.validate()){
                      
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Something Wrong'))
                      );
                    }
                  },
                  text: 'Log in',
                  mainColor: kMainColor,
                  secondColor: kSecondColor,
                ),
              ),
              const VerticalSpace(value: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                      "Don't have an account?",
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
                      Future.delayed(
                        const Duration(milliseconds: 100), (){
                        Navigator.of(context).push(
                          CustomSlidePageRoute(page: const SignUpView()
                          ));
                      });
                    },
                    text: 'Signup',
                    color: kMainColor,
                    heightOfText: 0.08,
                  )
                ],
              )
          ],
        );
  }
}