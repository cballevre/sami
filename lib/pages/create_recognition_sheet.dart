import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
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

  FormGroup buildForm() => fb.group(<String, Object>{
    'generality': FormGroup({
      'sampler_firstname': FormControl<String>(validators: [Validators.required]),
      'sampler_lastname': FormControl<String>(validators: [Validators.required]),
      'sampler_organism': FormControl<String>(validators: [Validators.required]),
      'sampler_phone_number': FormControl<String>(),
      'is_judiciary_process' : FormControl<bool>(value: false),
    }),
    'site': FormGroup({
      'site_name': FormControl<String>(),
      'is_site_polluted': FormControl<bool>(value: false),
      'is_new_arrival': FormControl<bool>(value: false),
    })

  });

  Future<void> uploadingData(
    String sampler_firstname,
    String sampler_lastname,
    String sampler_organism,
    String? sampler_phone_number,
    bool is_judiciary_process,
    String site_name,
    bool is_site_polluted,
    bool is_new_arrival
  ) async {
    await FirebaseFirestore.instance.collection("recognition_sheets").add({
      'sampler_firstname': sampler_firstname,
      'sampler_lastname': sampler_lastname,
      'sampler_organism': sampler_organism,
      'sampler_phone_number': sampler_phone_number,
      'is_judiciary_process': is_judiciary_process,
      'site_name': site_name,
      'is_site_polluted': is_site_polluted,
      'is_new_arrival': is_new_arrival,
      'created_at': DateTime.now().toUtc()
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
            form: buildForm,
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
              if((_index == 0 && form.control('generality').valid)
                  ||(_index == 1 && form.control('site').valid) ) {
                setState(() {
                  _index += 1;
                });
              } else {
                if(_index == 0) {
                  form.control('generality').markAllAsTouched();
                } else if(_index == 1) {
                  form.control('site').markAllAsTouched();
                }
              }
            } else if(_index == 2) {
              if (form.valid) {
                uploadingData(
                    form.control('generality.sampler_firstname').value,
                    form.control('generality.sampler_lastname').value,
                    form.control('generality.sampler_organism').value,
                    form.control('generality.sampler_phone_number').value,
                    form.control('generality.is_judiciary_process').value,
                    form.control('site.site_name').value,
                    form.control('site.is_site_polluted').value,
                    form.control('site.is_new_arrival').value
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RecognitionSheetPage(),
                  ),
                );
              } else {
                form.markAllAsTouched();
              }
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
                          formControlName: 'generality.sampler_firstname',
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
                          formControlName: 'generality.sampler_lastname',
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
                          formControlName: 'generality.sampler_organism',
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
                          formControlName: 'generality.sampler_phone_number',
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
                            ReactiveCheckbox(formControlName: 'generality.is_judiciary_process'),
                            const Text('Procédure juridique')
                          ],
                        ),
                      ],
                  ),
                )
              ),
            Step(
              title: const Text('Site'),
              content: Column(
                    children: [
                      ReactiveTextField<String>(
                        formControlName: 'site.site_name',
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
                          ReactiveCheckbox(formControlName: 'site.is_site_polluted'),
                          const Text('Site pollué')
                        ],
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        children: [
                          ReactiveCheckbox(formControlName: 'site.is_new_arrival'),
                          const Text('Nouvel arrivage')
                        ],
                      ),
                    ],
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
