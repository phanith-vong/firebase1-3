import 'package:firebase1_3/model/user.model.dart';
import 'package:firebase1_3/screen/home_screen.dart';
import 'package:firebase1_3/screen/login.screen.dart';
import 'package:firebase1_3/service/auth.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../widget/get.dialog.dart';

class AuthStore extends GetxController {
  final AuthService authService = AuthService();
  RxBool loading = true.obs;

  void onUserLogin(UserModel user) async {
    try {
      await authService.login(user);
      loading.value = false;
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(HomeScreen());
      loading.value = true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        GetDialog.showDialog(
          title: 'Login Error',
          message: 'The password provided is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        GetDialog.showDialog(
          title: 'Login Error',
          message: 'The account already exists for that email.',
        );
      } else {
        GetDialog.showDialog(
          title: 'Login Error',
          message: 'Something went wrong...',
        );
      }
    } catch (e) {
      GetDialog.showDialog(
        title: 'Login Error',
        message: e.toString(),
      );
    }
  }

  void onCheckUser() async {
    await Future.delayed(const Duration(seconds: 2));
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.offAll(LoginScreen());
      } else {
        Get.offAll(HomeScreen());
      }
    });
  }

  void onLogout() async {
    loading(false);
    await Future.delayed(const Duration(seconds: 2));
    authService.logout().then((value) {
      Get.offAll(LoginScreen());
      loading(true);
    });
  }
}
