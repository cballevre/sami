import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:sami/pages/home.dart';
import 'package:sami/pages/recognition_sheet.dart';
import 'package:sami/utils/palette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateRecognitionSheetPage extends StatefulWidget {
  const CreateRecognitionSheetPage({super.key});

  @override
  State<CreateRecognitionSheetPage> createState() => _CreateRecognitionSheetPageState();
}

class _CreateRecognitionSheetPageState extends State<CreateRecognitionSheetPage> {
  int _index = 0;

  FormGroup buildGeneralityForm() => fb.group(<String, Object>{
    'sampler_firstname': FormControl<String>(
      validators: [Validators.required],
    ),
    'sampler_lastname': FormControl<String>(
      validators: [Validators.required],
    ),
    'sampler_organism': FormControl<String>(
      validators: [Validators.required],
    ),
    'sampler_phone_number': FormControl<String>(),
    'is_judiciary_process' : FormControl<bool>(value: false),
  });

  FormGroup buildSiteForm() => fb.group(<String, Object>{
    'position_latitude': FormControl<String>(),
    'position_longitude': FormControl<String>(),
    'position_altitude': FormControl<String>(),
    'site_name': FormControl<String>(),
    'is_site_polluted': FormControl<bool>(value: false),
    'is_new_arrival': FormControl<bool>(value: false),
  });

  Future<void> uploadingData(
  String sampler_firstname,
  String sampler_lastname,
  String sampler_organism,
  String sampler_phone_number,
  bool is_judiciary_process,
  ) async {
    await FirebaseFirestore.instance.collection("recognition_sheets").add({
      'sampler_firstname': sampler_firstname,
      'sampler_lastname': sampler_lastname,
      'sampler_organism': sampler_organism,
      'sampler_phone_number': sampler_phone_number,
      'is_judiciary_process': is_judiciary_process,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Créer une fiche"),
        backgroundColor: Palette.primary.shade500,
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
          child: ReactiveFormBuilder(
            form: buildGeneralityForm,
            builder: (context, form, child) {
              return Stepper(
          currentStep: _index,
          onStepCancel: () {
            if (_index > 0) {
              setState(() {
                _index -= 1;
              });
            } else if(_index == 0) {
              Navigator.of(context).pop();
            }
          },
          onStepContinue: () {
            if (_index <= 1) {
              setState(() {
                _index += 1;
              });
            } else if(_index == 2) {
              if (form.valid) {
                print(form.value);
              } else {
                form.markAllAsTouched();
              }
              uploadingData(
                  form.value['sampler_firstname'] as String,
                  form.value['sampler_lastname'] as String,
                  form.value['sampler_organism'] as String,
                  form.value['sampler_phone_number'] as String,
                  form.value['is_judiciary_process'] as bool
              );
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const RecognitionSheetPage(),
                ),
              );
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
              child: Column(
                      children: [
                        ReactiveTextField<String>(
                          formControlName: 'sampler_firstname',
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                            'The firstname must not be empty'
                          },
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Firstname',
                            helperText: '',
                            helperStyle: TextStyle(height: 0.7),
                            errorStyle: TextStyle(height: 0.7),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ReactiveTextField<String>(
                          formControlName: 'sampler_lastname',
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                            'The lastname must not be empty',
                          },
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Lastname',
                            helperText: '',
                            helperStyle: TextStyle(height: 0.7),
                            errorStyle: TextStyle(height: 0.7),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ReactiveTextField<String>(
                          formControlName: 'sampler_organism',
                          validationMessages: {
                          ValidationMessage.required: (_) =>
                            'The organism must not be empty',
                          },
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Organism',
                            helperText: '',
                            helperStyle: TextStyle(height: 0.7),
                            errorStyle: TextStyle(height: 0.7),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        ReactiveTextField<String>(
                          formControlName: 'sampler_phone_number',
                          validationMessages: {
                            ValidationMessage.required: (_) =>
                            'The phone number must not be empty',
                          },
                          textInputAction: TextInputAction.done,
                          decoration: const InputDecoration(
                            labelText: 'Phone number',
                            helperText: '',
                            helperStyle: TextStyle(height: 0.7),
                            errorStyle: TextStyle(height: 0.7),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            ReactiveCheckbox(formControlName: 'is_judiciary_process'),
                            const Text('Procédure juridique')
                          ],
                        ),
                      ],



                  ),
                )
              ),
            Step(
              title: const Text('Site'),
              content: ReactiveFormBuilder(
                form: buildSiteForm,
                builder: (context, form, child) {
                  return Column(
                    children: [
                      ReactiveTextField<String>(
                        formControlName: 'site_name',
                        validationMessages: {
                          ValidationMessage.required: (_) =>
                          'The site name must not be empty',
                        },
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(
                          labelText: 'Site name',
                          helperText: '',
                          helperStyle: TextStyle(height: 0.7),
                          errorStyle: TextStyle(height: 0.7),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          ReactiveCheckbox(formControlName: 'is_site_polluted'),
                          const Text('Site pollué')
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          ReactiveCheckbox(formControlName: 'is_new_arrival'),
                          const Text('Nouvel arrivage')
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Step(
              title: const Text('Description pollution'),
              content: Container(
                  alignment: Alignment.centerLeft,
                  child: const Text('Site')),
            ),
          ],
        );
          }
      )
      )
    );
  }
}
