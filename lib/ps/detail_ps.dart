import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/ps/jadwal_piket_rayon.dart';
import 'package:http/http.dart' as http;
import 'package:scr_wikrama/ps/rekap_piket.dart';

class DetailPS extends StatefulWidget {
  const DetailPS({super.key, required this.dataUser, required this.id_ruang});
  final List dataUser;
  final String id_ruang;

  @override
  State<DetailPS> createState() =>
      _DetailPSState(dataUser: dataUser, id_ruang: id_ruang);
}

class _DetailPSState extends State<DetailPS> {
  _DetailPSState({required this.dataUser, required this.id_ruang});
  final List dataUser;
  String id_ruang;
  late List _senin, _selasa, _rabu, _kamis, _jumat;

  Future<void> _getPiket() async {
    // ambit data piket senin
    var urlSenin = Uri.http("127.0.0.1",
        "/scr_wikrama/students/display_piketSenin.php", {'q': '{http}'});
    var responseSenin = await http.post(urlSenin, body: {
      "id_ruang": id_ruang,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    var urlSelasa = Uri.http("127.0.0.1",
        "/scr_wikrama/students/display_piketSelasa.php", {'q': '{http}'});
    var responseSelasa = await http.post(urlSelasa, body: {
      "id_ruang": id_ruang,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    var urlRabu = Uri.http("127.0.0.1",
        "/scr_wikrama/students/display_piketRabu.php", {'q': '{http}'});
    var responseRabu = await http.post(urlRabu, body: {
      "id_ruang": id_ruang,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    var urlKamis = Uri.http("127.0.0.1",
        "/scr_wikrama/students/display_piketKamis.php", {'q': '{http}'});
    var responseKamis = await http.post(urlKamis, body: {
      "id_ruang": id_ruang,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    var urlJumat = Uri.http("127.0.0.1",
        "/scr_wikrama/students/display_piketJumat.php", {'q': '{http}'});
    var responseJumat = await http.post(urlJumat, body: {
      "id_ruang": id_ruang,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    if (responseSenin.statusCode == 200 && responseSelasa.statusCode == 200) {
      _senin = jsonDecode(responseSenin.body);
      _selasa = jsonDecode(responseSelasa.body);
      _rabu = jsonDecode(responseRabu.body);
      _kamis = jsonDecode(responseKamis.body);
      _jumat = jsonDecode(responseJumat.body);

      print("DEBUG Senin :\n");
      print(_senin);
      print("\nDEBUG Selasa :\n");
      print(_selasa);
      print("\nDEBUG Rabu :\n");
      print(_rabu);
      print("\nDEBUG Kamis :\n");
      print(_kamis);
      print("\nDEBUG Jumat :\n");
      print(_jumat);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => JadwalPiketRayon(
                    id_ruang: id_ruang.toString(),
                    senin: _senin,
                    selasa: _selasa,
                    rabu: _rabu,
                    kamis: _kamis,
                    jumat: _jumat,
                  )));
    } else {
      print("Koneksi gagal!");
    }
  }

  late List _rekapPiketRayon;
  Future<void> _rekapPiket() async {
    // fungsi panggil rekap piket per rayon
    print("\n\n Mengambil data...");

    var url = Uri.http("localhost",
        "/scr_wikrama/students/displayRekapPiketRayon.php", {'q': '{http}'});
    var response = await http.post(url, body: {"id_ruang": id_ruang});

    _rekapPiketRayon = jsonDecode(response.body);
    print(_rekapPiketRayon);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RekapPiket(
        rekapPiket: _rekapPiketRayon,
        idRuang: id_ruang,
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          title: Text("Profil Pembimbing Rayon"),
        ),
        body: ListView.builder(
          itemCount: dataUser.length,
          itemBuilder: (contex, index) {
            return Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 15, left: 15, right: 15),
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
                          padding:
                              EdgeInsets.only(left: 10, bottom: 5, top: 20),
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
                              Text(": " + dataUser[index]["nama"])
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
                              Text(": " + dataUser[index]["jk"])
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
                              Text(": " + dataUser[index]["rayon"])
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
                              Text(": " + dataUser[index]["id_ruang"])
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
                              Text(": " + dataUser[index]["th_ajaran"])
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
                        _getPiket();
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
                      onTap: () {
                        _rekapPiket();
                      },
                      child: ListTile(
                        leading: Icon(Icons.list_alt),
                        title: Text("Rekap Piket"),
                        subtitle: Text(dataUser[index]["id_ruang"]+" | "+dataUser[index]["rayon"]),
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
