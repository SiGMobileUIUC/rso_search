import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsos/ui/login_screens/login.dart';
import 'package:rsos/ui/login_screens/register.dart';
import 'package:rsos/ui/nav_screens/profile/profile.dart';
import 'package:rsos/components/login_comp/auth_controller.dart'; // Import the AuthController

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final RxBool isRegister = false.obs;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Obx(
        () => authController.user != null
            ? const ProfilePage()
            : isRegister.value
                ? buildRegisterPage(
                    emailController, passwordController, isRegister)
                : buildLoginPage(
                    emailController, passwordController, isRegister),
      ),
    );
  }
}
