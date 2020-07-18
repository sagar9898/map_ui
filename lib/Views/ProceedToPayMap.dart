import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapui/Views/MapsWidget.dart';

import '../size_config.dart';

class ProceedToPayMap extends StatefulWidget {
  @override
  _ProceedToPayMapState createState() => _ProceedToPayMapState();
}

class _ProceedToPayMapState extends State<ProceedToPayMap> {

  final Set<Marker> _markers = {};
  int _changecolor = 0;
  int _selectedPosition=1;
  final Set<Polyline> _polyline = {};
  GoogleMapController mapController;
  List<LatLng> routePoint = List();
  static const _initialmapposition = LatLng(12.858433, 77.575691);
  LatLng _lastMapPosition = _initialmapposition;
  int _selectedIndex = 0;

  getSomePoints() {
    routePoint.add(LatLng(13.035606, 77.562381));
    routePoint.add(LatLng(12.858433, 77.575691));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSomePoints();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: Opacity(
                  opacity: 0.25,

                  child: GoogleMap(

                    mapToolbarEnabled: false,
                    mapType: MapType.terrain,
                    polylines: _polyline,
                    markers: _markers,
                    myLocationButtonEnabled: true,
                    onMapCreated: onCreated,
                    initialCameraPosition: CameraPosition(
                      zoom: 20.0,
                      target: _initialmapposition,),
                  ),
                ),


              ),
              Positioned(bottom:0,right: 0,left: 0,child:Container(
                  height: SizeConfig.heightMultiplier * 50,
                  child: BottomPayMap(),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                    ),

                  ),),)
            ],
          ),
        ),
      ),

    );
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

  Widget BottomPayMap() {
    return  Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*1.71),
                child: Text(
                  'Pick a Payment Option', textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Nunito',
                      fontSize: SizeConfig.textMultiplier*2.51,
                      decoration: TextDecoration.none,

                      fontWeight: FontWeight.bold,
                      height: 1
                  ),),

              ),

              Container(
                margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*1.1),
                child: Divider(
                    color: Color(0xffE2E2E2),
                    thickness: 1
                ),
              ),
              PaymentMethod(1, 'Card xxx 4524'),
              Divider(
                  color: Color(0xffE2E2E2),
                  thickness: 1
              ),
              PaymentMethod(2, 'Card xxx 4524'),
              Divider(
                  color: Color(0xffE2E2E2),
                  thickness: 1
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Row(
                  children: <Widget>[
                    Image.asset('asset/Icon_svg/payment 2.png'),
                    SizedBox(width: 18 ,),
                    Text('Add a Credit/Debit Card', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*2,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),)
                  ],
                ),
              ),

              Container(margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*2.85),child: RaisButton("Proceed"))

            ],


    );
  }

  Widget PaymentMethod(int val, String paymentMode) {
    return RadioListTile(
      value: val,
      groupValue: _selectedPosition,
      activeColor: Colors.green,
      onChanged: (newValue) => setState(() => _selectedPosition = newValue),
      title: Text(paymentMode, style: TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontFamily: 'Nunito',
          fontSize: SizeConfig.textMultiplier*2,
          letterSpacing: -0.3333333432674408,
          fontWeight: FontWeight.normal,
          height: 1
      ),),
    );
  }
}
