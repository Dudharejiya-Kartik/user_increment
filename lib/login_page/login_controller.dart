import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:logger/logger.dart';

import '../routes.dart';
import '../services/firestore_service.dart';
import '../services/services.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginWithEmailAndPassword() async {
    isLoading(true);

    try {
      User? user = await AuthServices.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      if (user != null) {
        await FirestoreServices.instance.addUser(user: user);
        await FirestoreServices.instance.getUser();
        Get.offAllNamed(Routes.dashboard);
      }
    } catch (e) {
      isLoading(false);
    }
  }

  Future<void> signOut() async {
    isLoading(true);
    try {
      await AuthServices.instance.signOut();
      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
    Get.offAllNamed(Routes.login);
  }

  void toggleObscure() {
    isObscure(!isObscure.value);
  }
}
