import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class JadwalPiketRayon extends StatefulWidget {
  const JadwalPiketRayon({super.key});

  @override
  State<JadwalPiketRayon> createState() => _JadwalPiketRayonState();
}

class _JadwalPiketRayonState extends State<JadwalPiketRayon> {
  final List nama_petugas = ["Andi", "Dika", "Rani", "Budi", "Rena"];
  final List day = ["Senin", "Selasa", "Rabu", "Kamis", "Jum'at"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Jadwal Piket Rayon"),
      ),
      body: ListView.builder(
        itemCount: nama_petugas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10, left: 10),
            child: Card(
              elevation: 5,
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(day[index]),
                        subtitle: Text(nama_petugas[index]),
                      )
                    ],
                  ),
                ),
          );
        },
      ),
    );
  }
}
