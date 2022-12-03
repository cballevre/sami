import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';
import 'package:sami/pages/create_sample.dart';

class RecognitionSheetPage extends StatefulWidget {
  const RecognitionSheetPage({super.key});

  @override
  State<RecognitionSheetPage> createState() => _RecognitionSheetPageState();
}

class _RecognitionSheetPageState extends State<RecognitionSheetPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: AppBar(
          title: Text("Nom d'un site"),
          backgroundColor: Palette.primary.shade500,
          centerTitle: true,
        ),
        body:  Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('Photos'),
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateSamplePage(),
                        ),
                      );
                    },
                    child: const Text('Prélévement'),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('Sondes'),
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('Notes'),
                  ),
                ],
              ),

                ElevatedButton(
                  style: style,
                  onPressed: () {},
                  child: const Text('Générer un PDF'),
                ),
              ]
            )
    );
  }
}
