import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      color: Colors.transparent,
      child: Center(
        child: Material(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color(0xFF4DA04D),
                ),
                strokeWidth: 3,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
