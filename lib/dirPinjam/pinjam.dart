import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Pinjam extends StatelessWidget {
  const Pinjam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 25, left: 25, top: 20),
        child: Card(
          elevation: 10,
          child: Column(
            children: [
              Container(),
              Text("Nama"),
              Text("Status Peminjam"),
              Text("Barang"),
              Text("Nomor"),
              Text("Rombel"),
              Text("Rayon"),
              Text("Tanggal Peminjaman"),
              Text("Keperluan")
            ],
          ),
        ),
      ),
    );
  }
}