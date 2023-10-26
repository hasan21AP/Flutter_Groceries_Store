// ignore_for_file: unused_field, constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum AuthStatus {unAuthenticated, Authenticating, Authenticated}

class AuthProvider with ChangeNotifier {
  FirebaseAuth? _auth;
  User? _user;
  AuthStatus _authStatus = AuthStatus.unAuthenticated;
  String? errorMassage;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthProvider(){
    _auth = FirebaseAuth.instance;
    _auth?.authStateChanges().listen((User? user) {
      if (user == null){
        _authStatus = AuthStatus.unAuthenticated;
      }
      else {
        _user = user;
      }
      notifyListeners();
    });
  }

  AuthStatus get authStatus => _authStatus;
  User? get user => _user;

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

  Future<UserCredential> signInWithGoogle() async{
      _auth = FirebaseAuth.instance;
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,accessToken: googleAuth?.accessToken
      );

      _authStatus = AuthStatus.Authenticated;
      notifyListeners();
      return await _auth!.signInWithCredential(authCredential);
      
  }

}