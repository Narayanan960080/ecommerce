import 'package:flutter/material.dart';

import 'HomeView.dart';



class BottomNavView extends StatefulWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  _BottomNavViewState createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final tabs = [
    const HomeView(),
    const HomeView(),
    const HomeView(),
    const HomeView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Image.asset('assets/images/home_nav.png',height: 20,color: Colors.grey,),
                label: 'Home'
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/cart_nav.png',height: 20),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/myorder_nav.png',height: 20,),
              label: 'My Order',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/account_nav.png',height: 20,),
              label: 'Account',
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black38,
          // selectedItemColor: Color(0xff29D177),
          selectedLabelStyle: TextStyle(fontSize: 12),
          selectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          iconSize: 20,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
