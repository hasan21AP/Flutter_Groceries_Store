
import 'package:flutter/material.dart';
import 'package:online_groceries_store/core/constats.dart';
import 'package:online_groceries_store/core/utils/size_config.dart';
import 'package:online_groceries_store/core/widgets/space_wiget.dart';

class CustomGeneralButton extends StatelessWidget {
  const CustomGeneralButton({super.key, this.text, this.onTap});

  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                onTap: onTap,
                child: Container(
                  height: 60,
                  width: SizeConfig.screenWidth! * 0.8,
                  decoration: BoxDecoration(
                    color: kMainColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                            text!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFFFFF9FF),
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 0.06,
                            ),
                          ),
                        ),
                      )
                  );
                }
              }


class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({super.key, this.text, this.onPressed, this.mainColor, this.secondColor});

  final String? text;
  final VoidCallback? onPressed;
  final Color? mainColor;
  final Color? secondColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    foregroundColor: secondColor,
                    minimumSize: Size(SizeConfig.screenWidth! * 0.85, SizeConfig.screenHeight! * 0.07),
                    enableFeedback: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    )
                  ), 
                  child: Text(text!),
                  );
  }
}              


class CustomSignInButton extends StatelessWidget {
  const CustomSignInButton({super.key, this.text, this.onPressed, this.mainColor, this.secondColor, this.iconData, this.iconColor, this.iconSize, this.horizontalPadding});
  
  final String? text;
  final VoidCallback? onPressed;
  final IconData? iconData;
  final Color? mainColor;
  final Color? secondColor;
  final Color? iconColor;
  final double? iconSize;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
            backgroundColor: mainColor,
            foregroundColor: secondColor,
            minimumSize: Size(
              SizeConfig.screenWidth! * 0.8, 
              SizeConfig.screenHeight! * 0.07),
            enableFeedback: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
      ),
      child: SizedBox(
        width: SizeConfig.screenWidth! * 0.84,
        height: SizeConfig.screenHeight! * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Icon(
                  iconData,
                  color: iconColor,
                  size: iconSize,
                  ),
                const HorizanintalSpace(value: 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding!),
                  child: Text(
                    text!,
                    ),
                )
          ]
          ,),
      )
      );
  }
}


class GeneralCustomTextButtons extends StatelessWidget {
  const GeneralCustomTextButtons({super.key, this.text, this.color, this.onPressed, this.heightOfText});

  final String? text;
  final Color? color;
  final VoidCallback? onPressed;
  final double? heightOfText;

  @override
  Widget build(BuildContext context) {
    return TextButton(
                onPressed: onPressed, 
                style: TextButton.styleFrom(
                  enableFeedback: false,
                ),
                child:  Text(
                      text!,
                      style: TextStyle(
                        color: color,
                        fontSize: 14,
                        fontFamily: 'Gilroy-Medium',
                        fontWeight: FontWeight.w400,
                        height: heightOfText,
                        letterSpacing: 0.70,
                      ),
                    ),
                );
  }
}