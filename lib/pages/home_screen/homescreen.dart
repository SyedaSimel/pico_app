import 'package:flutter/material.dart';
import 'package:pica_app_project/bottombar.dart';
import 'package:pica_app_project/pages/profile_screen/profile_main.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    ProfileMain(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              bottom: 80,
              child: _screens[_selectedIndex],
            ),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavBar(
                selectedIndex: _selectedIndex,
                onItemTapped: _onItemTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }
}