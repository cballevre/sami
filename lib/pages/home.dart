import 'package:flutter/material.dart';
import 'package:sami/pages/create_recognition_sheet.dart';
import 'package:sami/pages/recognition_sheet_list.dart';
import 'package:sami/utils/palette.dart';
import 'package:sami/widgets/current_position_map.dart';

import 'package:sami/widgets/fab_bottom_app_bar.dart';
import 'package:sami/widgets/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static  final List<Widget> _pages = <Widget>[
    CurrentPositionMap(),
    const RecognitionSheetListPage(),
    const Center(
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
    const Center(
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

  void _onFabPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateRecognitionSheetPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: IndexedStack(
          index: _selectedIndex,
          children: _pages
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        tooltip: 'Créer une fiche',
        elevation: 2.0,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.black,
        selectedColor: Palette.primary.shade500,
        backgroundColor: Colors.white,
        notchedShape: const CircularNotchedRectangle(),
        onTabSelected: _onItemTapped,
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Accueil'),
          FABBottomAppBarItem(iconData: Icons.list, text: 'Fiches'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Infos'),
          FABBottomAppBarItem(iconData: Icons.settings, text: 'Paramètres'),
        ]
      ),
    );
  }
}

