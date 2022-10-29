import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

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
  late List getRuang;
  late String idRuang;

  static const List<String> list = <String>["-", "V"];
  String _valueSapuLantai = list.first;
  String _valueLapKaca = list.first;
  String _valuepelLantai = list.first;
  String _valueMejaKursi = list.first;
  String _valueCleanSampah = list.first;
  String _valueLapKomputer = list.first;
  String _valueSaklar = list.first;

  TextEditingController _idRuang = new TextEditingController();
  TextEditingController _tgl = new TextEditingController();
  TextEditingController _checker = new TextEditingController();

  Future<void> _simpanPiket() async {
    print(_valueSapuLantai);
    var url = Uri.http("127.0.0.1",
        "/scr_wikrama/students/piket/tambah_piket_harian.php", {'q': '{http}'});
    var response = await http.post(url, body: {
      "id_ruang": _idRuang.text,
      "tgl": _tgl.text,
      "checker": _checker.text,
      "sapu": _valueSapuLantai,
      "lap": _valueLapKaca,
      "pel": _valuepelLantai,
      "meja": _valueMejaKursi,
      "clean": _valueCleanSampah,
      "lap_pc": _valueLapKaca,
      "lampu": _valueSaklar,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    if (response.statusCode == 200) {
      var simpanSiswa = jsonDecode(response.body);
      print(simpanSiswa);

      showDialog(
          //tampilkan pesan tambah data lagi atau tidak
          context: context,
          builder: (BuildContext content) {
            return Expanded(
                child: AlertDialog(
              content: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.lightGreenAccent[600],
                ),
                title: Text(
                  "Data berhasil disimpan!",
                  style: TextStyle(color: Colors.brown[400]),
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Text(
                      "Iya",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Tombol iya ditekan...");
                      Navigator.pop(context);
                    }),
                ElevatedButton(
                    child: Text(
                      "Tidak",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print("Tombol tidak ditekan...");
                      Navigator.pop(context);
                      Navigator.pop(context);
                    })
              ],
            ));
          });
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
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _tgl,
              decoration: InputDecoration(
                  hintText: ("Tanggal Piket"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
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
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Sapu Lantai'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueSapuLantai = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Lap Kaca'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueLapKaca = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Pel Lantai'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valuepelLantai = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Merapikan Meja dan Kursi'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueMejaKursi = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Membersihkan Sampah'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueCleanSampah = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Lap Komputer'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueLapKomputer = value!;
                    });
                  })),
          Padding(
              padding: EdgeInsets.only(left: 60, right: 20, top: 10),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      filled: true,
                      hintText: 'Lampu, Saklar dan Komputer Mati'),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _valueSaklar = value!;
                    });
                  })),
          Padding(
              padding:
                  EdgeInsets.only(top: 15, left: 100, right: 100, bottom: 20),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: getRuang.length,
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
