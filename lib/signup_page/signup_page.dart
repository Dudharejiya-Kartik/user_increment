import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:user_increment/signup_page/signup_controller.dart';

import '../common_widget/loading_view.dart';
import '../constant.dart';
import '../routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpController signUpController = Get.put(SignUpController());
    Size size = MediaQuery.sizeOf(context);
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
                    SizedBox(height: size.height * 0.1),
                    const Text(
                      'Create \nyour  account',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: size.height * 0.1),
                    TextFormField(
                      controller: signUpController.emailController,
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
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextField(
                      controller: signUpController.passwordController,
                      obscureText: signUpController.isObscure.value,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: secondaryColor,
                        ),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: signUpController.toggleObscure,
                          icon: signUpController.isObscure.value
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
                    GestureDetector(
                      onTap: signUpController.signUpWithEmailAndPassword,
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
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
                              height: 30,
                              width: 30,
                              googleLogo,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Padding(
                            padding: const EdgeInsets.only(),
                            child: Image.asset(
                              height: 30,
                              width: 30,
                              fbLogo,
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
                              microsoftLogo,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(Routes.login);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: secondaryColor,
                            ),
                          ),
                          Text(
                            ' Login',
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
              if (signUpController.isLoading.value) const LoadingView(),
            ],
          ),
        ),
      ),
    );
  }
}
