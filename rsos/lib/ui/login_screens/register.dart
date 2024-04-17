import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Widget buildRegisterPage(
  TextEditingController emailController,
  TextEditingController passwordController,
  RxBool isRegister,
) {
  void registerUser() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Navigate to the ProfilePage after successful registration
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  return Container(
    color: Colors.lightBlue[200],
    child: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 40),
              ),
              const SizedBox(height: 50),
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: registerUser,
                        child: const Text("Register"),
                      ),
                      const SizedBox(height: 16.0),
                      GestureDetector(
                        onTap: () {
                          isRegister.value = false;
                        },
                        child: const Text(
                          "Already Registered? Login now",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
