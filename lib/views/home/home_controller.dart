import 'package:flutter/material.dart';
import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:flutter_demo/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> brands = <String>['Adidas', 'Nike', 'Gucci', 'Vans', 'Converse'].obs;
  RxString selectedBrand = 'Adidas'.obs;
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<HomeProductModel> productInfo = <HomeProductModel>[].obs;

  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productRating = TextEditingController();
  TextEditingController productImageUrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    await HomeRepository.getProductApi(isInitial: true, isLoader: isLoading);
  }

  void selectBrand(String brand) {
    selectedBrand.value = brand;
  }
}
