import 'package:flutter/material.dart';
import 'package:database/pages/profile.dart';



class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedTab = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Главная'
    ),
    Text(
      'Рейтинг'
    ),
    Text(
      'Моя карта'
    ),
    ProfilePage()

  ];


  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
        _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedTab]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'Рейтинг'), 
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Моя карта'),
        BottomNavigationBarItem(icon: Icon(Icons.manage_accounts), label: 'Профиль'), 
      ],
      onTap:onSelectTab
      ),
      
    );
  }
}