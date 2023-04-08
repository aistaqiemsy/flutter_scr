import 'package:flutter/material.dart';

class PPLGRooms extends StatefulWidget {
  const PPLGRooms({super.key, required this.rooms});
  final List rooms;

  @override
  State<PPLGRooms> createState() => _PPLGRoomsState(rooms: rooms);
}

class _PPLGRoomsState extends State<PPLGRooms> {
  _PPLGRoomsState({required this.rooms});
  final List rooms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        leading: Icon(Icons.meeting_room_sharp),
        title: Text("Ruangan PPLG"),
      ),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(1),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(
                  Icons.meeting_room_sharp,
                  color: Colors.amber[300],
                ),
                title: Text(rooms[index]["id_ruang"]),
                subtitle: Text("PJ : "+rooms[index]["PJ"]),
              ),
            ),
          );
        },
      ),
    );
  }
}
