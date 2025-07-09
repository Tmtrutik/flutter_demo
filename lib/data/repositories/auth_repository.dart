import 'package:flutter/material.dart';
import 'package:flutter_demo/data/api/api_function.dart';
import 'package:flutter_demo/data/handler/api_urls.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:get/get.dart';

class AuthRepository {
  AuthRepository._();

  /// ***********************************************************************************
  /// *                                    GET METHOD                                    *
  /// ***********************************************************************************

  /// ***********************************************************************************
  /// *                                    POST METHOD                                    *
  /// ***********************************************************************************

  static Future<void> loginUserApi(
    BuildContext context, {
    RxBool? isLoader,
    bool isInitial = true,
    String? email,
    String? password,
    Function(Map<String, dynamic>)? onSuccess,
  }) async {
    if (await getConnectivityResult(isLoader: isLoader)) {
      try {
        isLoader?.value = true;
        await ApiFunction.postApiCall(apiName: ApiUrls.userLoginUrl, body: {
          if (!isValEmpty(email)) 'email': email,
          if (!isValEmpty(password)) 'password': password,
        }).then((response) {
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

  /// ***********************************************************************************
  /// *                                    PUT METHOD                                    *
  /// ***********************************************************************************

  /// ***********************************************************************************
  /// *                                    DELETE METHOD                                 *
  /// ***********************************************************************************
}
