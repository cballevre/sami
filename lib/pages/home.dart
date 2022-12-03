import 'package:flutter/material.dart';

import 'package:sami/widgets/fab_with_icons.dart';
import 'package:sami/widgets/fab_bottom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    Center(
      child: Icon(
        Icons.call,
        size: 150,
      ),
    ),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
    Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: TextField(
          style: TextStyle(fontSize: 50),
          decoration: InputDecoration(
              labelText: 'Find contact',
              labelStyle: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
    ),
    Center(
      child: Icon(
        Icons.camera,
        size: 150,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("osm"),
      ),
      body: IndexedStack(
          index: _selectedIndex,
          children: _pages
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.black,
        selectedColor: Colors.orange,
        backgroundColor: Colors.white,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
          FABBottomAppBarItem(iconData: Icons.list, text: 'Reconnaissance'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Infos'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Paramètres'),
        ]
      ),
    );
  }
}
