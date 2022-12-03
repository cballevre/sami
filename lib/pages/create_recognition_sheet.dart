import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';

class CreateRecognitionSheetPage extends StatefulWidget {
  const CreateRecognitionSheetPage({super.key});

  @override
  State<CreateRecognitionSheetPage> createState() => _CreateRecognitionSheetPageState();
}

class _CreateRecognitionSheetPageState extends State<CreateRecognitionSheetPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer une fiche"),
        backgroundColor: Palette.primary.shade500,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
          child: Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            }
          },
          onStepContinue: () {
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            }
          },
          onStepTapped: (int index) {
            setState(() {
              _index = index;
            });
          },
          steps: <Step>[
            Step(
              title: const Text('Généralités'),
              content: Container(
              alignment: Alignment.centerLeft,
              child: const Text('Site')),
            ),
            Step(
              title: const Text('Site'),
              content: Text('Content for Step 2'),
            ),
            Step(
              title: const Text('Description pollution'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Site')),
            ),
          ],
        )
      )
    );
  }
}
