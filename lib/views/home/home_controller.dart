import 'package:flutter/material.dart';
import 'package:flutter_demo/utils/app_assets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> brands = <String>['Adidas', 'Nike', 'Gucci', 'Vans', 'Converse'].obs;
  RxString selectedBrand = 'Adidas'.obs;

  final RxList<Map<String, dynamic>> featuredProducts = <Map<String, dynamic>>[
    {
      'name': 'Nike Air Max',
      'price': '\$350',
      'rating': 4.8,
      'image': AppAssets.sneakers1Jpg,
      'imageAlignment': Alignment.center,
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

  void selectBrand(String brand) {
    selectedBrand.value = brand;
  }
}
