import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreenState extends StatefulWidget {
  const GoogleMapScreenState({super.key});
  static const String route = "googleScreenState";

  @override
  State<GoogleMapScreenState> createState() => _GoogleMapScreenStateState();
}

class _GoogleMapScreenStateState extends State<GoogleMapScreenState> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.69778766793316, 85.31879156771497);
  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(myLocation.toString()),
      position: myLocation,
      infoWindow: const InfoWindow(
        title: 'Fun land',
        snippet: 'Funland',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ])),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            child: GoogleMap(
                zoomGesturesEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: myLocation,
                  zoom: 10,
                ),
                markers: markers,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  setState(() {
                    mapController = controller;
                  });
                }),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ...ListTile.divideTiles(
                      color: Colors.grey,
                      tiles: [
                        ListTile(
                          leading: Icon(Icons.info),
                          title: Text(
                            "About Us",
                          ),
                        ),
                        ListTile(
                          title: Text(
                            "This is a visual content platform",
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
