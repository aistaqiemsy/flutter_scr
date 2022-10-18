// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/ps/piket_rayon.dart';

class DashboardPs extends StatelessWidget {
  const DashboardPs({super.key, required this.pembimbing, required this.id_ps});

  final List pembimbing;
  final int id_ps;

  @override
  Widget build(BuildContext context) {
    late String _pembimbing;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          leading: Image.asset(
            "assets/icons/clean_room.png",
            width: 35,
            height: 35,
          ),
          title: Text("PPLG APPS"),
        ),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: pembimbing.length,
              itemBuilder: (context, index) {
                _pembimbing = pembimbing[index]["nama"];
                return ListTile(
                    title: Text("Selamat Datang Bapak / Ibu"),
                    subtitle: Text(pembimbing[index]["nama"])
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 25),
              child: Card(
                  color: Colors.amber[50],
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PiketRayon(
                                pembimbing: _pembimbing,
                                id_ps: 1,
                              )
                          )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/clean_room.png",
                            width: 25,
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Piket Rayon"),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Card(
                  color: Colors.amber[50],
                  elevation: 2,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PiketRayon(
                                pembimbing: _pembimbing,
                                id_ps: 1,
                              )
                          )
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icons/clean_room.png",
                            width: 25,
                            height: 25,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Peminjaman"),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            )
          ],
        )
    );
  }
  }