import 'dart:async';

import 'package:find_seat/model/entity/cine.dart';
import 'package:find_seat/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:find_seat/presentation/router.dart';
import 'package:find_seat/presentation/screen/home/bloc/bloc.dart';
import 'package:find_seat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class WidgetNearbyCine extends StatefulWidget {
  @override
  _WidgetNearbyCineState createState() => _WidgetNearbyCineState();
}

class _WidgetNearbyCineState extends State<WidgetNearbyCine> {
  List<Cine> cines = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NearbyCineBloc>(
      create: (context) =>
          NearbyCineBloc(homeBloc: BlocProvider.of<HomeBloc>(context)),
      child: BlocBuilder<NearbyCineBloc, NearbyCineState>(
        builder: (context, state) {
          if (state is NearbyCineLoaded) {
            cines.clear();
            cines.addAll(state.cines);

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
          } else {
            return Container();
          }
        },
      ),
    );
  }

  _openAllCine() {
    Navigator.pushNamed(context, AppRouter.LIST_ALL_CINE);
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
    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(4, 4)), 'assets/ic_nearby_theatre.png');

    markers.clear();
    cines.forEach((cine) {
      final markerIdVal = cine.id;
      final latLng = LatLng(cine.lat, cine.lng);

      final MarkerId markerId = MarkerId(markerIdVal);

      final Marker marker = Marker(
        markerId: markerId,
        icon: icon,
        position: latLng,
        infoWindow: InfoWindow(title: markerIdVal, snippet: '*'),
        onTap: () {},
      );

      markers[markerId] = marker;
    });

    setState(() {
      markers.length;
    });
  }
}
