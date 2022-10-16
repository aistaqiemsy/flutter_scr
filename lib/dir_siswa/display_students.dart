import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dir_siswa/add_student.dart';
import 'package:scr_wikrama/dir_siswa/detail_student.dart';

class DisplayStudent extends StatelessWidget {
  const DisplayStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
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
                  title: Text("Nama"),
                  subtitle: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 25
                        ),
                        child: Text("Rayon"),
                        ),
                      Text("Kelas")
                    ],
                  ),
                ),
              )
            ),
          ),
        ],
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