import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:portfolio/core/utils/my_snack_bar.dart';
import 'package:portfolio/features/auth/controller/auth_controller.dart';

import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_text_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final controller = Get.find<AuthController>();

    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Sign up to continue your journey with us.",
                ),
                const Gap(20),

                /// Email Field
                CustomTextField(
                  controller: controller.emailController,
                  hintText: "Email Address",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email is required";
                    } else if (!GetUtils.isEmail(value.trim())) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
                const Gap(10),

                /// Password Field
                CustomTextField(
                  controller: controller.passwordController,
                  hintText: "Password",
                  isTextObscured: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required";
                    } else if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                const Gap(20),
                /// signup Button
                Obx(
                  () => CustomButton(
                    height: 50,
                    isLoading: controller.isLoading.value,
                    buttonText: "Sign up",
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        controller.signup();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
