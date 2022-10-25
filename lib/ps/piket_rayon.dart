import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:http/http.dart' as http;
import 'package:scr_wikrama/ps/detail_ps.dart';

class PiketRayon extends StatefulWidget {
  const PiketRayon({
    super.key,
    required this.userLogin,
    required this.id_ruang
  });

  final List userLogin;
  final dynamic id_ruang;

  @override
  State<PiketRayon> createState() => _PiketRayonState(
      dataUser: userLogin,
      id_ruang: id_ruang
  );
}

class _PiketRayonState extends State<PiketRayon> {
   _PiketRayonState({
     required this.dataUser,
     required this.id_ruang
   });

    final List dataUser;
    final dynamic id_ruang;
    late List displaySiswa;

   Future<void> _displaySiswa() async { // login
     var url =
     Uri.http("127.0.0.1", "/scr_wikrama/students/displayStudents.php", {'q': '{http}'});
     var response = await http.post(
         url,
         body: {
           "id_ruang": id_ruang.toString(),
         },
         headers: {
           "Access-Control-Allow-Methods": "POST, OPTIONS"
         }
     );

     if (response.statusCode == 200) {
       displaySiswa = jsonDecode(response.body);
       print(displaySiswa);

       Navigator.push(
         context,
         MaterialPageRoute(
             builder: (context) =>
                 DisplayStudent(students: displaySiswa)
         ),
       );


     } else {
       print("Koneksi gagal!");
     }

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.clean_hands
        ),
        backgroundColor: Colors.amber[600],
        title: Text("Piket Rayon"),
      ),
      body: ListView.builder(
        itemCount: dataUser.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 3,
                        color: Colors.amber[50],
                        child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPS(
                                        id_ruang: id_ruang.toString(),
                                        dataUser: dataUser,
                                      )));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber[100],
                                    child: Icon(
                                      Icons.people_alt_rounded,
                                      color: Colors.amberAccent[400],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10, left: 5, right: 5),
                                  child: Text(
                                      dataUser[index]["nama"],
                                      style: TextStyle(
                                        fontSize: 10
                                      ),
                                      textAlign: TextAlign.center),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 3,
                        color: Colors.amber[50],
                        child: InkWell(
                            onTap: () {
                              print("\nDEBUG : \n");
                              _displaySiswa();

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DisplayStudent(
                              //           students: [],
                              //         )
                              //     ));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber[100],
                                    child: Icon(
                                      Icons.people_alt_rounded,
                                      color: Colors.amberAccent[400],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10, left: 5, right: 5),
                                  child: Text(
                                    "Peserta Didik",
                                    style: TextStyle(
                                      fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Card(
                        elevation: 3,
                        color: Colors.amber[50],
                        child: InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber[100],
                                    child: Icon(
                                      Icons.people_alt_rounded,
                                      color: Colors.amberAccent[400],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 10, left: 5, right: 5),
                                  child: Text(
                                    "Ruangan PPLG",
                                    style: TextStyle(
                                        fontSize: 10
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, right: 5, left: 5),
                child: Card(
                  color: Colors.amber[50],
                  elevation: 3,
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text("Rekap Piket"),
                      subtitle: Text("134, 206, 207, 210, 322, 323"),
                    ),
                  ),
                ),
              )
            ],
          );
        },
      )
    );
  }
}
