import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class JadwalPiketRayon extends StatefulWidget {
  const JadwalPiketRayon({
    super.key,
    required this.id_ruang,
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat
  });
  final String id_ruang;
  final List senin, selasa, rabu, kamis, jumat;

  @override
  State<JadwalPiketRayon> createState() => _JadwalPiketRayonState(
      id_ruang: id_ruang,
      senin: senin,
      selasa: selasa,
      rabu: rabu,
      kamis: kamis,
      jumat: jumat
  );
}

class _JadwalPiketRayonState extends State<JadwalPiketRayon> {
  _JadwalPiketRayonState({
    required this.id_ruang,
    required this.senin,
    required this.selasa,
    required this.rabu,
    required this.kamis,
    required this.jumat
  });
  final String id_ruang;
  List senin, selasa, rabu, kamis, jumat;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Jadwal Piket Rayon"),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                  child: Center(
                    child: Text("SENIN"),
                  ),
                ),
              Divider(),
              Card(
                elevation: 5,
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: senin.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(""+senin[index]["nama"]),
                          ),
                          Text(""+senin[index]["rombel"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                  child: Center(
                    child: Text("SELASA"),
                  ),
                ),
              Divider(),
              Card(
                elevation: 5,
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: selasa.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(""+selasa[index]["nama"]),
                          ),
                          Text(""+selasa[index]["rombel"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                  child: Center(
                    child: Text("RABU"),
                  ),
                ),
              Divider(),
              Card(
                elevation: 5,
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rabu.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(""+rabu[index]["nama"]),
                          ),
                          Text(""+rabu[index]["rombel"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                  child: Center(
                    child: Text("KAMIS"),
                  ),
                ),
              Divider(),
              Card(
                elevation: 5,
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: kamis.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(""+kamis[index]["nama"]),
                          ),
                          Text(""+kamis[index]["rombel"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 10, right: 10),
                  child: Center(
                    child: Text("JUM'AT"),
                  ),
                ),
              Divider(),
              Card(
                elevation: 5,
                color: Colors.amber[50],
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: jumat.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(""+jumat[index]["nama"]),
                          ),
                          Text(""+jumat[index]["rombel"])
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text(""),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}
