import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';

class CreateSamplePage extends StatefulWidget {
  const CreateSamplePage({super.key});

  @override
  State<CreateSamplePage> createState() => _CreateSamplePageState();
}

class _CreateSamplePageState extends State<CreateSamplePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un prélévement"),
        backgroundColor: Palette.primary.shade500,
        centerTitle: true,
      ),
      body: PageView(
        /// [PageView.scrollDirection] defaults to [Axis.horizontal].
        /// Use [Axis.vertical] to scroll vertically.
        controller: controller,
        children: const <Widget>[
          Center(
            child: Text('First Page'),
          ),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          ),
        ],
      )
    );
  }
}
