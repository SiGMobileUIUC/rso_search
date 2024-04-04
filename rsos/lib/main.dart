import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:rsos/ui/login_screens/login.dart';
import 'package:rsos/ui/nav_screens/navigation/nav_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RSO Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
    );
  }
}
