import 'package:flutter/material.dart';


import 'package:mapui/Views/AddressSelection.dart';
import 'package:mapui/Views/BookingCard.dart';
import 'package:mapui/Views/CancleRideMap.dart';
import 'package:mapui/Views/CanclingRide.dart';
import 'package:mapui/Views/CompleteRide.dart';
import 'package:mapui/Views/MapRideBooking.dart';
import 'package:mapui/Views/SubmitRide.dart';
import 'package:mapui/Views/MapsWidget.dart';
import 'package:mapui/Views/PaymentForRide.dart';
import 'package:mapui/Views/RideReadyToGo.dart';
import 'package:mapui/size_config.dart';



import 'Views/PolyLineWithRoute.dart';
import 'Views/ProceedToPayMap.dart';
void main() => runApp(MaterialApp(
  showSemanticsDebugger: false,
  home:MyApp(),
  theme: ThemeData(
    primaryColor: Colors.white,
  ),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MapScreen(),
            );
          },
        );
      },
    );
  }
}
