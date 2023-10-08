import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raw Milk Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Map(),
    );
  }
}

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _oneTreeFarm = CameraPosition(
    target: LatLng(51.0219327,-3.0026117),
    zoom: 10,
  );

  final Set<Marker> _farms = {Marker(markerId: MarkerId('one-tree-farm'), position: LatLng(51.02195,-3.002615), infoWindow: InfoWindow(title: "One Tree Farm"))};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0x00000000),
        title: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CustomSearchBar(key: Key('search-bar')),
        ),
      ),
      body: Stack(
        children: [GoogleMap(
          markers: _farms,
          mapType: MapType.normal,
          initialCameraPosition: _oneTreeFarm,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        )],
      ),
    );
  }
}
