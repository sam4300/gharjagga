import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class DBProvider with ChangeNotifier {
  Future<String> getCurrentUserId()  async{
   final user =  FirebaseAuth.instance.currentUser!;
    return user.uid;
  }
}
