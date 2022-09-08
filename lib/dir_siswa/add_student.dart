import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              onPressed: () {

              }, 
              child: Text("SIMPAN")
            ),
          )
        ],
      ),
    );
  }
}