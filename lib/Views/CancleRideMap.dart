import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import 'MapsWidget.dart';

class CancleRideMap extends StatefulWidget {
  @override
  _CancleRideMapState createState() => _CancleRideMapState();
}

class _CancleRideMapState extends State<CancleRideMap> {
  final Set<Marker> _markers = {};
  int _changecolor = 0;
  int _selectedPosition = 1;
  final Set<Polyline> _polyline = {};
  GoogleMapController mapController;
  List<LatLng> routePoint = List();
  static const _initialmapposition = LatLng(12.858433, 77.575691);
  LatLng _lastMapPosition = _initialmapposition;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: <Widget>[
            Container(

              child: GoogleMap(

                mapToolbarEnabled: false,
                mapType: MapType.terrain,
                polylines: _polyline,
                markers: _markers,
                myLocationButtonEnabled: true,
                onMapCreated: onCreated,
                initialCameraPosition: CameraPosition(
                  zoom: 100.0,
                  target: _initialmapposition,),
              ),


            ),
            Positioned(bottom: 0,
                right: 0,
                left: 0,
                child: BottomForCancleRide()),
            Positioned(top:SizeConfig.heightMultiplier*50,left:SizeConfig.widthMultiplier*85,child: Buttons('asset/Icon_svg/gps 1.png'),),
          ],
        ),
      ),
    ));
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lastMapPosition,
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: routePoint,
        width: 5,
        color: Colors.blue,
      ));
    });
}
}
