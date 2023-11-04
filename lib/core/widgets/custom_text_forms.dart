import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/widgets/custom_buttons.dart';

class CustomTextFieldFormForEmail extends StatelessWidget {
    const CustomTextFieldFormForEmail(
    {super.key, this.text, required this.borderColor, this.focusColor, 
    this.icon, this.obscureText, this.onPressed, this.validator, this.formKey, this.myController}
    );

  final String? text;
  final Color? borderColor;
  final Color? focusColor;
  final Widget? icon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final Key? formKey;
  final TextEditingController? myController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: myController,
          keyboardType: TextInputType.emailAddress,
          autocorrect: true,
          validator: validator,
          obscureText: obscureText!,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            labelText: text,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: TextStyle(
              color: focusColor,
            ),
            focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor!,
                   )
              ),
           ),
          style: const TextStyle(
                        color: Color(0xFF7C7C7C),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
        ),
      ),
    );
  }
}

class CustomTextFieldFormForPassword extends StatelessWidget {
  const CustomTextFieldFormForPassword(
    {super.key, this.text, required this.borderColor, this.focusColor, 
    this.icon, this.obscureText, this.onPressed, this.validator, this.formKey, this.myController}
    );

  final String? text;
  final Color? borderColor;
  final Color? focusColor;
  final Widget? icon;
  final bool? obscureText;
  final VoidCallback? onPressed;
  final String? Function(String?)? validator;
  final Key? formKey;
  final TextEditingController? myController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: myController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText!,
          autocorrect: false,
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            labelText: text,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: TextStyle(
              color: focusColor,
            ),
            suffixIcon: IconButton(
              icon: icon!, 
              onPressed: onPressed
              ),
            focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor!,
                   )
              ),
           ),
          style: const TextStyle(
                        color: Color(0xFF7C7C7C),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
        ),
      ),
    );
  }
}



class CustomFormsForEmailAndPassword extends StatelessWidget {
  const CustomFormsForEmailAndPassword({super.key, this.text1, this.text2, this.textColor, 
  this.textButtonColor, this.onPressed, this.heightOfTextButton, this.heightOfText});

  final String? text1;
  final String? text2;
  final Color? textColor;
  final Color? textButtonColor;
  final VoidCallback? onPressed;
  final double? heightOfTextButton;
  final double? heightOfText;

  @override
  Widget build(BuildContext context) {
    return Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                           Text(text1!,
                              style: TextStyle(
                              color: textColor,
                              fontSize: 14,
                              fontFamily: 'Gilroy-Medium',
                              fontWeight: FontWeight.w400,
                              height: heightOfText,
                              letterSpacing: 0.70
                              )),
                          GeneralCustomTextButtons(
                            onPressed: onPressed,
                            text: text2,
                            color: textButtonColor,
                            heightOfText: heightOfText,
                          ),
                        ],
                      ),
                    ),
                  );
  }
}