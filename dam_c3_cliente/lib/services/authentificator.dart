import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentificator {
  // ignore: body_might_complete_normally_nullable
  static Future<User?> iniciarSesion({required BuildContext context}) async {
    FirebaseAuth authentificator = FirebaseAuth.instance;
    User? user;

    GoogleSignIn objGoogleSignIn = GoogleSignIn();

    GoogleSignInAccount? objGoogleSignInAccount =
        await objGoogleSignIn.signIn();
    if (objGoogleSignInAccount != null) {
      GoogleSignInAuthentication objGoogleSignInAuthentication =
          await objGoogleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: objGoogleSignInAuthentication.accessToken,
        idToken: objGoogleSignInAuthentication.idToken,
      );
      try {
        UserCredential userCredential =
            await authentificator.signInWithCredential(credential);

        user = userCredential.user;
        return user;
        // ignore: unused_catch_clause
      } on FirebaseAuthException catch (e) {
        print('Error en la autentificacion');
      }
    }
  }

  Future<void> signOutGoogle() async {
    GoogleSignIn objGoogleSignIn = GoogleSignIn();
    await objGoogleSignIn.signOut();
  }
}
