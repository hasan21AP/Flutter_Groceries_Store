
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';
import 'package:online_groceries_store/features/auth/pages/presentation/signup_view.dart';

class LogInBody extends StatefulWidget {
  const LogInBody({super.key});

  @override
  State<LogInBody> createState() => _LogInBodyState();
}


class _LogInBodyState extends State<LogInBody> {

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    
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
                  fontFamily: 'Gilroy',
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                          'Email',
                          style: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            height: 0.11,
                          ),
                        )
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kMainColor, 
                    ),
                  )
                ),
              )
              ),
            const VerticalSpace(value: 6),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFF7C7C7C),
                            fontSize: 16,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w600,
                            height: 0.11,
                          ),
                        )
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: _passwordVisible,
                autocorrect: false,
                enableSuggestions: false,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kMainColor, 
                    ),
                  ),
                  suffixIcon: IconButton(
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
                  
                ),
              )
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GeneralCustomTextButtons(
                    onPressed: (){},
                    text: 'Forgot Password?',
                    color: const Color(0xFF181725),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: CustomElevetedButton(
                  onPressed: (){},
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
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        height: 0.08,
                        letterSpacing: 0.70,
                      ),
                  ),
                  // HorizanintalSpace(value: 1),
                  GeneralCustomTextButtons(
                    onPressed: (){
                      Future.delayed(
                        const Duration(milliseconds: 500), (){
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUpView())
                        );
                      });
                    },
                    text: 'Signup',
                    color: kMainColor,
                  )
                ],
              )
          ],
        );
  }
}