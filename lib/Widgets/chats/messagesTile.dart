import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/Screens/TabScreens/Chats.dart';
import 'package:ghaarjaggaa/Screens/chat_screen.dart';

class MessageTile extends StatelessWidget {
  final String name;
  final String uploadedBy;
  final String userId;

  MessageTile({required this.name, required this.uploadedBy, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text('${name[0].toUpperCase()}'),
      ),
      title: Text(name),
      onTap: () {
        Navigator.of(context).pushNamed(ChatScreen.routeName, arguments: {
          'userName': name,
          'uploadedBy': uploadedBy,
          'userId':userId,
        });
      },
    );
  }
}
