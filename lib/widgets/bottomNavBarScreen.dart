import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/screens/SettingsScreen.dart';
import 'file:///D:/Flutter_projects/flutter_phone_authentication-main/lib/homeScreen.dart';
import '../screens/loginScreen.dart';

class BottomNavBarScreen extends StatefulWidget {
  @override
  _BottomNavBarScreenState createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {

  String uid;
  String phone;

  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override

  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser.uid;
    phone=FirebaseAuth.instance.currentUser.phoneNumber;
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home',
      },
      {
        'page': SettingsScreen(phone),
        'title': 'Settings',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        backgroundColor: const Color.fromRGBO(43, 46, 66, 1),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                      (route) => false);
            },
          )
        ],
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: const Color.fromRGBO(43, 46, 66, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.pink,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color.fromRGBO(43, 46, 66, 1),
            icon: Icon(Icons.home_filled),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }


}
