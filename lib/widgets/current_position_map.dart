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
      _mapController.move(LatLng(currentPosition.latitude, currentPosition.longitude),  14);

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

  String cleShom = "d4e9uo5qizxqej9spjomg1ie";

  @override
  Widget build(BuildContext context) {

    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: LatLng(48.208397340730414, -4.733523208236653),
        zoom: 10,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://services.data.shom.fr/" +
              "d4e9uo5qizxqej9spjomg1ie" +
              "/wmts?VERSION=1.0.0" +
              "&REQUEST=GetTile" +
              "&SERVICE=WMTS" +
              "&FORMAT=image/png" +
              "&LAYER=RASTER_MARINE_3857_WMTS" +
              "&TILEMATRIXSET=3857" +
              "&STYLE=normal" +
              "&TILEMATRIX={z}" +
              "&TILEROW={y}" +
              "&TILECOL={x}"
        ),
        MarkerLayer(markers: markers)
      ],
    );
  }
}