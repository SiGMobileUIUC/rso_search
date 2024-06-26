import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
}