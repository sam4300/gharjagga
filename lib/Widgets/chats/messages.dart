// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ghaarjaggaa/Widgets/messageBubble.dart';
//
// class Messages extends StatelessWidget {
//   final String uploadedBy;
//   final String userId;
//
//   Messages({required this.uploadedBy, required this.userId});
//
//   @override
//   Widget build(BuildContext context) {
//     String uId = FirebaseAuth.instance.currentUser!.uid;
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance
//           .collection(uploadedBy)
//           .where('userId', isEqualTo: userId)
//           .snapshots(),
//       builder: (ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return ListView.builder(
//           reverse: true,
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (ctx, index) => MessageBubble(
//               message: snapshot.data!.docs[index]['text'],
//               isMe: snapshot.data!.docs[index]['userId'] == uId),
//         );
//       },
//     );
//   }
// }
