import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sami/pages/recognition_sheet.dart';

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
        return !snapshot.hasData ? Text('PLease Wait') : Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
          child: ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic>? recognitionSheets = snapshot.data?.docs.elementAt(index).data();
              DateTime dt = DateTime.fromMicrosecondsSinceEpoch((recognitionSheets?['created_at'] as Timestamp).microsecondsSinceEpoch);
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 5,
                child: InkWell(child: ListTile(
                  title: Text(recognitionSheets?['site_name'] ),
                  subtitle: Text(dt.toString()),
                ), onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RecognitionSheetPage(),
                    ),
                  );
                }),
              );
            }));
        },
        );
      }
}
