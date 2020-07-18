import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapui/size_config.dart';
class BookingCardUI extends StatefulWidget {
  @override
  _BookingCardUIState createState() => new _BookingCardUIState();
}

class _BookingCardUIState extends State<BookingCardUI> {

  Widget build(BuildContext context) {
    return new Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(margin:EdgeInsets.only(left: 10,top: 20),child: Icon(Icons.arrow_back)),
              Container(
                margin:EdgeInsets.only(left: 15,top: 20),
                child: Text('Past Booking', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*3.3,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 0.6
                ),),
              ),
              Container(margin:EdgeInsets.only(top: 10,left: 10,right: 10),child: CardView()),
            ],
          ),
            ),
          ),
        );
  }
}

Widget CardView(){
  return Container(
    height: SizeConfig.heightMultiplier*30,
    width: SizeConfig.widthMultiplier*100,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment:CrossAxisAlignment.start,

      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10),
          alignment: Alignment.topRight,
          child: Text('Date & Time :  15-March-2020  13:15:05', textAlign: TextAlign.left, style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 1),
              fontFamily: 'Nunito',
              fontSize: 14,
              letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
              fontWeight: FontWeight.normal,
              height: 1.2857142857142858
          ),),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              Image.asset('asset/Icon_svg/image 4.png'),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Text('Audi Q3', textAlign: TextAlign.left, style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*2.9,
                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 0.75
                ),),
              ),


            ],
          ),
        ),
        Row(
          children: <Widget>[
            Container(margin:EdgeInsets.only(left: 10),child: Icon(Icons.location_on,color: Color(0xFF6CD342),)),
            Container(margin:EdgeInsets.only(left: 10,top: 10),child: Component('From','35-a Vikas Nagar B, Jaipur Rajasthan (India) - 302021')),
          ],
        )
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10)
      ),
      color: Colors.white
    ),
  );
}

Widget Component(String key,String value){
  return Row(
    children: <Widget>[
      Container(
        height: SizeConfig.heightMultiplier*3,
        child: Text('$key :',style: TextStyle(
            color: Colors.black,
            fontFamily: 'Nunito',
            fontSize: SizeConfig.textMultiplier*2,
            letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
            fontWeight: FontWeight.normal,
            height: 0.75
        ),),
      ),
      Container(
        margin: EdgeInsets.only(left: 10),
        height: SizeConfig.heightMultiplier*3.3,
        width: SizeConfig.widthMultiplier*60,
        child: Text(value,maxLines:3,style: TextStyle(
            color: Color(0xff787878),
            fontFamily: 'Nunito',
            fontSize: SizeConfig.textMultiplier*2,
            fontWeight: FontWeight.normal,
            height: 1
        ),),
      ),
    ],
  );
}