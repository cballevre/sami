import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sami/pages/sample_list.dart';
import 'package:sami/widgets/action_recognition_tile.dart';
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

    double size =  (MediaQuery.of(context).size.width / 2) - (16 * 3);

    return Scaffold(
        appBar: CustomAppBar(),
        body: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none, children: [
          Container(width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height * 1/3), color: Colors.blueGrey),
          Positioned(
            left: 0,
            right: 0,
            top: (MediaQuery.of(context).size.height * 1/3) - 50,
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionRecognitionTile(size: size, iconAsset: 'assets/chemistry.svg', label: "GÉRER LES PRÉLÈVEMENTS", onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SampleListPage(),
                          ),
                        );
                      }),
                      ActionRecognitionTile(size: size, iconAsset: 'assets/sonde.svg', label: "FAIRE UN RELEVÉ SONDE", onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SampleListPage(),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionRecognitionTile(size: size, iconAsset: 'assets/camera.svg', label: "PRENDRE DES PHOTOS"),
                      ActionRecognitionTile(size: size, iconAsset: 'assets/n-edit.svg', label: "NOTER LES OBSERVATION"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(16),
                    child:  ElevatedButton(onPressed: () => {}, child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/send.svg"),
                        SizedBox(width: 16),
                        Text("ENVOYER LE RAPPORT PDF")
                      ],)) ,
                  )

                ]),
          )

        ])
    );
  }
}
