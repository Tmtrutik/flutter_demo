import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxString selectedMethod = 'card'.obs;
  RxString cardNumber = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cvv = ''.obs;

  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderNameController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  void selectMethod(String method) {
    selectedMethod.value = method;
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    cardHolderNameController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  // bool validate() {
  //   bool isValid = true;
  //   cardNumberError.value = '';
  //   if (cardNumberController.text.isEmpty) {
  //     cardNumberError.value = 'Please enter your card number';
  //     isValid = false;
  //   }
  // }
}