// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meet_space/widgets/app_snackbar.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;
  Stream<User?> get authChanges => _auth.authStateChanges();

  // Sign in with Google and store user details in Firestore
  Future<bool> signInWithGoogle(BuildContext context) async {
    bool result = false;
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        // Obtain the auth details from the Google Sign-In
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        // Create a new credential using the Google ID token and access token
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google credential
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Get the user details
        final User? user = userCredential.user;

        if (user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            _firestore.collection('users').doc(user.uid).set({
              // Store user details in Firestore
              'uid': user.uid,
              'email': user.email,
              'displayName': user.displayName,
              'photoURL': user.photoURL,
              // Add additional user details as needed
            });
          }
        }
        result = true;
      }
    } on FirebaseAuthException catch (e) {
      AppSnackBar().showSnackBar(
        context: context,
        text: e.message.toString(),
        duration: 2,
      );
      result = false;
    } catch (e) {
      AppSnackBar().showSnackBar(
        context: context,
        text: e.toString(),
        duration: 2,
      );
    }
    return result;
  }

  // sign out the current user
  Future<bool> signOut(BuildContext context) async {
    bool result = false;
    try {
      // sign out from firebase authentication
      await _auth.signOut();
      // sign out form google sign in
      await _googleSignIn.signOut();
      result = true;
    } on FirebaseAuthException catch (e) {
      AppSnackBar().showSnackBar(
        context: context,
        text: e.message.toString(),
        duration: 2,
      );
      result = false;
    } catch (e) {
      AppSnackBar().showSnackBar(
        context: context,
        text: e.toString(),
        duration: 2,
      );
    }
    return result;
  }
}
