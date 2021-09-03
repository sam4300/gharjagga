import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DBProvider with ChangeNotifier {
  String email = "";

  String getCurrentUserId() {
    return FirebaseAuth.instance.currentUser!.uid;
  }


}
