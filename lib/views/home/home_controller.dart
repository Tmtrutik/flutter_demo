import 'package:flutter/material.dart';
import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:flutter_demo/data/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<String> brands = <String>['Adidas', 'Nike', 'Gucci', 'Vans', 'Converse'].obs;
  RxString selectedBrand = 'Adidas'.obs;
  RxBool isLoading = false.obs;
  RxString searchQuery = ''.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<HomeProductModel> productInfo = <HomeProductModel>[].obs;

  TextEditingController searchController = TextEditingController();
  TextEditingController productName = TextEditingController();
  TextEditingController productPrice = TextEditingController();
  TextEditingController productRating = TextEditingController();
  TextEditingController productImageUrl = TextEditingController();

  /// Pagination
  ScrollController scrollController = ScrollController();
  RxInt page = 1.obs;
  RxInt itemLimit = 10.obs;
  RxBool nextPageAvailable = true.obs;
  RxBool paginationLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
    // manageScrollController();
  }

  /// Returns filtered list of products based on the search query
  List<HomeProductModel> get filteredProducts {
    if (searchQuery.isEmpty) return productInfo;
    return productInfo.where((product) => product.name?.toLowerCase().contains(searchQuery.value.toLowerCase()) ?? false).toList();
  }

  /// Call this method on text change
  void onSearchChanged(String query) {
    searchQuery.value = query;
  }

  void fetchData() async {
    await HomeRepository.getProductApi(isInitial: true, isLoader: isLoading);
  }

  void selectBrand(String brand) {
    selectedBrand.value = brand;
  }

  // void manageScrollController() async {
  //   scrollController.addListener(
  //     () async {
  //       if (scrollController.position.maxScrollExtent == scrollController.position.pixels) {
  //         if (nextPageAvailable.isTrue && paginationLoading.isFalse) {
  //           /// Pagination API
  //           await HomeRepository.getProductApi(isInitial: true, isLoader: isLoading);
  //         }
  //       }
  //     },
  //   );
  // }
}
