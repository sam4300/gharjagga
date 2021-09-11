import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Components/drawer.dart';
import 'package:ghaarjaggaa/Helpers/database.dart';
import 'package:ghaarjaggaa/Screens/chat_screen.dart';
import 'package:ghaarjaggaa/Widgets/chats/messagesTile.dart';

class ChatScreenTab extends StatefulWidget {
  static const routeName = "/notificationScreen";

  const ChatScreenTab({Key? key}) : super(key: key);

  @override
  _ChatScreenTabState createState() => _ChatScreenTabState();
}

class _ChatScreenTabState extends State<ChatScreenTab> {
  final uId = FirebaseAuth.instance.currentUser!.uid;
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream<QuerySnapshot>? chatRoomStream;

  void _loadCurrentUSerData() async {
    await databaseMethods.fetchCurrentUserData();
    databaseMethods.getChatRooms(databaseMethods.name).then((value) {
      setState(() {
        chatRoomStream = value;
      });
    });
    setState(() {});
  }

  @override
  void initState() {
    _loadCurrentUSerData();

    super.initState();
  }

  Widget chatRoomList() {
    return StreamBuilder(
        stream: chatRoomStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return MessageTile(
                  chatRoomID: snapshot.data!.docs[index]["chatRoomId"],
                  userNameOther: snapshot.data!.docs[index]["chatRoomId"]
                      .toString().replaceAll("_", "").replaceAll(
                      databaseMethods.name, ""));
            },
          )
              : Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("Chats"),
      ),
      body: chatRoomList(),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String userNameOther;
  final String chatRoomID;

  MessageTile({required this.userNameOther, required this.chatRoomID});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${userNameOther[0].toUpperCase()}'),
      ),
      title: Text(userNameOther),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)
        =>
            ChatScreen(chatRoomId: chatRoomID)
        ));
      },
    );
  }
}
