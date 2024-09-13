import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';

import '../constant.dart';

class AuthServices {
  AuthServices._();

  static final instance = AuthServices._();

  FirebaseAuth auth = FirebaseAuth.instance;
  User? currentUser;

  Future<User?> signInWithEmailAndPassword({
    required email,
    required password,
  }) async {
    try {
      currentUser = null;
      UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Success", "User logged in successfully",
          colorText: Colors.white, backgroundColor: primaryColor);

      currentUser = credential.user;
      return credential.user;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
      return null;
    }
  }

  signUpWithEmailAndPassword({required email, required password}) async {
    try {
      currentUser = null;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar("Success", "User created successfully",
          colorText: Colors.white, backgroundColor: primaryColor);

      return credential.user;
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
      return null;
    }
  }

  signOut() async {
    await auth.signOut();
  }
}
