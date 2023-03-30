import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scr_wikrama/dir_siswa/add_student.dart';
import 'package:scr_wikrama/dir_siswa/detail_student.dart';
import 'package:http/http.dart' as http;

class DisplayStudent extends StatelessWidget {
  DisplayStudent({super.key, required this.students});
  final List students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.groups_rounded),
        backgroundColor: Colors.amber[600],
        title: const Text("Peserta Didik"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.align_vertical_bottom_rounded),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.only(top: 1, bottom: 1, right: 5, left: 5),
              child: Card(
                elevation: 3,
                child: InkWell(
                  child: ListTile(
                    leading: const Icon(Icons.person_pin),
                    title: Text(students[index]["nama"]),
                    subtitle: Row(
                      children: [
                        Text(students[index]["rombel"]),
                        Text(" | "),
                        Text(students[index]["id_siswa"])
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailStudent(
                        idSiswa: students[index]["id_siswa"],
                      ))
                      );
                  },
                ),
              )

              // Column(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(top: 0, right: 10, left: 10),
              //       child: InkWell(
              //         onTap: () {

              //         },
              //         child:
              //         Row(
              //           children: [
              //             Container(
              //               width: 250,
              //               child: Text(students[index]["nama"]),
              //             ),
              //             Text(students[index]["rombel"])
              //           ],
              //         ),
              //       )
              //     ),
              //     Divider()
              //   ],
              // ),

              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[400],
        child: const Icon(Icons.person_add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddStudent()));
        },
      ),
    );
  }
}
