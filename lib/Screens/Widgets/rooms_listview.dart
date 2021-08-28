import 'package:flutter/material.dart';
import 'package:ghaarjaggaa/PropertyItem/room_item.dart';
import 'package:ghaarjaggaa/Providers/rooms_provider.dart';
import 'package:provider/provider.dart';

class RoomsListView extends StatelessWidget {
  const RoomsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roomsData = Provider.of<Rooms>(context);
    final items = roomsData.roomsList;
    return ListView.builder(
      itemBuilder: (ctx, i) {
        return RoomItem(
          title: "Land Available",
          availability: "available",
          imageUrl:
          "https://scontent.fktm8-1.fna.fbcdn.net/v/t39.30808-6/239861959_1585425988455763_605470524180909019_n.jpg?_nc_cat=106&ccb=1-5&_nc_sid=e3f864&_nc_ohc=479olnsIrrgAX8PP7Wz&tn=iZvOj0a6_xA1qHef&_nc_ht=scontent.fktm8-1.fna&oh=20f56307153fa226665b3288ec288b3e&oe=61221344",
          location: "Lalitpur, Nepal",
          price: 2000,
        );
      },
      itemCount: items.length,
    );
  }
}
