import 'package:flutter/material.dart';

import './widgets/fab_with_icons.dart';
import './widgets/fab_bottom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late PageController controller;
  late int indexPage;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
    indexPage = controller.initialPage;
  }

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("osm"),
      ),
      body: PageView(
        children: <Widget>[
          Center(
            child: Text("page n1"),
          ),
        ],
        controller: controller,
        onPageChanged: (p) {
          setState(() {
            indexPage = p;
          });
        },
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
        centerItemText: 'A',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'This'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Is'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Bottom'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Bar'),
        ], backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
