import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController _idPesdik = new TextEditingController();
  TextEditingController _nisn = new TextEditingController();
  TextEditingController _nama = new TextEditingController();
  TextEditingController _jk = new TextEditingController();
  TextEditingController _rombel = new TextEditingController();
  TextEditingController _ruang = new TextEditingController();
  TextEditingController _status = new TextEditingController();
  TextEditingController _hari = new TextEditingController();

  Future<void> _simpanSiswa() async {
    // login
    var url = Uri.http(
        "127.0.0.1", "/scr_wikrama/students/addStudent.php", {'q': '{http}'});
    var response = await http.post(url, body: {
      "id_pesdik": _idPesdik.text,
      "nisn": _nisn.text,
      "nama": _nama.text,
      "jk": _jk.text,
      "rombel": _rombel.text,
      "no_ruang": _ruang.text,
      "status": _status.text,
      "hari": _hari.text,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    if (response.statusCode == 200) {
      var simpanSiswa = jsonDecode(response.body);
      print(simpanSiswa);

      //hapus semua data yang telah tersimpan
      _idPesdik.clear();
      _nisn.clear();
      _nama.clear();
      _jk.clear();
      _rombel.clear();
      _ruang.clear();
      _status.clear();
      _hari.clear();

          showDialog( //tampilkan pesan tambah data lagi atau tidak
                    context: context, 
                    builder: (BuildContext content) {
                      return Expanded(
                        child: AlertDialog(
                          // title: Icon(
                          //   Icons.info
                          // ),
                          content: ListTile(
                            leading: Icon(
                              Icons.info,
                              color: Colors.lightGreenAccent[600],
                            ),
                            title: Text(
                              "Data berhasil disimpan!",
                              style: TextStyle(
                                color: Colors.brown[400]
                              ),
                            ),
                            subtitle: Text(
                              "Ingin tambah data kembali ?",
                              style: TextStyle(
                                color: Colors.lightGreenAccent[800]
                              ),
                            ),
                          ),
                          // Card(
                          //   elevation: 5,
                          //   child: Padding(
                          //     padding: EdgeInsets.all(20),
                          //     child: Text(
                          //     "Data Ingin tambah data kembali ?",
                          //     style: TextStyle(
                          //       fontSize: 12,
                          //       color: Colors.brown[400]
                          //     ),
                          //   ),
                          //   ),
                          // ),
                          actions: [
                            ElevatedButton(
                              child: Text(
                                "Iya",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              onPressed: () { 
                                print("Tombol iya ditekan...");
                                Navigator.pop(context);
                              }
                            ),

                            ElevatedButton(
                              child: Text(
                                "Tidak",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                              onPressed: () {
                                print("Tombol tidak ditekan...");
                                Navigator.pop(context);
                                Navigator.pop(context);
                              }
                            )
                          ],
                        )
                      );
                    }
                  );
    } else {
      print("Koneksi gagal!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Tambah Peserta Didik"),
      ),

      /*
      Kolom data tb_pesdik
      id_siswa, nisn, nama, jk, rombel, id_ruang, status, hari_piket
      */

      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _idPesdik,
              decoration: InputDecoration(
                  hintText: ("NIS"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _nisn,
              decoration: InputDecoration(
                  hintText: ("NISN"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _nama,
              decoration: InputDecoration(
                  hintText: ("Nama"),
                  icon: Icon(Icons.account_circle_sharp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _jk,
              decoration: InputDecoration(
                  hintText: ("Jenis Kelamin"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _rombel,
              decoration: InputDecoration(
                  hintText: ("Kelas"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _ruang,
              decoration: InputDecoration(
                  hintText: ("Ruang"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _status,
              decoration: InputDecoration(
                  hintText: ("Status"),
                  icon: Icon(Icons.attribution_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              controller: _hari,
              decoration: InputDecoration(
                  hintText: ("Hari Piket"),
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
                  _simpanSiswa();
                },
                child: Text("SIMPAN")),
          )
        ],
      ),
    );
  }
}
