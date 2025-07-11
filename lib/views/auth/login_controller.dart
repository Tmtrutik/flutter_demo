import 'package:flutter/material.dart';
import 'package:flutter_demo/data/model/user_model/user_model.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final RxString email = ''.obs;
  final RxString password = ''.obs;
  final RxString emailError = ''.obs;
  final RxString passwordError = ''.obs;
  RxBool isLoading = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RxList<Users> userList = <Users>[].obs;

  bool validate() {
    bool isValid = true;
    emailError.value = '';
    passwordError.value = '';

    if (emailController.text.isEmpty) {
      emailError.value = 'Please enter your email';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = 'Please enter your password';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    }

    return isValid;
  }
}
