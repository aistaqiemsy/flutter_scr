import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/ps/jadwal_piket_rayon.dart';

class DetailPS extends StatefulWidget {
  const DetailPS({super.key, required this.pembimbing, required this.id_ps});
  final String pembimbing;
  final int id_ps;

  @override
  State<DetailPS> createState() => _DetailPSState();
}

class _DetailPSState extends State<DetailPS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Profil Pembimbing Rayon"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
            child: Card(
              color: Colors.amber[50],
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 15),
                    child: CircleAvatar(
                      child: Icon(
                        Icons.people_rounded,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5, top: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 200,
                            child: Text("Nama"),
                          ),
                        ),
                        Text(": [Nama]")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 200,
                            child: Text("Kelamin"),
                          ),
                        ),
                        Text(": [Kelamin]")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 200,
                            child: Text("Rayon"),
                          ),
                        ),
                        Text(": [Rayon]")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 5),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 200,
                            child: Text("Ruang"),
                          ),
                        ),
                        Text(": [Ruang]")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, bottom: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 0),
                          child: Container(
                            width: 200,
                            child: Text("Tahun Ajaran"),
                          ),
                        ),
                        Text(": [Tahun Ajaran]")
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, right: 15, left: 15),
            child: Card(
              color: Colors.amber[50],
              elevation: 3,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => JadwalPiketRayon()
                      )
                  );
                },
                child: ListTile(
                  leading: Icon(Icons.people_sharp),
                  title: Text("Jadwal Piket"),
                  subtitle: Text("Jadwal Piket Harian Rayon"),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, right: 15, left: 15),
            child: Card(
              color: Colors.amber[50],
              elevation: 3,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.list_alt),
                  title: Text("Rekap Piket"),
                  subtitle: Text("[Ruang] | [Rayon]"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
