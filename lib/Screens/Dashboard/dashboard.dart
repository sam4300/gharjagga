import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Components/category_card.dart';
import 'package:ghaarjaggaa/Components/drawer.dart';
import 'package:ghaarjaggaa/PropertiesListing/apartmentslisting.dart';
import 'package:ghaarjaggaa/PropertiesListing/houseslisting.dart';
import 'package:ghaarjaggaa/PropertiesListing/landslisting.dart';
import 'package:ghaarjaggaa/PropertiesListing/roomslisting.dart';
import 'package:ghaarjaggaa/Providers/dbProvider.dart';
import 'package:ghaarjaggaa/Screens/Dashboard/searchpage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static const routeName = '/dashboard';

  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Widget greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return Text(
        'Good Morning',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      );
    } else if (hour < 17) {
      return Text(
        'Good Afternoon',
        style: TextStyle(
          color: Colors.white,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      );
    }
    return Text(
      'Good Evening',
      style: TextStyle(
        color: Colors.white,
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (ctx) => DBProvider(),
      child: Scaffold(
          backgroundColor: Colors.grey[850],
          appBar: AppBar(
            title: Text('GHARJAGGA'),
            centerTitle: true,
            backgroundColor: Colors.grey[850],
          ),
          drawer: MainDrawer(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: TextField(
                    readOnly: true,
                    showCursor: true,
                    autofocus: false,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 40.0,
                        ),
                        hintText: 'Enter Address, Town or property Id',
                        hintStyle: TextStyle(
                          color: Colors.white54,
                          fontSize: 15,
                        )),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SearchPage();
                      }));
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(DateFormat.yMMMd().format(DateTime.now()),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      DateFormat('EEEE').format(
                        DateTime.now(),
                      ),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: greeting(),
                ),
                SizedBox(height: size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'EXPLORE GHARJAGGA',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(ApartmentsList.routeName);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                            height: 200,
                            width: size.width / 2.5,
                            child: CategoryCard(
                                "assets/images/apartment.jpg", "Apartment")),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(HousesList.routeName);
                      },
                      child: Container(
                          height: 200,
                          width: size.width / 2.5,
                          child:
                              CategoryCard("assets/images/house.jpg", "House")),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(LandsList.routeName);
                      },
                      child: Container(
                          height: 200,
                          width: size.width / 2.5,
                          child:
                              CategoryCard("assets/images/land.jpg", "Land")),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(RoomsList.routeName);
                      },
                      child: Container(
                          height: 200,
                          width: size.width / 2.5,
                          child: CategoryCard(
                              "assets/images/bedroom-416062_1280.jpg", "Room")),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recommended Properties',
                    style: TextStyle(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          )),
    );
  }
}
