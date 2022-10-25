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
  Future<void> _simpanSiswa() async { // login
    var url =
    Uri.http("127.0.0.1", "/scr_wikrama/students/addStudent.php", {'q': '{http}'});
    var response = await http.post(
        url,
        body: {
          "id_ruang": "",
        },
        headers: {
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        }
    );

    if (response.statusCode == 200) {
      var simpanSiswa = jsonDecode(response.body);
      print(simpanSiswa);

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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Nama Peserta Didik"),
                icon: Icon(
                  Icons.account_circle_sharp
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Jenis Kelamin"),
                icon: Icon(
                  Icons.attribution_outlined
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Kelas"),
                icon: Icon(
                  Icons.attribution_outlined
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Rayon"),
                icon: Icon(
                  Icons.attribution_outlined
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Status"),
                icon: Icon(
                  Icons.attribution_outlined
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: ("Hari Piket"),
                icon: Icon(
                  Icons.attribution_outlined
                ),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
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
              child: Text("SIMPAN")
            ),
          )
        ],
      ),
    );
  }
}