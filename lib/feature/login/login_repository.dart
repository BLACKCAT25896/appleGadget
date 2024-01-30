import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_boilerplate/data/api_client.dart';
import 'package:flutter_boilerplate/util/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> login({required String phone, required String password}) async {
    return await apiClient.postData(AppConstants.loginUri, {"login": phone, "password": password});
  }

  Future<Response?> getProfileInfo({required String phone, required String token}) async {
    return await apiClient.postData(AppConstants.profileInfo, {"login": phone, "token": token});
  }

  Future<Response?> getOpenTrades({required String phone, required String token}) async {
    return await apiClient.postData(AppConstants.getOpenTrad, {"login": phone, "token": token});
  }

  Future<Response?> logOut() async {
    return await apiClient.postData(AppConstants.logout, {});}



  Future<Response?> updateToken() async {
    String? deviceToken;
    if (GetPlatform.isIOS && !GetPlatform.isWeb) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true);
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
        alert: true, announcement: false, badge: true, carPlay: false,
        criticalAlert: false, provisional: false, sound: true,
      );
      if(settings.authorizationStatus == AuthorizationStatus.authorized) {
        deviceToken = await _saveDeviceToken();
      }
    }else {
      deviceToken = await _saveDeviceToken();
    }

    if(!GetPlatform.isWeb){

      FirebaseMessaging.instance.subscribeToTopic(AppConstants.topic);

    }
    return await apiClient.postData(AppConstants.fcmTokenUpdate, {"_method": "put", "fcm_token": deviceToken});
  }

  Future<String?> _saveDeviceToken() async {
    String? deviceToken = '@';
    try {
      deviceToken = await FirebaseMessaging.instance.getToken();
    }catch(e) {
      if (kDebugMode) {
        print('--------Device Token---------- $deviceToken');
      }
    }
    if (deviceToken != null) {
      if (kDebugMode) {
        print('--------Device Token---------- $deviceToken');
      }
    }
    return deviceToken;
  }




  Future<bool?> saveUserToken(String token) async {
    apiClient.updateHeader(token, null, null, null, "" );
    return await sharedPreferences.setString(AppConstants.token, token);

  }


  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstants.token);
    return true;
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.userPassword, password);
      await sharedPreferences.setString(AppConstants.userNumber, number);

    } catch (e) {
      rethrow;
    }
  }

  String getUserNumber() {
    return sharedPreferences.getString(AppConstants.userNumber) ?? "";
  }



  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.userPassword) ?? "";

  }



  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.userPassword);
    return await sharedPreferences.remove(AppConstants.userNumber);
  }

}
