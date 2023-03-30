import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DetailStudent extends StatefulWidget {
  const DetailStudent({super.key, required this.idSiswa});
  final String idSiswa;

  @override
  State<DetailStudent> createState() => _DetailStudentState(idSiswa: idSiswa);
}

class _DetailStudentState extends State<DetailStudent> {
  _DetailStudentState({required this.idSiswa});
  final String idSiswa;
  List? student;

  

  Future<void> getStudent() async {
    // var url = // server wikrama
    //     Uri.http("10.10.9.75",
    //         "/scr_wikrama/students/displayStudentProfile.php", {'q': '{http}'});

    var url = // server lokal
        Uri.http("127.0.0.1", "/scr_wikrama/students/displayStudentProfile.php",
            {'q': '{http}'});

    var response = await http.post(url, body: {
      // "idSiswa": "12007628",
      "idSiswa": idSiswa,
    }, headers: {
      "Access-Control-Allow-Methods": "POST, OPTIONS"
    });

    if (response.statusCode == 200) {
      setState(() {
        student = jsonDecode(response.body);
      });
      print(student);
    } else {
      print("Koneksi gagal!");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          backgroundColor: Colors.amber[600],
          title: const Text("Profil Peserta Didik"),
        ),
        body: ListView.builder(
            itemCount: student!.length,
            itemBuilder: (context, index) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 15, right: 20, left: 20, bottom: 15),
                child: Card(
                  color: Colors.amber[50],
                  elevation: 5,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 25),
                        child: CircleAvatar(
                          maxRadius: 50,
                          child: Icon(size: 40, Icons.person_outlined),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Nama",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              student![index]["nama"],
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Kelamin",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              student![index]["jk"],
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Kelas",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              student![index]["rombel"],
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Ruang Rayon",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              student![index]["id_ruang"],
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Status",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 20),
                          //   child: Text(
                          //     student![index]["status"] ?? "-",
                          //     style: TextStyle(
                          //       fontSize: 17,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 50, left: 25, top: 20),
                            child: Container(
                              width: 70,
                              child: const Text(
                                "Jadwal",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 20),
                          //   child: Text(
                          //     student![index]["hari_piket"],
                          //     style: TextStyle(
                          //       fontSize: 17,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Divider(
                        color: Colors.amberAccent[300],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.edit_note_sharp)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: ElevatedButton(
                                onPressed: () {},
                                child: const Icon(Icons.delete)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
            })

        // floatingActionButton: Padding(
        //   padding: EdgeInsets.only(right: 15),
        //   child: Row(
        //   // crossAxisAlignment: CrossAxisAlignment.end,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(right: 10),
        //       child: FloatingActionButton(
        //         backgroundColor: Colors.amber[200],
        //         child: Icon(
        //           color: Colors.blueGrey,
        //           Icons.create
        //         ),
        //         onPressed: () {

        //         },
        //       ),
        //     ),
        //     FloatingActionButton(
        //       backgroundColor: Colors.amber[200],
        //       child: Icon(
        //         color:  Colors.red,
        //         Icons.delete
        //       ),
        //       onPressed: () {

        //       },
        //     )
        //   ],
        // ),
        // ),
        );
  }
}

// class DetailStudent extends StatelessWidget {
//   const DetailStudent({
//     super.key,
//     required this.idSiswa
//   });
//   final int idSiswa;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Icon(Icons.person),
//         backgroundColor: Colors.amber[600],
//         title: const Text("Profil Peserta Didik"),
//       ),
//       body: Center(
//           child: Padding(
//         padding:
//             const EdgeInsets.only(top: 15, right: 20, left: 20, bottom: 15),
//         child: Card(
//           color: Colors.amber[50],
//           elevation: 5,
//           child: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 20, bottom: 25),
//                 child: CircleAvatar(
//                   maxRadius: 50,
//                   child: Icon(size: 40, Icons.person_outlined),
//                 ),
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Nama",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Nama ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Kelamin",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Kelamin ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Kelas",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Kelas ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Rayon",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Rayon ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Status",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Status ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               Row(
//                 children: [
//                   Padding(
//                     padding:
//                         const EdgeInsets.only(right: 50, left: 25, top: 20),
//                     child: Container(
//                       width: 70,
//                       child: const Text(
//                         "Jadwal",
//                         style: TextStyle(
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const Padding(
//                     padding: EdgeInsets.only(top: 20),
//                     child: Text(
//                       ": [ Hari ]",
//                       style: TextStyle(
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Divider(
//                 color: Colors.amberAccent[300],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(right: 5),
//                     child: ElevatedButton(
//                         onPressed: () {},
//                         child: const Icon(Icons.edit_note_sharp)),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 5),
//                     child: ElevatedButton(
//                         onPressed: () {}, child: const Icon(Icons.delete)),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       )),
//       // floatingActionButton: Padding(
//       //   padding: EdgeInsets.only(right: 15),
//       //   child: Row(
//       //   // crossAxisAlignment: CrossAxisAlignment.end,
//       //   mainAxisAlignment: MainAxisAlignment.end,
//       //   children: [
//       //     Padding(
//       //       padding: EdgeInsets.only(right: 10),
//       //       child: FloatingActionButton(
//       //         backgroundColor: Colors.amber[200],
//       //         child: Icon(
//       //           color: Colors.blueGrey,
//       //           Icons.create
//       //         ),
//       //         onPressed: () {

//       //         },
//       //       ),
//       //     ),
//       //     FloatingActionButton(
//       //       backgroundColor: Colors.amber[200],
//       //       child: Icon(
//       //         color:  Colors.red,
//       //         Icons.delete
//       //       ),
//       //       onPressed: () {

//       //       },
//       //     )
//       //   ],
//       // ),
//       // ),
//     );
//   }
// }
