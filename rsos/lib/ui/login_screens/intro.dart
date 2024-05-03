import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:rsos/ui/login_screens/login.dart';
import 'package:rsos/ui/login_screens/register.dart';
import 'register.dart';
import 'package:introduction_screen/introduction_screen.dart'; 


class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  @override
  IntroPageState createState() => IntroPageState();
}

class IntroPageState extends State<IntroPage> {
  // const IntroPage({super.key});
  bool _visible = true;

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  void _onIntroEnd2(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const RegisterPage()),
    );
  }

  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 65.0, fontWeight: FontWeight.w900, color: Colors.white),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Color(0xFF81D4FA),
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      // globalBackgroundColor:Colors.lightBlue[200],
      pages: [
        PageViewModel(
          title: "Welcome to RSO Search!",
          bodyWidget: Center(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                "assets/logo_spin_large.gif",
                height: 400.0,
                width: 400.0,
                ),
              ),
              const SizedBox(width: 20), // Add some space between the image and text
              const Expanded(
                child: Text(
                  "This is a Spring 2024 SIGMobile Project where we seek to connect UIUC students better through an easier way to search of University RSO's through an app.\n\n ",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400, color: Colors.white),
                ),
              ),
              // const Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Expanded(
              //       child: Text(
              //         "Welcome to RSO Search!\n",
              //         style: TextStyle(fontSize: 50.0, color: Colors.white),
              //       ),
              //     ),
              //     Expanded(
              //       child: Text(
              //         "This is a Spring 2024 SIGMobile Project where we seek to connect UIUC students better through an easier way to search of University RSO's through an app.\n\n ",
              //         style: TextStyle(fontSize: 20.0, color: Colors.white),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
        decoration: pageDecoration,
        ),
      ],
      showNextButton: false,
      showSkipButton: true,
      showDoneButton: true,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd2(context),
      done: const Text("Login"), 
      skip: const Text("Register"), 
    );
  }
}
