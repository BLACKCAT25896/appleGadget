import 'package:flutter/material.dart';
import 'package:bikrify/util/dimensions.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message, {bool isError = true, double margin = Dimensions.paddingSizeSmall}) {
  if(message != null && message.isNotEmpty) {
    Get.showSnackbar(GetSnackBar(
      backgroundColor: isError ? Colors.red : Colors.green,
      message: message,
      duration: const Duration(seconds: 2),
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.only(
          top: Dimensions.paddingSizeSmall,
          left: Dimensions.paddingSizeSmall,
          right: Dimensions.paddingSizeSmall,
          bottom: margin),
      borderRadius: Dimensions.radiusSmall,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
    ));
  }
}