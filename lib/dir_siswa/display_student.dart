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
        title: Text("Data Peserta Didik"),
        actions: [
          IconButton(
            onPressed: (){

            }, 
            icon: Icon(
              Icons.align_vertical_bottom_rounded
            ),
          ),
          IconButton(
            onPressed: (){
              Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => AddStudent())
                    );
            }, 
            icon: Icon(
              Icons.person_add
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: ListTile(
              leading: Icon(Icons.person_pin),
              title: Text("Nama"),
              subtitle: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 25
                    ),
                    child: Text("JK"),
                    ),
                  Text("Kelas")
                ],
              ),
              trailing: TextButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => DetailStudent()
                    )
                  );
                }, 
                child: Text("DETAIL")
                ),
            ),
          ),
        ],
      ),
    );
  }
}