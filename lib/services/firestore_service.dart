import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:logger/logger.dart';
import 'package:user_increment/services/services.dart';

class FirestoreServices {
  static final instance = FirestoreServices._();
  FirestoreServices._();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userCollection = "user collection";
  Logger logger = Logger();

  Future<void> getUser() async {
    try {
      DocumentSnapshot snapshot = await firestore
          .collection(userCollection)
          .doc(AuthServices.instance.auth.currentUser!.email)
          .get();
    } catch (e) {
      logger.e("error");
    }
  }

  Future<void> addUser({required User user}) async {
    Map<String, dynamic> data = {
      'uid': user.uid,
      'displayName': user.displayName ?? "DEMO USER",
      'email': user.email ?? "demo_mail",
      'phoneNumber': user.phoneNumber ?? "NO DATA",
      'photoURL': user.photoURL ??
          "https://static.vecteezy.com/system/resources/previews/002/318/271/non_2x/user-profile-icon-free-vector.jpg",
    };
    try {
      await firestore.collection(userCollection).doc(user.email).set(data);
    } catch (e) {
      Get.snackbar('User Add Error', e.toString(),
          colorText: Colors.white, backgroundColor: Colors.red);
    }
  }

  Future<void> loadValue() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (doc.exists) {
        var value = doc.data()?['value'] ?? 0;
      }
    }
  }
}
