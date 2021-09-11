import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DatabaseMethods {
  String email = "";
  String name = "";
  String ownerEmail = "";
  String ownerName = "";



  createChatRoom(String chatRoomId, chatRoomMap) {
    FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .set(chatRoomMap)
        .catchError((e) {
      print(e);
    });
  }

  fetchCurrentUserData() async {
    final firebaseUser = FirebaseAuth.instance.currentUser!;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((ds) {
      email = ds.data()!['email'];
      name = ds.data()!['username'];
    }).catchError((e) {
      print(e);
    });
  }

  fetchUploadedByUserData(String uploadedBy) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uploadedBy)
        .get()
        .then((ds) {
      ownerEmail = ds.data()!['email'];
      ownerName = ds.data()!['username'];
    }).catchError((e) {
      print(e);
    });
  }

  addConversationMessages(String chatRoomId, messageMap) async {
    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(messageMap)
        .catchError((e) {
      print(e);
    });
  }

  getConversationMessages(String chatRoomId) async {
    await FirebaseFirestore.instance
        .collection("ChatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .snapshots();
  }

  getChatRooms(String userName) async{
    return await FirebaseFirestore.instance
        .collection("ChatRoom")
        .where("users", arrayContains: userName)
        .snapshots();
  }
}
