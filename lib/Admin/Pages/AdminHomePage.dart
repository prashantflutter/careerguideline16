import 'package:careerguideline/Widgets/MyNavigationBar.dart';
import 'package:flutter/material.dart';
import '../../Widgets/MyDrawer.dart';
import 'AdminHomePageView.dart';
import 'AdminProfilePage.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {

  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    AdminHomePageView(),
    AdminProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: MyNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: MyDrawer(context),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
