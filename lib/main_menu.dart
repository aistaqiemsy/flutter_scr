import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Piket Rayon")
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(5),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => DisplayStudent(
                          students: [],
                        ))
                    );
                  },
                  child: ListTile(
                    title: Text("DATA PESERTA DIDIK"),
                    subtitle: Text("Peserta didik yang masuk dalam jadwal piket ruang PPLG"),
                    leading: Image.asset(
                      'assets/icons/clean_room.png',
                      width: 50,
                      height: 50,
                      )
                  )
                  //   Row(
                  //   children: [
                  //     Padding(
                  //       padding: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                  //       child: Icon( 
                  //         Icons.people_alt_rounded
                  //       ),
                  //     ),
                  //     Text("DATA PESERTA DIDIK")
                  //   ],
                  // ),
                )
              ),
            )
          ),

          Card(
            margin: EdgeInsets.all(5),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                        child: Icon( 
                          Icons.person
                        ),
                      ),
                      Text("DATA PEMBIMBING RAYON")
                    ],
                  ),
                )
              ),
            )
          ),

          Card(
            margin: EdgeInsets.all(5),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                        child: Icon( 
                          Icons.meeting_room_outlined
                        ),
                      ),
                      Text("RUANGAN PPLG")
                    ],
                  ),
                )
              ),
            )
          ),

          Card(
            margin: EdgeInsets.all(5),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: TextButton(
                  onPressed: () {

                  },
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5, top: 10, bottom: 10),
                        child: Icon( 
                          Icons.people_alt_rounded
                        ),
                      ),
                      Text("JADWAL PIKET")
                    ],
                  ),
                )
              ),
            )
          ),

        ],
      ),
    );
  }
}