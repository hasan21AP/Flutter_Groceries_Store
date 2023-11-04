
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_groceries_store/features/auth/auth_provider/auth_prov.dart';
import 'package:online_groceries_store/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:online_groceries_store/firebase_options.dart';
import 'package:provider/provider.dart';

import 'features/home/presentation/home_screen_view.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    final prov = Provider.of<AuthProvider>(context);
    print('User: ${prov.user?.email}');
    print('User Provider: ${prov.user?.providerData.elementAt(0).providerId}');
    return  MaterialApp(
      title: 'Nectar',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Gilroy'),
      home: prov.user == null ? const SplashViewBody() : const HomeScreenView(),
    );
  }

}


