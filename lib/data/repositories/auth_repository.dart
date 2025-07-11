import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/data/api/api_function.dart';
import 'package:flutter_demo/data/handler/api_urls.dart';
import 'package:flutter_demo/data/model/auth/user_data_model.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/local_storage.dart';
import 'package:flutter_demo/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  AuthRepository._();

  // ***********************************************************************************
  /// *                              SIGN IN WITH GOOGLE                                *
  /// ***********************************************************************************

  static Future<void> signInWithGoogle({RxBool? isLoader, Function(UserCredential)? onSuccess}) async {
    if (await getConnectivityResult(isLoader: isLoader)) {
      try {
        isLoader?.value = true;
        final GoogleSignIn googleSignIn = GoogleSignIn(
          scopes: <String>['email'],
          serverClientId: '78855505390-dehk4tjr6e19hsdeqoll82jh6tig9v76.apps.googleusercontent.com',
        );
        await googleSignIn.signOut();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        printWhite(googleUser.toString());
        if (googleUser == null) {
          Fluttertoast.showToast(msg: 'SignIn cancle by User');
          return;
        }
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        if (isValEmpty(googleAuth.idToken) || isValEmpty(googleAuth.accessToken)) {
          Fluttertoast.showToast(msg: 'Missing Google ID or Access token');
          return;
        }
        final userData = UserInfoData(name: googleUser.displayName, email: googleUser.email, photoUrl: googleUser.photoUrl, tokenId: Access(token: googleAuth.accessToken));

        final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential firebaseUser = await FirebaseAuth.instance.signInWithCredential(credential);
        await LocalStorage.storeUserInfo(userData);
        await LocalStorage.storeToken(userData);
        Fluttertoast.showToast(msg: 'Welcome ${firebaseUser.user?.displayName}');
        if (onSuccess != null) {
          onSuccess(firebaseUser);
        }
      } catch (e) {
        printWhite(' Google Sign-In Error: ${e.toString()}');
        Fluttertoast.showToast(msg: ' Google Sign-In Error: ${e.toString()}');
      } finally {
        isLoader?.value = false;
      }
    }
  }

  // ************************************************************************************
  /// *                              SIGN OUT WITH GOOGLE                               *
  /// ***********************************************************************************

  static Future<void> signOutWithGoogle({RxBool? isLoader}) async {
    if (await getConnectivityResult(isLoader: isLoader)) {
      try {
        isLoader?.value = true;
        final GoogleSignIn googleSignIn = GoogleSignIn();
        await googleSignIn.signOut();
        isLoader?.value = false;
        printWhite('Google Sign-Out successful');
      } catch (e) {
        isLoader?.value = false;
        Fluttertoast.showToast(msg: 'Google Sign-Out Error: ${e.toString()}');
      }
    }
  }

  /// ***********************************************************************************
  /// *                                    GET METHOD                                   *
  /// ***********************************************************************************

  /// ***********************************************************************************
  /// *                                    POST METHOD                                  *
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
