import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';
import 'package:sami/pages/create_sample.dart';

class RecognitionSheetListPage extends StatefulWidget {
  const RecognitionSheetListPage({super.key});

  @override
  State<RecognitionSheetListPage> createState() => _RecognitionSheetListPageState();
}

class _RecognitionSheetListPageState extends State<RecognitionSheetListPage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("recognition_sheets").snapshots(),
      builder: (context, snapshot) {
        return !snapshot.hasData ? Text('PLease Wait') : ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {
            Map<String, dynamic>? recognitionSheets = snapshot.data?.docs.elementAt(index).data();
            return Text(recognitionSheets?['sampler_lastname']);
          },
        );
      }
    );
  }
}
