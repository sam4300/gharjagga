import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ghaarjaggaa/Components/testing_screen.dart';
import 'package:ghaarjaggaa/Providers/location_provider.dart';
import 'package:ghaarjaggaa/Screens/Dashboard/dashboard.dart';
import 'package:ghaarjaggaa/Screens/Dashboard/tabscreen.dart';
import 'package:ghaarjaggaa/Screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'PropertiesListing/apartmentslisting.dart';
import 'PropertiesListing/houseslisting.dart';
import 'PropertiesListing/landslisting.dart';
import 'PropertiesListing/myPropertyListing.dart';
import 'PropertiesListing/roomslisting.dart';
import 'Providers/rooms_provider.dart';
import 'Screens/Property_Detail_Screens/property_details.dart';
import 'Screens/Property_Detail_Screens/my_property_detail_screen.dart';
import 'Screens/TabScreens/my_Profile.dart';
import 'Screens/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Screens/chat_screen.dart';
import 'Screens/property_Editing_screen.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMesagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Rooms(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LocationProvider(),
        ),
      ],
      child: MaterialApp(
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return TabScreen();
            }
            return AuthScreen();
          },
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          AuthScreen.routeName: (ctx) => AuthScreen(),
          Dashboard.routeName: (ctx) => Dashboard(),
          ApartmentsList.routeName: (ctx) => ApartmentsList(),
          LandsList.routeName: (ctx) => LandsList(),
          HousesList.routeName: (ctx) => HousesList(),
          RoomsList.routeName: (ctx) => RoomsList(),
          ApartmentDetailScreen.routeName: (ctx) => ApartmentDetailScreen(),
          TabScreen.routeName: (ctx) => TabScreen(),
          MyProperties.routeName: (ctx) => MyProperties(),
          MyPropertyDetailScreen.routeName: (ctx) => MyPropertyDetailScreen(),
          MyProfile.routeName: (ctx) => MyProfile(),
        },
      ),
    );
  }
}
