import 'package:careerguideline/User/Pages/UserProfilePage.dart';
import 'package:careerguideline/Widgets/MyNavigationBar.dart';
import 'package:flutter/material.dart';
import '../../Widgets/MyDrawer.dart';
import 'HomePageView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    HomePageView(),
    UserProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      drawer: MyDrawer(context),
      bottomNavigationBar: MyNavigationBar(
          onTap:_onItemTapped,currentIndex: _selectedIndex),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
