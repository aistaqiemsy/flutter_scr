// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/ps/piket_rayon.dart';

class DashboardPs extends StatelessWidget {
  const DashboardPs({super.key, required this.userLogin});

  final List userLogin;

  @override
  Widget build(BuildContext context) {
    // late String _pembimbing;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[600],
          leading: Image.asset(
            "assets/icons/clean_room.png",
            width: 35,
            height: 35,
          ),
          title: Text("PPLG APPS"),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 10, right: 15, left: 15),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: userLogin.length,
            itemBuilder: (context, index) {
              // _pembimbing = userLogin[index]["nama"];
              return Column(
                children: [
                  ListTile(
                  title: Text("Selamat Datang Bapak / Ibu"),
                  subtitle: Text(userLogin[index]["nama"])
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 25),
                    child: Card(
                        color: Colors.amber[50],
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PiketRayon(
                                      userLogin: userLogin,
                                    )
                                )
                            );

                            print(userLogin);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/clean_room.png",
                                  width: 25,
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Piket Rayon"),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Card(
                        color: Colors.amber[50],
                        elevation: 2,
                        child: InkWell(
                          onTap: () {
                            print(userLogin);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/icons/clean_room.png",
                                  width: 25,
                                  height: 25,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text("Peminjaman"),
                                )
                              ],
                            ),
                          ),
                        )
                    ),
                  )
                ],
              );
            },
          ),
        )

    );
  }
  }