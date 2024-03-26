import 'package:flutter/material.dart';
import 'package:rsos/ui/nav_screens/feed/feed.dart';
import 'package:rsos/ui/nav_screens/home/home.dart';
import 'package:rsos/ui/nav_screens/navigation/nav_bar.dart';
import 'package:rsos/ui/nav_screens/profile/profile.dart';
import 'package:rsos/ui/nav_screens/settings/settings.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: IndexedStack(
              index: _selectedIndex,
              children: const [
                FeedPage(),
                HomePage(title: "Home Page"),
                ProfilePage(),
                SettingsPage(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}