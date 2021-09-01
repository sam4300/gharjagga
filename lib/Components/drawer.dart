import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ghaarjaggaa/Providers/dbProvider.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[850],
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.grey[850],
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
                      child:
                          CircleAvatar(radius: 40, child: Icon(Icons.person)),
                    ),
                    FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.uid)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text(
                              "loading...",
                              style: TextStyle(color: Colors.white),
                            );
                          }
                          return Text(
                            snapshot.data!['email'],
                            style: TextStyle(color: Colors.white),
                          );
                        }),
                  ],
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'log out',
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onTap: () {
                  FirebaseAuth.instance.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
