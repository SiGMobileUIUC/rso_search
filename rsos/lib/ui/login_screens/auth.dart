import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rsos/ui/login_screens/login.dart';
import 'package:rsos/ui/nav_screens/home/home.dart';
import 'package:rsos/ui/nav_screens/profile/profile.dart';
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override 
  Widget build(BuildContext context) {
    return Scaffold( 
      body: StreamBuilder<User?> ( 
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ProfilePage();
          }
          else {
            return LoginPage();
          }
        }
      )
    );
  }
}