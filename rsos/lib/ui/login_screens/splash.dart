import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rsos/ui/login_screens/login.dart';
import 'package:rsos/ui/login_screens/register.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(Duration(milliseconds: 2250), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF81D4FA),
      body: Center(
        child: Image.asset(
              "assets/splash_anim.gif",
              height: 400.0,
              width: 400.0,
              ),
        ),
      );
  }
}
