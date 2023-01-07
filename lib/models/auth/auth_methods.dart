import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotify/screens/music/intro_music.dart';

class AuthMethods {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  signInWithGoogle(context) async {
    final GoogleSignInAccount? googleUser =
        GoogleSignIn().signIn() as GoogleSignInAccount?;
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    await firebaseAuth.signInWithCredential(credentials).whenComplete(() => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const IntroMusic()))),
          log('Sign in successful')
        });
  }
}
