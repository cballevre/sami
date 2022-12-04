import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sami/pages/create_sample.dart';

import '../widgets/custom_app_bar.dart';

class SampleListPage extends StatefulWidget {
  const SampleListPage({Key? key}) : super(key: key);

  @override
  State<SampleListPage> createState() => _SampleListPageState();
}

class _SampleListPageState extends State<SampleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Liste des prévélements"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("samples").snapshots(),
          builder: (context, snapshot) {
            return !snapshot.hasData ? Text('PLease Wait') : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              child: ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic>? samples = snapshot.data?.docs.elementAt(index).data();
                  DateTime dt = DateTime.fromMicrosecondsSinceEpoch((samples?['created_at'] as Timestamp).microsecondsSinceEpoch);
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 5,
                    child: InkWell(child: ListTile(
                      title: Text(samples?['site_name'] ),
                      subtitle: Text(dt.toString()),
                      ),
                      onTap: () {

                      }
                    ));
                  }),
              );
            }),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const CreateSamplePage(),
          ),
        );
      },
      tooltip: 'Créer une fiche',
      elevation: 2.0,
      child: const Icon(Icons.add),
    ),
    );


  }
}
