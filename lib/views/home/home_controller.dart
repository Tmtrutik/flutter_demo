import 'package:flutter/material.dart';
import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:flutter_demo/data/repositories/home_repository.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> brands = <String>['Adidas', 'Nike', 'Gucci', 'Vans', 'Converse'].obs;
  RxString selectedBrand = 'Adidas'.obs;
  RxBool isLoading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productRating = TextEditingController();
  TextEditingController productImageUrl = TextEditingController();

  final RxList<HomeProductModel> productInfo = <HomeProductModel>[].obs;
  final RxList<Map<String, dynamic>> featuredProducts = <Map<String, dynamic>>[
    {
      'name': 'Nike Air Max',
      'price': '\$350',
      'rating': 4.8,
      'image': AppAssets.sneakers1Jpg,
    },
    {
      'name': 'Red Color Vans',
      'price': '\$200',
      'rating': 4.6,
      'image': AppAssets.sneakers2Jpg,
    },
    {
      'name': 'Adidas Ultra',
      'price': '\$280',
      'rating': 4.7,
      'image': AppAssets.sneakers3Jpg,
    }
  ].obs;
  @override
  void onInit() {
    super.onInit();
    HomeRepository.getProductApi(isInitial: true, isLoader: isLoading);
  }

  void selectBrand(String brand) {
    selectedBrand.value = brand;
  }
}
