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
          Container(
              width: MediaQuery.of(context).size.width, height: (MediaQuery.of(context).size.height * 1/3),
              color: Colors.blueGrey,
              child: Stack(
                children: [

                  const Image(
                    image: AssetImage('assets/erika.png'),
                    fit: BoxFit.cover,
                  ),
                  Container(
                    color: Color.fromRGBO(62,62,60, 0.82),
                  ),
                  Positioned(
                      top: 30,
                      left: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NAUFRAGE ERIKA",style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Text("48.4084369,-4.5346903",style: TextStyle(fontSize: 18, color: Colors.white))
                        ],
                      )
                  ),

                ],
              )
          ),
          Positioned(
            left: 0,
            right: 0,
            top: (MediaQuery.of(context).size.height * 1/3) - 50,
            child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ActionRecognitionTile(size: size, iconAsset: 'assets/chemistry.svg', label: "G??RER LES PR??L??VEMENTS", onPressed: () {
                        print("G??RER LES PR??L??VEMENTS");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SampleListPage(),
                          ),
                        );
                      }),
                      ActionRecognitionTile(size: size, iconAsset: 'assets/sonde.svg', label: "FAIRE UN RELEV?? SONDE", onPressed: () {
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
