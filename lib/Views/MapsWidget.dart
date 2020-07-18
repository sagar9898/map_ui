
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../size_config.dart';

Widget TopBar(String valueTitle,String address,bool ic){
  return Column(
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(valueTitle, textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Nunito',
                  fontSize: SizeConfig.textMultiplier*2.54,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 0.8181818181818182
              ),),
              Text(address, textAlign: TextAlign.left, style: TextStyle(
                  color: Color.fromRGBO(164, 164, 164, 1),
                  fontFamily: 'Nunito',
                  fontSize: SizeConfig.textMultiplier*1.82,
                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                  fontWeight: FontWeight.normal,
                  height: 1.125
              ),)
            ],
          ),
          Container(child: ic ? Icon(Icons.search,size: 28,) : Container(),),
        ],
      )
    ],
  );
}
Widget BottomRideBook(){
  return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 20,left: 20,top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CarSelection("asset/Icon_svg/image 4.png","Economy"),
              CarSelection("asset/Icon_svg/image 5.png","Economy"),
              CarSelection("asset/Icon_svg/image 6.png","Premimum"),
              CarSelection("asset/Icon_svg/image 7.png","Buisness"),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisButton('RIDE NOW')
      ],
    );
}
Widget CarSelection(String pic,String cartype){
  return Column(
    children: <Widget>[
      Container(
          margin: EdgeInsets.only(top:15),
          width: 60,
          height: 37,
          decoration: BoxDecoration(
            image : DecorationImage(
                image: AssetImage(pic),
                fit: BoxFit.fitWidth
            ),
          )
      ),
      Text('$cartype', textAlign: TextAlign.center, style: TextStyle(
          color: Colors.black,
          fontFamily: 'Nunito',
          fontSize: SizeConfig.textMultiplier*2,
          letterSpacing: -0.3333333432674408,
          fontWeight: FontWeight.normal,
          height: 1
      ),)
    ],
  );
}
Widget RaisButton(String value,{Color color = Colors.lightGreen}){
  return Container(
      width: SizeConfig.imageSizeMultiplier*80,
      height: SizeConfig.imageSizeMultiplier*13,

      child: FlatButton(onPressed:(){},child:Text(value, textAlign: TextAlign.center, style: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontFamily: 'Nunito',
          fontSize: SizeConfig.textMultiplier*1.7,
          letterSpacing: -0.3333333432674408,
          fontWeight: FontWeight.normal,
          height: 1
      ),),
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ));
}
Widget Buttons(String pic){
  return Container(
      height: SizeConfig.textMultiplier*6.5,
      width: SizeConfig.textMultiplier*6.5,
      decoration: BoxDecoration(
        borderRadius : BorderRadius.all(Radius.elliptical(58, 58)),
        color: Colors.white,
        image : DecorationImage(
            image: AssetImage(pic),
            fit: BoxFit.scaleDown
        ),
        boxShadow: [BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
            offset: Offset(0,0),
            blurRadius: 25
        )],

      )
  );
}
BottomForPayment(String Amount){
      return Column(

        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Total Fare -',style: TextStyle(
                    color: Colors.black26,
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*2.2,
                    letterSpacing: -0.3333333432674408,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
                Text(Amount,style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Nunito',
                    fontSize: SizeConfig.textMultiplier*2.2,
                    letterSpacing: -0.3333333432674408,
                    fontWeight: FontWeight.normal,
                    height: 1
                ),),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 17,left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height:SizeConfig.heightMultiplier*5,
                  width: SizeConfig.widthMultiplier*40,
                  child: Center(

                    child: Text('COD (default)', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*2.054,
                        letterSpacing: -0.3333333432674408,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ),
                    decoration: BoxDecoration(
                      border : Border.all(
                        color : Color(0xffCFCFCF),
                        width: 1,
                      ),
                    )
                ),
                Container(
                    height:SizeConfig.heightMultiplier*5,
                    width: SizeConfig.widthMultiplier*40,
                    child: Center(

                      child: Text('COD (default)', textAlign: TextAlign.center, style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Nunito',
                          fontSize:SizeConfig.textMultiplier*2.054,
                          letterSpacing: -0.3333333432674408,
                          fontWeight: FontWeight.normal,
                          height: 1
                      ),),
                    ),
                    decoration: BoxDecoration(
                      border : Border.all(
                        color : Color(0xffCFCFCF),
                        width: 1,
                      ),
                    )
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50),
            child: Center(
              child: Row(
                children: <Widget>[
                  Checkbox(value: true, onChanged:(value){},activeColor:Colors.green ,),
                  Text('Use Reward Points (200 Points)', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(120, 120, 120, 1),
                      fontFamily: 'Nunito',
                      fontSize: SizeConfig.textMultiplier*1.9,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
                ],
              ),
            ),
          ),
          Container(margin:EdgeInsets.only(top: 20),child: RaisButton('CONFIRM BOOKING')),

        ],

      );
}
Widget ProceedPayMap(){
  return Container(
      height: SizeConfig.heightMultiplier*28,

      decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
          color: Colors.white
      )
  );
}
Widget SearchBar(BuildContext context){
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(32.5),
          topRight: Radius.circular(32.5),
          bottomLeft: Radius.circular(32.5),
          bottomRight: Radius.circular(32.5),
        ),
        boxShadow : [BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.20000000298023224),
            offset: Offset(0,0),
            blurRadius: 15
        )]),
    height: SizeConfig.heightMultiplier*7,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 200,
            child: TextField(
              cursorColor: Color(0xff6CD342),
              decoration: InputDecoration(
                hintText: 'Enter Address',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              onChanged: (text) {
                text = text.toLowerCase();
              },
            ),
          ),
          Container(child: Icon(Icons.search)),
        ],
      ),
    ),
  );
}

