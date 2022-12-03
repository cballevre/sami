import 'package:flutter/material.dart';

class SensorSetupPage extends StatefulWidget {
  const SensorSetupPage({Key? key}) : super(key: key);

  @override
  State<SensorSetupPage> createState() => _SensorSetupPageState();
}

class _SensorSetupPageState extends State<SensorSetupPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Setup sensor"),
    );
  }
}
