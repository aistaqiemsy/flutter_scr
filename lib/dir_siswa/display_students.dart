import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dir_siswa/add_student.dart';
import 'package:scr_wikrama/dir_siswa/detail_student.dart';

class DisplayStudent extends StatelessWidget {
  const DisplayStudent({super.key, required this.students});
  final List students;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Padding(
            padding: EdgeInsets.only(top: 20),
          child: AppBar(
            leading: Icon(
                Icons.groups_rounded
            ),
            backgroundColor: Colors.amber[600],
            title: Text("Peserta Didik"),
            actions: [
              IconButton(
                onPressed: (){

                },
                icon: Icon(
                    Icons.align_vertical_bottom_rounded
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.only(top: 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0, right: 10, left: 10),
                  child: Card(
                      color: Colors.amber[50],
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailStudent()
                              )
                          );
                        },
                        child: ListTile(
                          leading: Icon(Icons.person_pin),
                          title: Text(students[index]["nama"]),
                          subtitle: Text(
                              students[index]["rombel"],
                              style: TextStyle(
                                fontSize: 12
                              ),
                          )
                        ),
                      )
                  ),
                ),
              ],
            ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.person_add
        ),
        onPressed: () {
          Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => AddStudent())
                    );
        },
      ),
    );
  }
}