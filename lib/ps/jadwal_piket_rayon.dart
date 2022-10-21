import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class JadwalPiketRayon extends StatefulWidget {
  const JadwalPiketRayon({super.key, required this.piketSiswa});
  final List piketSiswa;

  @override
  State<JadwalPiketRayon> createState() => _JadwalPiketRayonState();

}

class _JadwalPiketRayonState extends State<JadwalPiketRayon> {
  final List nama_petugas = ["Andi", "Dika", "Rani", "Budi", "Rena"];
  final List day = ["Senin", "Selasa", "Rabu", "Kamis", "Jum'at"];


  late List _dataSenin;
  Future<void> _getSenin() async {
    var url =
    Uri.http("127.0.0.1", "/scr_wikrama/display_piket_rayon.php", {'q': '{http}'});
    var response = await http.post(url,
        body: {"username": "Senin", "password": "Senin"},
        headers: {
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        }
    );

    if (response.statusCode == 200) {
      _dataSenin = jsonDecode(response.body);
      var data = JadwalPiketRayon(
          piketSiswa: _dataSenin
      );

      print(_dataSenin);
    } else {
      print("Koneksi gagal!");
    }
  }

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
