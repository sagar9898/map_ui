import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapui/size_config.dart';

import 'MapsWidget.dart';

class MapRideBooking extends StatefulWidget {
  @override
  _MapRideBookingState createState() => _MapRideBookingState();
}

class _MapRideBookingState extends State<MapRideBooking> {

  GoogleMapController mapController;
  static const _initialmapposition=LatLng(12.92, 77.02);
  LatLng _lastMapPosition=_initialmapposition;
  int _selectedIndex=0;
  final Set<Marker> _markers={};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
                children: <Widget>[

                  Container(
                    width: SizeConfig.widthMultiplier*100,
                    height: SizeConfig.heightMultiplier*100,
                    child: GoogleMap(

                      mapToolbarEnabled: false,
                      mapType: MapType.terrain,
                      markers: _markers,
                      myLocationButtonEnabled: true,
                      onMapCreated: onCreated,
                      initialCameraPosition: CameraPosition(
                          bearing: 192.8334901395799,

                          target: _initialmapposition,),
                    ),
                  ),
                  Positioned(top: 10,right:SizeConfig.imageSizeMultiplier*4,left: SizeConfig.imageSizeMultiplier*4,child:Column(
                    children: <Widget>[
                      Container(
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
                          height: SizeConfig.heightMultiplier*20,child: BottomRideBook(), decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                          ),),
                      ],
                    ),
                  ),


                ],
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

  void onCreated(GoogleMapController controller){
    setState((){
      mapController=controller;

    });
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
