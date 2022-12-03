import 'package:flutter/material.dart';
import 'package:sami/utils/palette.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CreateSamplePage extends StatefulWidget {
  const CreateSamplePage({super.key});

  @override
  State<CreateSamplePage> createState() => _CreateSamplePageState();
}

class _CreateSamplePageState extends State<CreateSamplePage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Créer un prélévement"),
        backgroundColor: Palette.primary.shade500,
        centerTitle: true,
      ),
      body:  FlutterMap(
    options: MapOptions(
    center: LatLng(51.509364, -0.128928),
    zoom: 9.2,
    ),
    nonRotatedChildren: [
    AttributionWidget.defaultWidget(
    source: 'OpenStreetMap contributors',
    onSourceTapped: null,
    ),
    ],
    children: [
    TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'com.example.app',
    ),
    ],
    ));
  }
}
