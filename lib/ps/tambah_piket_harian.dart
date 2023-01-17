import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:scr_wikrama/ps/rekap_piket.dart';

class TambahPiketHarian extends StatefulWidget {
  const TambahPiketHarian(
      {super.key, required this.getRuang, required this.idRuang});
  final List getRuang;
  final String idRuang;

  @override
  State<TambahPiketHarian> createState() =>
      _TambahPiketHarianState(getRuang: getRuang, idRuang: idRuang);
}

class _TambahPiketHarianState extends State<TambahPiketHarian> {
  _TambahPiketHarianState({required this.getRuang, required this.idRuang});
  late DateTime _tglController;
  late List getRuang;
  late String idRuang;

  static const List<String> list = <String>["-", "V"];
  // String _valueSapuLantai = list.first;

  late String _valueSapuLantai;
  late String _valueLapKaca;
  late String _valuePelLantai;
  late String _valueMejaKursi;
  late String _valueCleanSampah;
  late String _valueLapKomputer;
  late String _valueSaklar;

  TextEditingController _idRuang = new TextEditingController();
  TextEditingController _checker = new TextEditingController();
  TextEditingController _valueKetLain = new TextEditingController();

  bool bSapuLantai = false,
      bLapKaca = false,
      bPelLantai = false,
      bMejaKursi = false,
      bCleanSampah = false,
      bLapKomputer = false,
      bDeviceOff = false,
      bInfoLain = false;

  Future<void> _simpanPiket() async {
    // var url = // server wikrama
    //     Uri.http(
    //         "10.20.30.100:812",
    //         "/scr_wikrama/students/piket/tambah_piket_harian.php",
    //         {'q': '{http}'});

    var url = Uri.http("localhost",
        "/scr_wikrama/students/piket/tambah_piket_harian.php", {'q': '{http}'});

    var response = await http.post(url, body: {
      "id_ruang": _idRuang.text,
      "tgl": _tglController.toString(),
      "checker": _checker.text,
      "sapu": bSapuLantai.toString(),
      "lap": bLapKaca.toString(),
      "pel": bPelLantai.toString(),
      "meja": bMejaKursi.toString(),
      "clean": bCleanSampah.toString(),
      "lap_pc": bLapKomputer.toString(),
      "lampu": bDeviceOff.toString(),
      "ket_lain": _valueKetLain.text
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS" 
    });

    if (response.statusCode == 200) {
      var simpanSiswa = jsonDecode(response.body);
      print(simpanSiswa);

      const snackBar = SnackBar(
        content: Text('Data piket berhasil disimpan!'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.pop(context);
    } else {
      print("Koneksi gagal!");
    }
  }

  @override
  void initState() {
    _idRuang.text = idRuang;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.list_rounded),
        backgroundColor: Colors.amber[600],
        title: Text("Piket Hari Ini"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _idRuang,
              enabled: false,
              decoration: InputDecoration(
                  hintText: ("Ruang"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60, right: 20, bottom: 5),
            child: DateTimeField(
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.date_range),
              ),
              initialValue: DateTime.now(),
              format: DateFormat("yyyy-MM-dd"),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(1998),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  return _tglController = DateTime.now();
                }
                return currentValue;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _checker,
              decoration: InputDecoration(
                  hintText: ("Saksi ( Nama PS / PJ )"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bSapuLantai,
                    onChanged: (value) {
                      setState(() {
                        this.bSapuLantai = value!;
                        print("VALUE SAPU LANTAI ==> $bSapuLantai\n");
                        _valueSapuLantai = bSapuLantai.toString();
                        print("TEXT ==> $_valueSapuLantai");
                      });
                    },
                  ),
                  Text("Sapu Lantai")
                ],
              )
              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Sapu Lantai'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueSapuLantai = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bLapKaca,
                    onChanged: (value) {
                      setState(() {
                        this.bLapKaca = value!;
                        print("VALUE LAP KACA ==> $bLapKaca");
                        _valueLapKaca = bLapKaca.toString();
                      });
                    },
                  ),
                  Text("Lap Kaca")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Lap Kaca'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueLapKaca = value!;
              //       });
              //     })
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bPelLantai,
                    onChanged: (value) {
                      setState(() {
                        this.bPelLantai = value!;
                        print("VALUE PEL LANTAI ==> $bPelLantai");
                        _valuePelLantai = bPelLantai.toString();
                      });
                    },
                  ),
                  Text("Pel Lantai")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Pel Lantai'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valuepelLantai = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bMejaKursi,
                    onChanged: (value) {
                      setState(() {
                        this.bMejaKursi = value!;
                        print("VALUE MEJA KURSI ==> $bMejaKursi");
                        _valueMejaKursi = bMejaKursi.toString();
                      });
                    },
                  ),
                  Text("Membersihkan / Merapikan Meja dan Kursi")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Merapikan Meja dan Kursi'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueMejaKursi = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bCleanSampah,
                    onChanged: (value) {
                      setState(() {
                        this.bCleanSampah = value!;
                        print("VALUE MEMBERSIHKAN SAMPAH ==> $bCleanSampah");
                        _valueCleanSampah = bCleanSampah.toString();
                      });
                    },
                  ),
                  Text("Membersihkan Sampah ( Luar - Dalam )")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Membersihkan Sampah'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueCleanSampah = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bLapKomputer,
                    onChanged: (value) {
                      setState(() {
                        this.bLapKomputer = value!;
                        print("LAP KOMPUTER ==> $bLapKomputer");
                        _valueLapKomputer = bLapKomputer.toString();
                      });
                    },
                  ),
                  Text("Lap Komputer ( Khusus 206, 207 dan 210 )")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Lap Komputer'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueLapKomputer = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: this.bDeviceOff,
                    onChanged: (value) {
                      setState(() {
                        this.bDeviceOff = value!;
                        print(
                            "LAMPU, SAKLAR DAN KOMPUTER KONDISI MATI ==> $bDeviceOff");
                        _valueSaklar = bDeviceOff.toString();
                      });
                    },
                  ),
                  Text("Lampu, Saklar dan Komputer Kondisi Mati")
                ],
              )

              // DropdownButtonFormField(
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //             borderRadius: BorderRadius.all(Radius.circular(5))),
              //         filled: true,
              //         hintText: 'Lampu, Saklar dan Komputer Mati'),
              //     items: list.map<DropdownMenuItem<String>>((String value) {
              //       return DropdownMenuItem<String>(
              //         value: value,
              //         child: Text(value),
              //       );
              //     }).toList(),
              //     onChanged: (String? value) {
              //       setState(() {
              //         _valueSaklar = value!;
              //       });
              //     }),
              ),
          Padding(
              padding: EdgeInsets.only(left: 55, right: 20, top: 10),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  filled: true,
                  hintText: 'Keterangan Lain',
                ),
                controller: _valueKetLain,
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 100, right: 100, bottom: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.amber[400]),
                    ),
                    onPressed: () {
                      _simpanPiket();
                    },
                    child: Text("SIMPAN"),
                  );
                },
              ))
        ],
      ),
    );
  }
}
