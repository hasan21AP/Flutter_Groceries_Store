
import 'package:flutter/material.dart';

class CustomSlidePageRoute extends PageRouteBuilder {
  final Widget page;

  CustomSlidePageRoute({
    required this.page,
  }) : super(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = const Offset(1, 0);
          var end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          // var curve = CurvedAnimation(parent: animation, curve: Curves.easeInBack);
          return SlideTransition(position: offsetAnimation, child: child);
        }
  );

} 


class CustomFadePageRoute extends PageRouteBuilder {
  final Widget page;

  CustomFadePageRoute({
    required this.page,
  }) : super(
        transitionDuration: const Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        }
  );

} 