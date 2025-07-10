import 'package:flutter_demo/data/model/auth/user_data_model.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Prefs {
  static const String accessToken = 'TOKEN';
  static const String userName = 'USER_NAME';
  static const String userEmail = 'USER_EMAIL';
  static const String userPhoto = 'USER_PHOTO_URL';
}

class LocalStorage {
  LocalStorage._();

  static GetStorage box = GetStorage('localData');
  static RxString accessToken = ''.obs;
  static RxString userName = ''.obs;
  static RxString userEmail = ''.obs;
  static RxString userPhoto = ''.obs;

  static Future<void> storeUserInfo(UserInfoData? userData) async {
    await box.write(Prefs.userName, userData?.name);
    await box.write(Prefs.userEmail, userData?.email);
    await box.write(Prefs.userPhoto, userData?.photoUrl);

    userName.value = box.read(Prefs.userName) ?? 'User';
    userEmail.value = box.read(Prefs.userEmail) ?? 'Email';
    userPhoto.value = box.read(Prefs.userPhoto) ?? 'Photo';
  }

  static Future<void> storeToken(UserInfoData? tokenId) async {
    if (!isValEmpty(tokenId?.tokenId?.token)) {
      await box.write(Prefs.accessToken, tokenId!.tokenId?.token ?? '');
      accessToken.value = box.read(Prefs.accessToken) ?? '';
    }
    printWhite('token : ${accessToken.value}');
  }

  static Future<void> clearData() async {
    await box.erase();
  }

  static bool get isLoggedIn {
  final token = box.read(Prefs.accessToken);
  return token != null && token.toString().isNotEmpty;
}
}
