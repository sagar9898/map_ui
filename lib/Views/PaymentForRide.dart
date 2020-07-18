import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../size_config.dart';
import 'MapsWidget.dart';

class PayementForRide extends StatefulWidget {
  @override
  _PayementForRideState createState() => _PayementForRideState();
}

class _PayementForRideState extends State<PayementForRide> {
  final Set<Marker> _markers = {};
  int _changecolor=0;
  final Set<Polyline> _polyline = {};
  GoogleMapController mapController;
  List<LatLng> routePoint=List();
  static const _initialmapposition=LatLng(12.858433, 77.575691);
  LatLng _lastMapPosition=_initialmapposition;
  int _selectedIndex=0;
  getSomePoints(){
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
          body: Stack(
                children: <Widget>[

                  //TestMapPolyline(),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(

                      mapToolbarEnabled: false,
                      mapType: MapType.terrain,
                      polylines: _polyline,
                      markers: _markers,
                      myLocationButtonEnabled: true,
                      onMapCreated: onCreated,
                      initialCameraPosition: CameraPosition(
                        zoom: 14.0,
                        target: _initialmapposition,),
                    ),
                  ),
                  Positioned(top: 10,right:SizeConfig.imageSizeMultiplier*4,left: SizeConfig.imageSizeMultiplier*4,child:Column(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.heightMultiplier*8,
                        child: Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),alignment:Alignment.center,child: TopBar("Pickup Address","Vaishali Naga, Jaipur",false)),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(32.5),
                            topRight: Radius.circular(32.5),
                            bottomLeft: Radius.circular(32.5),
                            bottomRight: Radius.circular(32.5),
                          ),
                          color: Colors.white,
                          boxShadow : [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                              offset: Offset(0,0),
                              blurRadius: 15
                          )],

                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        height: SizeConfig.heightMultiplier*8,
                        child: Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),alignment:Alignment.center,child: TopBar("Pickup Address","Vaishali Naga, Jaipur",true)),
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.only(
                            topLeft: Radius.circular(32.5),
                            topRight: Radius.circular(32.5),
                            bottomLeft: Radius.circular(32.5),
                            bottomRight: Radius.circular(32.5),
                          ),
                          color: Colors.white,
                          boxShadow : [BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
                              offset: Offset(0,0),
                              blurRadius: 15
                          )],

                        ),
                      ),
                    ],
                  ),),

                  Positioned(
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Container(margin:EdgeInsets.only(top: 10,right: 10,bottom: 10),child:Buttons('asset/Icon_svg/Star 1.png'),),
                        Container(margin:EdgeInsets.only(top: 10,right: 10,bottom: 10),child: Buttons('asset/Icon_svg/gps 1.png')),
                        Container(width: SizeConfig.widthMultiplier*100,
                          height: SizeConfig.heightMultiplier*25,child: BottomForPayment('20USD'), decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                          ),),
                      ],
                    ),
                  ),


                ],
              ),

            ),
          

    );

  }


  void onCreated(GoogleMapController controller){
    setState((){
      mapController=controller;
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
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  }

