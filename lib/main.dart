import 'package:flutter/material.dart';
import 'package:sami/pages/home.dart';
import 'package:sami/utils/palette.dart';

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
        primarySwatch: Palette.primary,
      ),
      home: const HomePage(),
    );
  }
}