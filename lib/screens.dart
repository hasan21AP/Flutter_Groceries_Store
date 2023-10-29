// // ignore_for_file: curly_braces_in_flow_control_structures

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:online_groceries_store/features/home/presentation/home_screen_view.dart';
// import 'package:online_groceries_store/features/splash/presentation/widgets/splash_view_body.dart';
// // import 'package:get/get_connect/sockets/src/sockets_html.dart';

// class Screens extends StatelessWidget {
//   const Screens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(), 
//         builder: ((context, snapshot) {
//           if(snapshot.hasData){
//             print('User has data: ${snapshot.hasData}');
//             return const HomeScreenView();
//            }
//           else {
//             print('User has data: ${snapshot.hasData}');
//             return const SplashViewBody();
//           }
//         })
//         ),
//     );
//   }
// }