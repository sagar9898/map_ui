import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapui/size_config.dart';

import 'MapsWidget.dart';

class AddressBooking extends StatefulWidget {
  @override
  _AddressBookingState createState() => _AddressBookingState();
}

class _AddressBookingState extends State<AddressBooking> {
  int selectedPosition = 1;
  int _selectedIndex=0;
  int _changecolor=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Container(
          width:MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(margin:EdgeInsets.only(left: 20,right: 20,top: 10),child: SearchBar(context)),
                  RadioTile(1,'Home','35 A, Vikas Nagar B, Jaipur'),
                  RadioTile(2,'Office','429, Sunny Mart, Jaipur'),
                   RadioTile(3,'Other','429, Gopalpura, Jaipur'),

                ],
              ),
              Positioned(child: Container(height: SizeConfig.heightMultiplier*25, child: BottomRideBook(),decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
              ),),bottom: 0,left: 0,right: 0,),
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
    ),
    );
  }
  Widget RadioTile(int val,String destination,String destinationLocation){
    return Container(
      margin: EdgeInsets.all(20),
      height: SizeConfig.heightMultiplier *10,
        decoration: BoxDecoration(
          color: Colors.white,
        borderRadius : BorderRadius.only(
        topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),),
          boxShadow : [BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.07000000029802322),
        offset: Offset(0,4),
        blurRadius: 4
    )],
    ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 20,top: 20),
                child: Text(destination, textAlign: TextAlign.justify, style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*2,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1
                ),),
              ),
              Container(
                margin: EdgeInsets.only(top: 10,left: 20),
                child: Text(destinationLocation, textAlign: TextAlign.left, style: TextStyle(
                    color: Color(0xff616161),
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*1.8,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,

                    height: 1
                ),),
              )
            ],
          ),
          Radio(value:val,activeColor: Color(0xff6CD342), groupValue: selectedPosition, onChanged:(value) {
            print("selected $val");
            setState(() {
              selectedPosition = value;
            });
          }),
        ],
        
      ),

    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget BottomRideBook(){
    return Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20,left: 20,top: SizeConfig.heightMultiplier*1.1),
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
          Container(margin:EdgeInsets.only(top: 20),child: RaisButton('RIDE NOW'))
        ],
      );
  }

}
