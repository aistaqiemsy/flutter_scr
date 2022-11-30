import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:scr_wikrama/ps/detail_piket.dart';
import 'package:http/http.dart' as http;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:scr_wikrama/ps/tambah_piket_harian.dart';

class RekapPiket extends StatefulWidget {
  const RekapPiket(
      {super.key, required this.rekapPiket, required this.idRuang});
  final List rekapPiket;
  final String idRuang;

  @override
  State<RekapPiket> createState() =>
      _RekapPiketState(rekap: rekapPiket, id_ruang: idRuang);
}

class _RekapPiketState extends State<RekapPiket> {
  _RekapPiketState({required this.rekap, required this.id_ruang});
  List rekap;
  String id_ruang;

  //setting state tanggal
  late DateTime _tglController;

  static const List<String> list = <String>["-", "V"];
  String _valueSapuLantai = list.first;
  String _valueLapKaca = list.first;
  String _valuepelLantai = list.first;
  String _valueMejaKursi = list.first;
  String _valueCleanSampah = list.first;
  String _valueLapKomputer = list.first;
  String _valueSaklar = list.first;

  TextEditingController _idRuangController = new TextEditingController();
  TextEditingController _checkerController = new TextEditingController();
  TextEditingController _ketController = new TextEditingController();

  Future<void> _simpanPiket() async {
    // var url = // server wikrama
    //     Uri.http(
    //         "10.20.30.100:812",
    //         "/scr_wikrama/students/piket/tambah_piket_harian.php",
    //         {'q': '{http}'});

    var url = // server lokal
        Uri.http(
            "localhost",
            "/scr_wikrama/students/piket/tambah_piket_harian.php",
            {'q': '{http}'});

    var response = await http.post(url, body: {
      "id_ruang": _idRuangController.text,
      "tgl": _tglController.toString(),
      "checker": _checkerController.text,
      "sapu": _valueSapuLantai,
      "lap": _valueLapKaca,
      "pel": _valuepelLantai,
      "meja": _valueMejaKursi,
      "clean": _valueCleanSampah,
      "lap_pc": _valueLapKaca,
      "lampu": _valueSaklar,
      "ket_lain": _ketController.text
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    if (response.statusCode == 200) {
      var simpanSiswa = jsonDecode(response.body);
      print(simpanSiswa);

      // showDialog(
      //     //tampilkan pesan tambah data lagi atau tidak
      //     context: context,
      //     builder: (BuildContext content) {
      //       return Expanded(
      //           child: AlertDialog(
      //         content: ListTile(
      //           leading: Icon(
      //             Icons.info,
      //             color: Colors.lightGreenAccent[600],
      //           ),
      //           title: Text(
      //             "Data berhasil disimpan!",
      //             style: TextStyle(color: Colors.brown[400]),
      //           ),
      //         ),
      //         actions: [
      //           ElevatedButton(
      //               child: Text(
      //                 "OK",
      //                 style: TextStyle(color: Colors.white),
      //               ),
      //               onPressed: () {
      //                 _refreshPiket(); // panggil fungsi refresh data

      //                 print("Tombol ['OK'] ditekan...");
      //                 Navigator.pop(context);
      //               }),
      //         ],
      //       ));
      //     });

    } else {
      print("Koneksi gagal!");
    }
  }

  void _tambahPiketHarian() {
    Route route = MaterialPageRoute(builder: (context) => TambahPiketHarian(
                getRuang: rekap,
                idRuang: id_ruang,
              ));
    Navigator.push(
      context,
      route
    ).then(onGoBack);
  }

  Future<void> _refreshPiket() async {
    // fungsi panggil rekap piket per rayon untuk refresh

    // var url = // server wikrama
    //     Uri.http(
    //         "10.20.30.100:812",
    //         "/scr_wikrama/students/displayRekapPiketRayon.php", {'q': '{http}'});

    // var url = // server wikrama
    //     Uri.http(
    //         "10.20.30.100:812",
    //         "/scr_wikrama/students/displayRekapPiketRayon.php",
    //         {'q': '{http}'});

    var url = // server lokal
        Uri.http(
            "localhost",
            "/scr_wikrama/students/displayRekapPiketRayon.php",
            {'q': '{http}'});
    try {
      // var response = await http.get(url);
      var response = await http.post(url, body: {"id_ruang": id_ruang});

      setState(() {
        rekap = jsonDecode(response.body);
      });
    } catch (e) {
      print(e);
    }
  }

  void _refreshData() {
    _refreshPiket();
  }

  FutureOr onGoBack(dynamic value) {
    // fungsi untuk saat kembali dari screen, maka refresh screen
    _refreshData();
    setState(() {});
  }

  //format tanggal ke hari
  String formatHari(String tanggal) {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);
    var day = DateFormat('EEEE').format(dateTime);
    var hari = "";
    switch (day) {
      case 'Sunday':
        {
          hari = "Minggu";
        }
        break;
      case 'Monday':
        {
          hari = "Senin";
        }
        break;
      case 'Tuesday':
        {
          hari = "Selasa";
        }
        break;
      case 'Wednesday':
        {
          hari = "Rabu";
        }
        break;
      case 'Thursday':
        {
          hari = "Kamis";
        }
        break;
      case 'Friday':
        {
          hari = "Jumat";
        }
        break;
      case 'Saturday':
        {
          hari = "Sabtu";
        }
        break;
    }
    return hari;
  }

  @override
  void initState() {
    _idRuangController.text = id_ruang;
    _refreshPiket();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Rekap Piket Rayon"),
      ),
      body: ListView.builder(
        itemCount: rekap.length,
        itemBuilder: (context, index) {
          return Card(
            // elevation: 2,
            color: Colors.amber[100],
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPiket(
                            piket: rekap,
                          )),
                );
              },
              child: ListTile(
                title: Text(formatHari(rekap[index]["tgl_piket"])),
                subtitle: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(rekap[index]["tgl_piket"]),
                    ),
                    Text(rekap[index]["checker"])
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[900],
        child: Icon(Icons.post_add_outlined),
        onPressed: () {
          _tambahPiketHarian();
        },
      ),
    );
  }
}
