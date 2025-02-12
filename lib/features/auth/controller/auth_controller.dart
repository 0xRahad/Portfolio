import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/utils/my_snack_bar.dart';

import '../../../core/route/routes.dart';

class AuthController extends GetxController {
  final RxBool isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;

  void loginUser() async {
    try {
      isLoading.value = true;
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading.value = false;
      mySnackBar(title: "Success", body: "Login successful!");
      Get.offAllNamed(Routes.homePage);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'user-not-found') {
        mySnackBar(title: "Error", body: "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        mySnackBar(title: "Error", body: "Wrong password provided.");
      } else {
        mySnackBar(title: "Error", body: e.message ?? "Login failed.");
      }
    } catch (e) {
      isLoading.value = false;
      mySnackBar(title: "Error", body: e.toString());
    }
  }

  void signup() async {
    try {
      isLoading.value = true;
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading.value = false;
      mySnackBar(title: "Success", body: "Signup successful!");
      Get.offAllNamed(Routes.homePage);
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      if (e.code == 'weak-password') {
        mySnackBar(title: "Error", body: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        mySnackBar(title: "Error", body: "The account already exists for that email.");
      } else {
        mySnackBar(title: "Error", body: e.message ?? "Signup failed.");
      }
    } catch (e) {
      isLoading.value = false;
      mySnackBar(title: "Error", body: e.toString());
    }
  }
}
