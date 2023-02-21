import 'dart:html';
import 'package:application/screens/login_screen.dart';
import 'package:application/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'feed_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 3;
  final _pageOptions = [
    FeedScreen(),
    ChatScreen(),
    SearchScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
    print(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: (value) => _onItemTapped(value),
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.deepPurple,
            ),
            label: "home",
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.chat,
                color: Colors.deepPurple,
              ),
              label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.deepPurple,
              ),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.account_circle,
                color: Colors.deepPurple,
              ),
              label: "profile"),
        ],
      ),
    );
  }
}
