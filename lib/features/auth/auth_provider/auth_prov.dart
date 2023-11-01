// ignore_for_file: unused_field, constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthStatus {unAuthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier {
  FirebaseAuth? _auth;
  User? _user;
  AuthStatus? _authStatus;
  String? errorMassage;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;


  AuthProvider() {
    _auth = FirebaseAuth.instance;
    _auth?.authStateChanges().listen((User? user) {
      if (user == null){
        _authStatus = AuthStatus.unAuthenticated;
        print('================User is Sign In');
      }
      else {
        _user = user;
        _authStatus = AuthStatus.Authenticated;
        print('================User is Sign Out');
      }
      notifyListeners();
    });
  }

  AuthStatus? get authStatus => _authStatus;
  User? get user => _user;
  GoogleSignInAccount? get googelUser => _googleUser;
  

  Future<bool> login(String email, String password) async{
    try {
      _authStatus = AuthStatus.Authenticated;
      notifyListeners();
      return true;
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
      
      _authStatus = AuthStatus.unAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() async {
    await _auth?.signOut();
    _authStatus = AuthStatus.unAuthenticated;
    notifyListeners();
  }

  Future signInWithGoogle() async{

    try {
        _auth = FirebaseAuth.instance;
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        // if (googleUser == null) return;
        _googleUser = googleUser;
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
        
        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken
        );
        
        await _auth!.signInWithCredential(credential);
        } on Exception catch (e) {
          print(e);
        }
      
        _authStatus = AuthStatus.Authenticated;
        notifyListeners();
      
      
  }

  Future<void> signOutwithGoogle() async{
    try {
  _auth = FirebaseAuth.instance;
  await googleSignIn.disconnect();
  await _auth!.signOut();
  await googleSignIn.signOut();

} on Exception {
  // print('The error is: ${e.toString()}');
}
  _authStatus = AuthStatus.unAuthenticated;
  notifyListeners();
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