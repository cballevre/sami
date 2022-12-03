import 'package:flutter/material.dart';
import 'package:sami/widgets/custom_app_bar.dart';

class RecognitionSheetPage extends StatefulWidget {
  const RecognitionSheetPage({super.key});

  @override
  State<RecognitionSheetPage> createState() => _RecognitionSheetPageState();
}

class _RecognitionSheetPageState extends State<RecognitionSheetPage> {

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
        appBar: CustomAppBar(),
        body:  Column(
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Expanded(
                  child: Column(children: [
                    Container(height: 120.0, color: Colors.yellow),
                    Container(height: 100.0, color: Colors.cyan),
                  ]),
                ),
                Expanded(child: Container(color: Colors.amber)),
              ]),

            ])
    );
  }
}

/*
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

*/
