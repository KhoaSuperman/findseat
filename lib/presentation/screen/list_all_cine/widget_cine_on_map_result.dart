import 'dart:async';

import 'package:find_seat/model/barrel_model.dart';
import 'package:find_seat/presentation/screen/list_all_cine/barrel_list_all_cine.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetCineOnMapResult extends StatefulWidget {
  List<Cine> items = [];

  WidgetCineOnMapResult({this.items});

  @override
  _WidgetCineOnMapResultState createState() => _WidgetCineOnMapResultState();
}

class _WidgetCineOnMapResultState extends State<WidgetCineOnMapResult> {
  Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.0127928, 105.8337666),
    zoom: 10.4746,
  );

  @override
  void initState() {
    super.initState();

    _controller.future.then((controller) {
      _createMarker();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.isCompleted) {
      _createMarker();
    }

    return AspectRatio(
      aspectRatio: 360 / 403,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          Future.delayed(Duration(seconds: 1), () {
            controller
                .animateCamera(CameraUpdate.newCameraPosition(_kGooglePlex));
          });
        },
      ),
    );
  }

  Future<void> _createMarker() async {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(4, 4)),
            'assets/ic_nearby_theatre.png')
        .then((icon) {
      _addMarker(icon);
    });
  }

  _addMarker(BitmapDescriptor bmp) {
    markers.clear();

    widget.items.forEach((cine) {
      var markerIdVal = cine.name;
      final MarkerId markerId = MarkerId(markerIdVal);

      final Marker marker = Marker(
        markerId: markerId,
        icon: bmp,
        position: LatLng(cine.lat, cine.lng),
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
        onTap: () {},
      );

      setState(() {
        markers[markerId] = marker;
      });
    });
  }
}