Widget BottomForCompleteRide(String value){
  return Container(
    height: SizeConfig.heightMultiplier*100,
    child: Column(

      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
//            SizedBox(height: double.minPositive),
        SizedBox(height:SizeConfig.heightMultiplier *40),
        SizedBox(height: double.minPositive),
        Expanded(

          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                          child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Rate Your Trip With Passenger Name", style: TextStyle( fontWeight: FontWeight.bold,color: Colors.black, fontSize: 18, fontFamily: 'Nunito'),),
                                SizedBox(height: SizeConfig.heightMultiplier * 3,),
                                Container(
                                  height: SizeConfig.heightMultiplier* 11,
                                  width: SizeConfig.widthMultiplier * 23,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(100),
                                        topLeft: Radius.circular(100),
                                        bottomRight:Radius.circular(100),
                                        topRight: Radius.circular(100),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
//                          Image.asset("assets/images/${post["image"]}",
                                        image: NetworkImage("https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1866&q=80"),

                                      )
                                  ),
                                ),
//                                  CircleAvatar(
//                                      child: Image.asset('assets/image/apple.png'),
//
//
////                                      backgroundImage: NetworkImage('assets/image/apple.png'),
//                                      radius: 35),
                                SizedBox(height: SizeConfig.heightMultiplier * 1,),
                                Text("Passenger Name", style: TextStyle(fontSize: 20, color: Colors.black,fontFamily: 'Nunito'),),
                                SizedBox(height: SizeConfig.heightMultiplier * 1,),
                                Column(
                                    children: <Widget>[
                                      SizedBox(width: 10,),
                                      SmoothStarRating(
                                          allowHalfRating: false,
                                          starCount: 5,
                                          rating: 4.5,
                                          size: 24.0,
                                          color: Colors.amber,
                                          borderColor: Colors.amber,
                                          spacing: 0.0
                                      ),
                                    ]
                                )
                              ])
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 3,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(
                                color: Colors.grey,
                                blurRadius: 10,
                                offset: Offset(0, 10)
                            )]
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: SizeConfig.heightMultiplier * 15,
                              width: SizeConfig.widthMultiplier * 99,
                              margin: EdgeInsets.all(10),
                              child: TextField(
                                maxLines: 5,
                                decoration: InputDecoration(
                                    hintText: "Write Your Comment",
                                    hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: SizeConfig.heightMultiplier * 4,),

                     RaisButton("Submit")
                    ],
                  ),
                ),
              )),
        ),

      ],
    ),
  );
}
Widget BottomForCanclingRide(){
  return Container(

    child: Container(
      margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*1.1,left: 30,right: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
  children:<Widget>[
          Container(
  child:CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage("https://www.creolestudios.com/kw/wp-content/uploads/2019/08/profile.png"),
  )

  ),
          Container(
            margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*1.1),
            child: Text('Rev Shawn', textAlign: TextAlign.left, style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'Nunito',
                fontSize: SizeConfig.textMultiplier*2,
                letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                fontWeight: FontWeight.normal,
                height: 1
            ),),
          ),
          Container(margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*1.1),child: SmoothStarRating(starCount: 5,color: Colors.amber,)),
          Container(width: SizeConfig.widthMultiplier*30,height:SizeConfig.heightMultiplier*4.5,margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*1.1),child: RaisButton('Call'))
            ]
  ),
              Column(
                children: <Widget>[
                  Image.asset('asset/Icon_svg/image 5.png'),
                  Container(
                    margin:EdgeInsets.only(top: 30),
                    width: SizeConfig.widthMultiplier*25,
                    child: Text('Berline Peugeot 508 Cs954yb', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontFamily: 'Nunito',
                        fontSize: SizeConfig.textMultiplier*2,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  ),
                  Container(width: SizeConfig.widthMultiplier*30,height:SizeConfig.heightMultiplier*4.5,margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*1.5),child: RaisButton('Chat',color: Colors.amber))

                ],
              ),

            ],
          ),
          Container(margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*2.1),child: RaisButton('Cancle Ride',color: Colors.red)),
        ],
      ),
    ),

  );
}


Widget BottomForCancleRide(){
  return Container(
    height: SizeConfig.heightMultiplier*40,
    child: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(margin:EdgeInsets.only(top: 20),height: SizeConfig.heightMultiplier*8,width: SizeConfig.widthMultiplier*18,child: Buttons('asset/Icon_svg/image 4.png')),
            Positioned(bottom:0,right:0,child: Image.asset('asset/Icon_svg/cancle.png'))
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: SizeConfig.heightMultiplier*2,bottom: SizeConfig.heightMultiplier),
          child: Text('Cancel Ride ?', textAlign: TextAlign.left, style: TextStyle(
              color: Colors.black,
              fontFamily: 'Nunito',
              fontSize: SizeConfig.textMultiplier*2.8,
              fontWeight: FontWeight.bold,
              height: 1
          ),),
        ),
        Text('We are working on optimizing your route.', textAlign: TextAlign.left, style: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            fontFamily: 'Nunito',
            fontSize: SizeConfig.textMultiplier*2.051,
            letterSpacing: -0.3333333432674408,
            fontWeight: FontWeight.normal,
            height: 1.5 /*PERCENT not supported*/
        ),),
        Container(margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*3),child: RaisButton('Cancle Ride',color: Colors.red)),
        Container(margin:EdgeInsets.only(top: SizeConfig.heightMultiplier*1.41),child:RaisButton('Don\'t Cancle Ride',color: Color(0xff969696))),
      ],
    ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius : BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),)
  );
  
}