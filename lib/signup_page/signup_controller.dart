import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../services/services.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isObscure = true.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void toggleObscure() {
    isObscure(!isObscure.value);
  }

  void signUpWithEmailAndPassword() async {
    isLoading(true);
    await AuthServices.instance.signUpWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    Get.offAllNamed(Routes.login);

    isLoading(false);
  }
}
