import 'package:firebase1_3/model/user.model.dart';
import 'package:firebase1_3/store/auth.store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final AuthStore authStore = Get.put(AuthStore());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO LOGIN',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 50),
            TextFormField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Enter username',
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Enter password',
              ),
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              child: Obx(
                () => Visibility(
                  visible: authStore.loading.value,
                  replacement: const Center(
                    child: CupertinoActivityIndicator(),
                  ),
                  child: const Text('Login'),
                ),
              ),
              onPressed: () {
                authStore.onUserLogin(
                  UserModel(
                    username: username.text.trim(),
                    password: password.text.trim(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
