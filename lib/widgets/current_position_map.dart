import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:sami/utils/position_locator.dart';

// https://stackoverflow.com/questions/46480221/flutter-floating-action-button-with-speed-dail
class CurrentPositionMap extends StatefulWidget {

  @override
  State createState() => CurrentPositionMapState();
}

class CurrentPositionMapState extends State<CurrentPositionMap> {

  late MapController _mapController;
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    searchPosition();
  }

  Future<Set> searchPosition() async => {
    PositionLocator.determinePosition().then((currentPosition) {
      _mapController.move(LatLng(currentPosition.latitude, currentPosition.longitude),  12);

      markers.add(Marker(
        width: 100,
        height: 90,
        point: LatLng(currentPosition.latitude, currentPosition.longitude),
        builder: (ctx) => Column(children: [SvgPicture.asset(
          height: 50,
          fit: BoxFit.fitHeight,
          'assets/marker.svg',
        ),
        const SizedBox(height: 8),
        const Text('VOUS ÊTES ICI', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),)]),
      ));
    })
  };

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(55.21723380513681, -7.299306291632042),
        zoom: 1,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(markers: markers)
      ],
    );
  }
}