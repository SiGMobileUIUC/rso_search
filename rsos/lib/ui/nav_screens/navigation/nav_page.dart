import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rsos/ui/login_screens/auth.dart';
import 'package:rsos/ui/nav_screens/feed/feed.dart';
import 'package:rsos/ui/nav_screens/home/home.dart';
import 'package:rsos/ui/nav_screens/profile/profile.dart';
import 'package:rsos/ui/nav_screens/settings/settings.dart';
import 'package:rsos/components/nav_comp/nav_bar/bot_nav_bar.dart';
import 'package:rsos/components/nav_comp/nav_bar/bot_nav_bar_controller.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final BotNavBarController navBarController = Get.put(BotNavBarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SafeArea(
              child: Obx(() => IndexedStack(
                index: navBarController.navIndex.value,
                children: const [
                  FeedPage(),
                  HomePage(title: "Home Page"),
                  AuthPage(),
                  SettingsPage(),
                ],
              )),
            ),
          ],
        ),
        bottomNavigationBar: Obx(() => CustomBottomNavigationBar(
          currentIndex: navBarController.navIndex.value,
          onTap: navBarController.changeNavPage,
        )),
      ),
    );
  }
}