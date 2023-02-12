import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetDialog {
  static Future showDialog({
    required String title,
    required String message,
  }) {
    return Get.defaultDialog(
      title: title,
      middleText: message,
      backgroundColor: Colors.white,
      contentPadding: const EdgeInsets.all(20),
      titleStyle: const TextStyle(color: Colors.red),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 5,
    );
  }
}
