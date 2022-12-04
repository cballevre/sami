import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';

import '../widgets/custom_app_bar.dart';

class CreateSamplePage extends StatefulWidget {
  const CreateSamplePage({super.key});

  @override
  State<CreateSamplePage> createState() => _CreateSamplePageState();
}

class _CreateSamplePageState extends State<CreateSamplePage> {

  int _selectedIndex = 0;

  static  final List<Widget> _pages = <Widget>[

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "Créer un prélévement"),
      body: Column(
        children: [
          IndexedStack(
              index: _selectedIndex,
              children: _pages
          ),
        ],
      )
    );
  }
}
