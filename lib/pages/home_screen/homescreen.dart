import 'package:flutter/material.dart';
import 'package:pica_app_project/bottombar.dart';
import 'package:pica_app_project/pages/profile_screen/profile_main.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 4;

  final List<Widget> _pages = [
    // Center(child: Text("Documents Page", style: TextStyle(fontSize: 24))),
    Placeholder(),
    Center(child: Text("Messages Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Home Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("Search Page", style: TextStyle(fontSize: 24))),
    ProfileMain(),
  ];

  void _onItemTapped(int index) {
    print("Selected Index: $index"); // Debugging
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
