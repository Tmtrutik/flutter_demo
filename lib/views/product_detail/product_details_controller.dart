import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  

  ///product detail model
  HomeProductModel product = HomeProductModel();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments['product'].runtimeType == HomeProductModel) {
        product = Get.arguments['product'];
      }
    }
  }
}
