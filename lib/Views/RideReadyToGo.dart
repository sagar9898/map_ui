import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapui/size_config.dart';
import 'package:permission/permission.dart';

import 'MapsWidget.dart';

class RideReayToGo extends StatefulWidget {
  @override
  _RideReayToGoState createState() => _RideReayToGoState();
}

class _RideReayToGoState extends State<RideReayToGo> {

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
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: <Widget>[

                //TestMapPolyline(),
                GoogleMap(

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
                Positioned(bottom:0,right: 0,left: 0,child: BottomRideBook()),
              ],
            ),

          ),

          bottomNavigationBar:BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/Icon_svg/ic_current_order.png'), size: 30,),
                title: Text('Current Order'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/Icon_svg/ic_home.png')),
                title: Text('Go To Home'),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('asset/Icon_svg/ic_past_order.png')),
                title: Text('Past Order'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff6CD342),
            onTap: _onItemTapped,
          ),

        )
    );

  }
  Widget BottomRideBook(){
    return Container(
      width: SizeConfig.widthMultiplier*100,
      height: SizeConfig.heightMultiplier*33,

      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 40,top: 20,right: 30),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('From', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*2.7,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(7, 100, 233, 1),
                        borderRadius : BorderRadius.all(Radius.elliptical(12, 12)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('My position', textAlign: TextAlign.left, style: TextStyle(
                          color: Color.fromRGBO(96, 96, 96, 1),
                          fontFamily: 'Nunito',
                          fontSize: SizeConfig.textMultiplier*1.9,
                          letterSpacing: -0.3333333432674408,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                    ),
                  ],
                ),
                Container(
                  child: RichText(text:TextSpan(
                    text: '37 Min',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*2,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n\(3.49mi\)',
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Nunito',
                            fontSize: SizeConfig.textMultiplier*1.5,
                            letterSpacing: -0.3333333432674408,
                            fontWeight: FontWeight.normal,
                            height: 1
                        ),
                      )
                    ]
                  ),)
                )
              ],
            )
          ),
          Container(
              margin: EdgeInsets.only(left: 40,top: 20),
              child:Row(
                children: <Widget>[
                  Text('To', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Nunito',
                      fontSize: SizeConfig.textMultiplier*2.7,
                      letterSpacing: -0.3333333432674408,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),),

                  Container(
                    margin: EdgeInsets.only(left: 10),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color : Colors.lightGreen,
                      borderRadius : BorderRadius.all(Radius.elliptical(12, 12)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('35 A, Vikas Nagar B, Jaipur', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(96, 96, 96, 1),
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*1.9,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
                ],
              )
          ),
          Container(
            margin: EdgeInsets.only(right: 20,left: 20,top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(onTap:()=>setState(()=>_changecolor=0), child: Container(
                    decoration:BoxDecoration(borderRadius : BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),), color: _changecolor == 0 ? Colors.lightGreen : Colors.transparent,),
                    child: CarSelection("asset/Icon_svg/image 4.png","Economy"))),
                GestureDetector(onTap:()=>setState(()=>_changecolor=1), child: Container(
                    decoration:BoxDecoration(borderRadius : BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),), color: _changecolor == 1 ? Colors.lightGreen : Colors.transparent,),
                    child: CarSelection("asset/Icon_svg/image 5.png","Economy"))),
                GestureDetector(onTap:()=>setState(()=>_changecolor=2), child: Container(
                    decoration:BoxDecoration(borderRadius : BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),), color: _changecolor == 2 ? Colors.lightGreen : Colors.transparent,),
                    child: CarSelection("asset/Icon_svg/image 6.png","Economy"))),
                GestureDetector(onTap:()=>setState(()=>_changecolor=3), child: Container(
                    decoration:BoxDecoration(borderRadius : BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8),), color: _changecolor == 3 ? Colors.lightGreen : Colors.transparent,),
                    child: CarSelection("asset/Icon_svg/image 7.png","Economy"))),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisButton('RIDE NOW')
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
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


