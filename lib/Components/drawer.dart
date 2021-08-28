import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: Column(
          children: [
            AppBar(backgroundColor: Colors.grey[850],
              title: Text('DETAILS'),
            ),
            Container(
              width: double.infinity,
              height: 120,
              child: Card(
                color: Colors.grey[850],
                shadowColor: Colors.grey,
                elevation: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          radius: 40,
                          child: Icon(Icons.person)
                      ),
                    ),
                    Text('Thapasamar48@gmail.com', style: TextStyle(color: Colors.white),),
                  ],
                ),

              ),
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white,),
              title: Text(
                'My Details',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            ListTile(
                leading: Icon(Icons.favorite,color: Colors.white,),
                title: Text(
                  'Your Favorites',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                onTap: () {}),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            ListTile(
                leading: Icon(Icons.edit,color: Colors.white,),
                title: Text(
                  'Manage Products',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                onTap: () {}),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
