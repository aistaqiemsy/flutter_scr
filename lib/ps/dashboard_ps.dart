import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DashboardPs extends StatelessWidget {
  const DashboardPs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        leading: Image.asset(
          "assets/icons/clean_room.png",
          width: 35,
          height: 35,
        ),
        title: Text("PPLG APPS"),
        actions: [
          Padding(
              padding: EdgeInsets.only(bottom: 22),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("KELUAR"),
                  ),
                ),
              ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ListTile(
                title: Text("Selamat Datang Bapak / Ibu"),
                subtitle: Text("[name]"),
              ),
            ),
            Row(
              children: [
                Image.asset(
                  "assets/icons/clean_room.png",
                  width: 50,
                  height: 50,
                ),
                Text("Menu Aplikasi"),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {},
                child: Card(
                    elevation: 2,
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
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {},
                child: Card(
                    elevation: 2,
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
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
