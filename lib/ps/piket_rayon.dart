import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:scr_wikrama/ps/detail_ps.dart';

class PiketRayon extends StatefulWidget {
  const PiketRayon({super.key, required this.pembimbing, required this.id_ps});

  final String pembimbing;
  final int id_ps;
  @override
  State<PiketRayon> createState() => _PiketRayonState();
}

class _PiketRayonState extends State<PiketRayon> {
  String pembimbing = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.clean_hands
        ),
        backgroundColor: Colors.amber[600],
        title: Text("Piket Rayon"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber[50],
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPS(
                                        pembimbing: pembimbing,
                                        id_ps: 1,
                                      )));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[100],
                                child: Icon(
                                  Icons.people_alt_rounded,
                                  color: Colors.amberAccent[400],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              child: Text("Pembimbing Rayon",
                                  textAlign: TextAlign.center),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber[50],
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DisplayStudent()
                                  ));
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[100],
                                child: Icon(
                                  Icons.people_alt_rounded,
                                  color: Colors.amberAccent[400],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              child: Text(
                                "Peserta Didik",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  child: Card(
                    elevation: 3,
                    color: Colors.amber[50],
                    child: InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: CircleAvatar(
                                backgroundColor: Colors.amber[100],
                                child: Icon(
                                  Icons.people_alt_rounded,
                                  color: Colors.amberAccent[400],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: 10, left: 5, right: 5),
                              child: Text(
                                "Ruangan PPLG",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, right: 5, left: 5),
            child: Card(
              color: Colors.amber[50],
              elevation: 3,
              child: InkWell(
                onTap: () {},
                child: ListTile(
                  title: Text("Rekap Piket"),
                  subtitle: Text("134, 206, 207, 210, 322, 323"),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
