import 'package:firebase1_3/store/auth.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AuthStore authStore = Get.put(AuthStore());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () => authStore.onLogout(),
          child: Obx(
            () => Visibility(
              visible: authStore.loading.value,
              replacement: const Center(
                child: CupertinoActivityIndicator(),
              ),
              child: const Text('LOGOUT'),
            ),
          ),
        ),
      ),
    );
  }
}
