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
        leading: Icon(
          Icons.home_filled
        ),
        title: Text("PPLG APPS"),
        actions: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 22
          ),
          child: InkWell(
            onTap: () {

            },
            child: Card(
              elevation: 5,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text("KELUAR"),
              ),
            ),
          )
        )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Selamat Datang\nBapak ..."),
            Row(
              children: [
                Icon(
                  Icons.menu_book_rounded,
                  color: Colors.green[200],
                ),
                Text("Menu Aplikasi"),
              ],
            ),

            InkWell(
              onTap: () {

              },
              child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.leaderboard
                      ),
                      Text("Piket Rayon")
                    ],
                  ),
                ),
            ),
            InkWell(
              onTap: () {

              },
              child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.leaderboard
                      ),
                      Text("Peminjaman Alat")
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}