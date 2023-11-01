
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries_store/features/auth/auth_provider/auth_prov.dart';
import 'package:online_groceries_store/features/home/presentation/home_screen_view.dart';
import 'package:online_groceries_store/firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/splash/presentation/widgets/splash_view_body.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'name-here',
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
    return  MaterialApp(
      title: 'Groceries Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: _showScreen(context),
    );
  }

  Widget _showScreen(context){
  final prov = Provider.of<AuthProvider>(context);
  switch (prov.authStatus) {
    case AuthStatus.Authenticating:
    case AuthStatus.Authenticated:
      return const HomeScreenView();
    case AuthStatus.unAuthenticated:
      return const SplashViewBody();
      
    default:
     return const SplashViewBody();
  }
}
}


