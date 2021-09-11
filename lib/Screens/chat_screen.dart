import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Helpers/database.dart';
import 'package:ghaarjaggaa/Widgets/chats/messages.dart';
import 'package:ghaarjaggaa/Widgets/chats/new_messages.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = '/chat_screen';
  final String chatRoomId;

  ChatScreen({required this.chatRoomId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final user = FirebaseAuth.instance.currentUser;
  final _msgController = TextEditingController();
  var enteredMessage = "";
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream<QuerySnapshot>? chatMessagesStream;

  void _loadCurrentUSerData() async {
    await databaseMethods.fetchCurrentUserData();
    setState(() {});
  }

  @override
  void initState() {
    _loadCurrentUSerData();
    databaseMethods.getConversationMessages(widget.chatRoomId).then((value) {
      setState(() {
        chatMessagesStream = value;
      });
    });
    super.initState();
  }

  Widget chatMessagesList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("ChatRoom")
          .doc("${widget.chatRoomId}")
          .collection('chats')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            reverse: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return MessageTile(
                message: snapshot.data!.docs[index]['message'],
                isSentByMe: snapshot.data!.docs[index]['sentBy'] ==
                    databaseMethods.name,
              );
            });
      },
    );
  }

  //for sending message
  void _sendMsg() async {
    await databaseMethods.fetchCurrentUserData();
    Map<String, dynamic> messageMap = {
      "message": enteredMessage,
      "sentBy": databaseMethods.name,
      "time": Timestamp.now(),
      "userId": FirebaseAuth.instance.currentUser!.uid,
    };
    databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
    _msgController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        title: Text("${databaseMethods.ownerName}"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: chatMessagesList(),
                ),
              ),

              //message entering field
              Container(
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _msgController,
                        decoration: InputDecoration(
                          labelText: "Send a message...",
                          labelStyle: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        onChanged: (value) {
                          enteredMessage = value;
                        },
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    IconButton(
                      onPressed:
                          enteredMessage.trim().isEmpty ? null : _sendMsg,
                      icon: Icon(
                        Icons.send,
                      ),
                    )
                  ],
                ),
              )

              // NewMessage(
              //   uploadedBy: uploadedBy,
              //   userId: userId,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSentByMe;

  MessageTile({required this.message, required this.isSentByMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width,
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: isSentByMe ? Colors.purple : Colors.blue,
          borderRadius: isSentByMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                  bottomLeft: Radius.circular(23))
              : BorderRadius.only(
                  topLeft: Radius.circular(23),
                  topRight: Radius.circular(23),
                  bottomRight: Radius.circular(23)),
        ),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
      ),
    );
  }
}
