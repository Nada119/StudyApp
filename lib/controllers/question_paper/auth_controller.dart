import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/firebase_ref/refrences.dart';
import 'package:flutter_application_2/screens/splash/home/home_screen.dart';
import 'package:flutter_application_2/screens/splash/login/login_screen.dart';
import 'package:flutter_application_2/widgets/dialogs/dialog_widget.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    initAuth();
    super.onReady();
  }

  late FirebaseAuth _auth;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));
    _auth = FirebaseAuth.instance;
    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });
    navigateToIntroduction();
  }

  signInWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _authAccount = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _authAccount.idToken,
            accessToken: _authAccount.accessToken);
        await _auth.signInWithCredential(_credential);
        await saveUser(account);
        navigateToHomePage();
      }
    } on Exception catch (error) {
      //AppLogger.e(error);
      print("Error signing in with Google: $error");
    }
  }

  User? getUser() {
    _user.value = _auth.currentUser;
    return _user.value;
  }

  saveUser(GoogleSignInAccount account) {
    userRF.doc(account.email).set({
      "email": account.email,
      "name": account.displayName,
      "profilepic": account.photoUrl,
    });
  }

  Future<void> signOut() async {
    print('Sign out');
    try {
      await _auth.signOut();
      navigateToHomePage();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void navigateToIntroduction() {
    Get.offAllNamed("/introduction");
  }

  navigateToHomePage() {
    Get.offAllNamed(HomeScreen.routeName);
  }

  void showLoginAlertDialog() {
    Get.dialog(Dialogs().questionStartDialog(onTap: () {
      Get.back();
      navigatetoLoginPage();
    }));
  }

  void navigatetoLoginPage() {
    Get.toNamed(
        LoginScreen.routeName); //static variable acessed using class directly
  }

  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
