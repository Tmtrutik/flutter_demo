import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/data/api/api_function.dart';
import 'package:flutter_demo/data/handler/api_urls.dart';
import 'package:flutter_demo/utils/color_print.dart';
import 'package:flutter_demo/utils/utils.dart';
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
        final GoogleSignIn googleSignIn = GoogleSignIn.standard(scopes: <String>['email']);
        await googleSignIn.signOut();
        final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
        if (googleUser == null) {
          printWhite(' Google Sign-In cancelled by user');
          return;
        }
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        if (isValEmpty(googleAuth.idToken) || isValEmpty(googleAuth.accessToken)) {
          printWhite(' Missing Google ID or Access token');
          return;
        }
        final OAuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
        final UserCredential firebaseUser = await FirebaseAuth.instance.signInWithCredential(credential);
        printWhite('Google Sign-In successful: ${firebaseUser.user?.displayName}');
        if (onSuccess != null) {
          onSuccess(firebaseUser);
        }
      } catch (e) {
        printWhite(' Google Sign-In Error: ${e.toString()}');
      } finally {
        isLoader?.value = false;
      }
    }
  }

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
