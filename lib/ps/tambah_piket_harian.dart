import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class TambahPiketHarian extends StatefulWidget {
  const TambahPiketHarian({super.key});

  @override
  State<TambahPiketHarian> createState() => _TambahPiketHarianState();
}

class _TambahPiketHarianState extends State<TambahPiketHarian> {
  static const List<String> list = <String>["-", "V"];
  String _valueSapuLantai = list.first;

  TextEditingController _idRuang = new TextEditingController();
  TextEditingController _tgl = new TextEditingController();
  TextEditingController _checker = new TextEditingController();
  TextEditingController _sapuLantai = new TextEditingController();
  TextEditingController _lapKaca = new TextEditingController();
  TextEditingController _pelLantai = new TextEditingController();
  TextEditingController _mejaKursi = new TextEditingController();
  TextEditingController _cleanSampah = new TextEditingController();
  TextEditingController _lapKomputer = new TextEditingController();
  TextEditingController _lampuSaklar = new TextEditingController();

  // $id_ruang = $_POST["id_ruang"];
  // $tgl = $_POST["tgl"];
  // $checker = $_POST["checker"];
  // $sapu_lantai = $_POST["sapu"];
  // $lap_kaca = $_POST["lap"];
  // $pel_lantai = $_POST["pel"];
  // $meja_kursi = $_POST["meja"];
  // $clean_sampah = $_POST["clean"];
  // $lap_pc = $_POST["lap_pc"];
  // $lampu_saklar = $_POST["lampu"];

  Future<void> _simpanPiket() async {
    print(_valueSapuLantai);
    // var url = Uri.http("127.0.0.1",
    //     "/scr_wikrama/students/piket/tambah_piket_harian.php", {'q': '{http}'});
    // var response = await http.post(url, body: {
    //   "id_ruang": _idRuang.text,
    //   "tgl": _tgl.text,
    //   "checker": _checker.text,
    //   "sapu": _sapuLantai.text,
    //   "lap": _lapKaca.text,
    //   "pel": _pelLantai.text,
    //   "meja": _mejaKursi.text,
    //   "clean": _cleanSampah.text,
    //   "lap_pc": _lapKomputer.text,
    //   "lampu": _lampuSaklar.text,
    // }, headers: {
    //   "Access-Control-Allow-Methods": "POST, OPTIONS"
    // });

    // if (response.statusCode == 200) {
    //   var simpanSiswa = jsonDecode(response.body);
    //   print(simpanSiswa);

    //   showDialog(
    //       //tampilkan pesan tambah data lagi atau tidak
    //       context: context,
    //       builder: (BuildContext content) {
    //         return Expanded(
    //             child: AlertDialog(
    //           content: ListTile(
    //             leading: Icon(
    //               Icons.info,
    //               color: Colors.lightGreenAccent[600],
    //             ),
    //             title: Text(
    //               "Data berhasil disimpan!",
    //               style: TextStyle(color: Colors.brown[400]),
    //             ),
    //           ),
    //           actions: [
    //             ElevatedButton(
    //                 child: Text(
    //                   "Iya",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //                 onPressed: () {
    //                   print("Tombol iya ditekan...");
    //                   Navigator.pop(context);
    //                 }),
    //             ElevatedButton(
    //                 child: Text(
    //                   "Tidak",
    //                   style: TextStyle(color: Colors.white),
    //                 ),
    //                 onPressed: () {
    //                   print("Tombol tidak ditekan...");
    //                   Navigator.pop(context);
    //                   Navigator.pop(context);
    //                 })
    //           ],
    //         ));
    //       });
    // } else {
    //   print("Koneksi gagal!");
    // }
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
                  })

              // DropdownButton<String>(
              //   value: dropDownValue,
              // onChanged: (String? value) {
              //   setState(() {
              //     dropDownValue = value!;
              //   });
              // },
              // items: list.map<DropdownMenuItem<String>>((String value) {
              //   return DropdownMenuItem<String>(
              //     value: value,
              //     child: Text(value),
              //   );
              // }).toList(),
              // )

              // TextFormField(
              //   controller: _sapuLantai,
              //   decoration: InputDecoration(
              //       hintText: ("Sapu Lantai"),
              //       icon: Icon(Icons.attribution_outlined),
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10))),
              // ),

              ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _lapKaca,
              decoration: InputDecoration(
                  hintText: ("Lap Kaca"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _pelLantai,
              decoration: InputDecoration(
                  hintText: ("Pel Lantai"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _mejaKursi,
              decoration: InputDecoration(
                  hintText: ("Meja dan kursi dalam keadaan rapi"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _cleanSampah,
              decoration: InputDecoration(
                  hintText: ("Membersihkan sampah"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _lapKomputer,
              decoration: InputDecoration(
                  hintText: ("Membersihkan PC / Kabel Lab"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _lampuSaklar,
              decoration: InputDecoration(
                  hintText: ("Lampu, komputer dan aliran listrik mati / off"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, left: 100, right: 100),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.amber[400]),
                ),
                onPressed: () {
                  _simpanPiket();
                },
                child: Text("SIMPAN")),
          )
        ],
      ),
    );
  }
}
