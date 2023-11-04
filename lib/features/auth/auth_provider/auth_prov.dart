// ignore_for_file: unused_field, constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class AuthProvider with ChangeNotifier {
  FirebaseAuth? _auth;
  User? _user;
  String? errorMassage;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;


  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _auth?.authStateChanges().listen((User? user) {
      if (user == null){
        // _user = user;
        // print('================User is Sign In');
      }
      else {
        _user = user;
        // print('================User is Sign Out');
      }
      notifyListeners();
    });
  }

  User? get user => _user;
  GoogleSignInAccount? get googelUser => _googleUser;
  

  Future signUpWithEmailAndPassword(String email, String password) async{
    try {
        // ignore: unused_local_variable
        final credential = await _auth?.createUserWithEmailAndPassword(
        email: email,
        password: password);
        notifyListeners();
        credential?.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          errorMassage = 'The Email is Invalid';
      }
      else if (e.code == 'user-not-found'){
        errorMassage = 'User not Found';
      }
      else if (e.code == 'wrong-password'){
        errorMassage = 'Wrong Password';
      } else {
        print('Error is: $e');
      }
      
      notifyListeners();
    }
  }

  Future<void> loginWithEmailAndPassword(String email, String password) async{
    try {
        // ignore: unused_local_variable
        final credential = await _auth?.signInWithEmailAndPassword(
        email: email,
        password: password);
        notifyListeners();
        credential?.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email'){
          errorMassage = 'The Email is Invalid';
      }
      else if (e.code == 'user-not-found'){
        errorMassage = 'User not Found';
      }
      else if (e.code == 'wrong-password'){
        errorMassage = 'Wrong Password';
      }
      
      notifyListeners();
    }
  }

  logout() async {
    await _auth?.signOut();
    await googleSignIn.signOut();
    notifyListeners();
  }

  Future signInWithGoogle() async{

    try {
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser == null){
          return;
        }
        _googleUser = googleUser;
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,accessToken: googleAuth.accessToken
        );
        
        await _auth?.signInWithCredential(credential);
        } on Exception {
          // print(e);
        }
      
        notifyListeners();
      
      
  }

  Future<void> signOutwithGoogle() async{
    try {
  await googleSignIn.disconnect();
  await _auth?.signOut();

} on Exception {
  // print('The error is: ${e.toString()}');
}
  notifyListeners();
  }


Future<UserCredential> signInWithFacebook() async {

  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

  // Once signed in, return the UserCredential
  return _auth!.signInWithCredential(facebookAuthCredential);
}

  // void checking () {
  //   print('Google User Email is: ${_googleUser?.email}');
  //   print('User UID is: ${user?.uid}');
  //   print('Current User is: ${user?.email}');
  //   print('User ID Token ${googleSignIn.currentUser?.id}');
  //   print('User of google is: ${_userOfGoogle?.email}');
  //   print('auth Status: $_authStatus');

  // }
  

}