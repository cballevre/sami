import 'package:flutter/material.dart';

class SampleListPage extends StatefulWidget {
  const SampleListPage({Key? key}) : super(key: key);

  @override
  State<SampleListPage> createState() => _SampleListPageState();
}

class _SampleListPageState extends State<SampleListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("List des échantillons"),
    );
  }
}
