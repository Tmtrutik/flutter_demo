import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  RxString selectedMethod = 'card'.obs;
  RxString cardNumber = ''.obs;
  RxString cardHolderName = ''.obs;
  RxString expiryDate = ''.obs;
  RxString cvv = ''.obs;
  RxString cardNumberError = ''.obs;
  RxString cardHolderError = ''.obs;
  RxString expiryDateError = ''.obs;
  RxString cvvError = ''.obs;

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

  bool validate() {
    bool isValid = true;
    cardNumberError.value = '';
    cardHolderError.value = '';
    expiryDateError.value = '';
    cvvError.value = '';

    if (cardNumberController.text.isEmpty) {
      cardNumberError.value = 'Card number is required';
      isValid = false;
    } else if (cardNumberController.text.length < 16) {
      cardNumberError.value = 'Enter a valid card number';
    }

    if(cardHolderNameController.text.isEmpty) {
      cardHolderError.value = 'Please enter your name';
      isValid = false;
    }

    if (expiryDateController.text.isEmpty) {
      expiryDateError.value = 'Enter valid expiration date';
      isValid = false;
    }

    if (cvvController.text.isEmpty) {
      cvvError.value = 'CVV is required';
      isValid = false;
    }
    return isValid;
  }
}
