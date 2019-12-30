import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetCineOnMap extends StatefulWidget {
  @override
  _WidgetCineOnMapState createState() => _WidgetCineOnMapState();
}

class _WidgetCineOnMapState extends State<WidgetCineOnMap> {
  Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.0127928, 105.8337666),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 148,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          Future.delayed(Duration(seconds: 1), () {
            _createMarker(context);

            controller
                .animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
          });
        },
      ),
    );
  }

  Future<void> _createMarker(BuildContext context) async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(4, 4)),
            'assets/ic_nearby_theatre.png')
        .then((icon) {
      _addMarker(icon);
    });
  }

  _addMarker(BitmapDescriptor bmp) {
    Map<String, LatLng> cines = new Map<String, LatLng>();
    cines["BHD Phạm Ngọc Thạch"] = LatLng(21.0127928, 105.8337666);

    cines.forEach((markerIdVal, latLng) {
      final MarkerId markerId = MarkerId(markerIdVal);

      final Marker marker = Marker(
        markerId: markerId,
        icon: bmp,
        position: latLng,
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
        onTap: () {},
      );

      setState(() {
        markers[markerId] = marker;
      });
    });
  }
}
