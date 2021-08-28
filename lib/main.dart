import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/Dashboard/dashboard.dart';
import 'package:ghaarjaggaa/Screens/signup.dart';
import 'package:provider/provider.dart';

import 'PropertiesListing/apartmentslisting.dart';
import 'PropertiesListing/houseslisting.dart';
import 'PropertiesListing/landslisting.dart';
import 'PropertiesListing/roomslisting.dart';
import 'Providers/rooms_provider.dart';
import 'Screens/Property_Detail_Screens/apartment_details.dart';
import 'Screens/Property_Detail_Screens/house_details.dart';
import 'Screens/Property_Detail_Screens/land_details.dart';
import 'Screens/Property_Detail_Screens/room_details.dart';
import 'Screens/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Rooms(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (ctx) => Signin(),
          Signin.routeName: (ctx) => Signin(),
          Signup.routeName: (ctx) => Signup(),
          Dashboard.routeName: (ctx) => Dashboard(),
          ApartmentsList.routeName: (ctx) => ApartmentsList(),
          LandsList.routeName: (ctx) => LandsList(),
          HousesList.routeName: (ctx) => HousesList(),
          RoomsList.routeName: (ctx) => RoomsList(),
          ApartmentDetailScreen.routeName: (ctx) => ApartmentDetailScreen(),
          HouseDetailScreen.routeName: (ctx) => HouseDetailScreen(),
          LandDetailScreen.routeName: (ctx) => LandDetailScreen(),
          RoomDetailScreen.routeName: (ctx) => RoomDetailScreen(),
        },
      ),
    );
  }
}
