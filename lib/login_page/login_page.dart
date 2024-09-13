import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../common_widget/loading_view.dart';
import '../constant.dart';
import '../routes.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    Size size = MediaQuery.sizeOf(context);
    GlobalKey<FormState> emailKey = GlobalKey<FormState>();
    GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
    return Obx(
      () => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(),
          ),
          body: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(defaulPadding + 5),
                height: size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgPath),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Login into\nyour account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: size.height * 0.1),
                    Form(
                      child: TextFormField(
                        controller: loginController.emailController,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: secondaryColor,
                          ),
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Form(
                      child: TextFormField(
                        controller: loginController.passwordController,
                        obscureText: loginController.isObscure.value,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: secondaryColor,
                          ),
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: loginController.toggleObscure,
                            icon: loginController.isObscure.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.06),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.dashboard);
                        },
                        child: const Text('Login'),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.asset(
                              height: 26,
                              width: 26,
                              microsoftLogo,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.asset(
                              height: 26,
                              width: 26,
                              'assets/images/apple_logo.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        log('register Tapped');
                        Get.offAllNamed(Routes.register);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don\'t have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: secondaryColor,
                            ),
                          ),
                          Text(
                            ' Register',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (loginController.isLoading.value) const LoadingView(),
            ],
          ),
        ),
      ),
    );
  }
}
