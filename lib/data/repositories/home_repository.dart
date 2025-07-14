 import 'package:flutter_demo/data/api/api_function.dart';
import 'package:flutter_demo/data/handler/api_urls.dart';
import 'package:flutter_demo/data/model/home/home_product_model.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:flutter_demo/views/home/home_controller.dart';
import 'package:get/get.dart';

class HomeRepository {
  /// ***********************************************************************************
  /// *                                    GET METHOD                                    *
  /// ***********************************************************************************

  static Future<void> getProductApi({
    RxBool? isLoader,
    bool isInitial = true,
    Function(Map<String, dynamic>)? onSuccess,
  }) async {
    if (await getConnectivityResult(isLoader: isLoader)) {
      if (Get.isRegistered<HomeController>()) {
        final HomeController con = Get.find<HomeController>();
        try {
          isLoader?.value = true;
          await ApiFunction.getApiCall(
            apiName: ApiUrls.productUrl,
            showErrorToast: false,
          ).then((response) {
            if (response != null && response is List) {
              final getProduct = response.map((item) => HomeProductModel.fromJson(item)).toList();
              if (getProduct.isNotEmpty) {
                con.productInfo.assignAll(getProduct);
              }
            }
          });
        } catch (e) {
          printWhite(e.toString());
        } finally {
          isLoader?.value = false;
        }
      }
    }
  }

  /// ***********************************************************************************
  /// *                                    POST METHOD                                    *
  /// ***********************************************************************************

  static Future<void> postProductApi({RxBool? isLoader, bool? isInitial, Function(Map<String, dynamic>)? onSuccess}) async {
    if (await getConnectivityResult(isLoader: isLoader)) {
      if (Get.isRegistered<HomeController>()) {
        final HomeController con = Get.find<HomeController>();
        try {
          isLoader?.value = true;

          await ApiFunction.postApiCall(
            apiName: ApiUrls.addProductUrl,
            showErrorToast: false,
            body: {
              'name': con.productName.value.text,
              'price': con.productPrice.value.text,
              'rating': con.productRating.value.text,
              'image': con.productImageUrl.value.text,
            },
          ).then((response) {
            if (response != null && onSuccess != null) {
              onSuccess(response as Map<String, dynamic>);
            }
          });
        } catch (e) {
          printWhite(e.toString());
        } finally {
          isLoader?.value = false;
        }
      }
    }
  }

  /// ***********************************************************************************
  /// *                                    PUT METHOD                                    *
  /// ***********************************************************************************
  /// ***********************************************************************************
  /// *                                    DELETE METHOD                                 *
  /// ***********************************************************************************
}
