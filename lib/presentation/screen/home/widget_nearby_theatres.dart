import 'dart:async';

import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WidgetNearbyTheatres extends StatefulWidget {
  @override
  _WidgetNearbyTheatresState createState() => _WidgetNearbyTheatresState();
}

class _WidgetNearbyTheatresState extends State<WidgetNearbyTheatres> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Nearby theatres'.toUpperCase(),
                    style: FONT_CONST.MEDIUM_BLACK2_14),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    _openAllCine();
                  },
                  child: Text('View all',
                      style: FONT_CONST.MEDIUM_DEFAULT_10,
                      textAlign: TextAlign.right),
                ),
              )
            ],
          ),
          WidgetSpacer(height: 14),
          _buildGoogleMap()
        ],
      ),
    );
  }

  _openAllCine() {
    Navigator.pushNamed(context, Router.LIST_ALL_CINE);
  }

  Completer<GoogleMapController> _controller = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.013298, 105.827523),
    zoom: 14.4746,
  );

  _buildGoogleMap() {
    return Container(
      height: 168,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set<Marker>.of(markers.values),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);

          LatLng southwest = LatLng(20.994607, 105.786714);
          LatLng northeast = LatLng(21.047550, 105.840251);

          Future.delayed(Duration(seconds: 1), () {
            controller.animateCamera(
              CameraUpdate.newLatLngBounds(
                  LatLngBounds(southwest: southwest, northeast: northeast), 0),
            );
          });

          _createMarker(context);
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
    cines["BHD Cầu Giấy"] = LatLng(21.035257, 105.794364);
    cines["BHD Trung Hòa"] = LatLng(21.013758, 105.800307);

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
