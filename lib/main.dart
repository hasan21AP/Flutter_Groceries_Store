
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_groceries_store/features/auth/auth_prov.dart';
import 'package:online_groceries_store/features/home/presentation/home_screen_view.dart';
import 'package:online_groceries_store/firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/splash/presentation/splash_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: ((context) => AuthProvider()
          )
    )],
      child:  const OnlineGroceriesStore()
      )
    );
}


class OnlineGroceriesStore extends StatelessWidget {
  const OnlineGroceriesStore({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Groceries Store',
      debugShowCheckedModeBanner: false,
      home: _showScreen(context),
    );
  }

  Widget _showScreen(context){
  var prov = Provider.of<AuthProvider>(context);
  switch (prov.authStatus) {
    case AuthStatus.Authenticating:
    case AuthStatus.unAuthenticated:
      return const SplashView();
    case AuthStatus.Authenticated:
      return const HomeScreenView();

  }
}
}


