import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:scr_wikrama/ps/tambah_piket_harian.dart';

class RekapPiket extends StatefulWidget {
  const RekapPiket({super.key, required this.rekapPiket, required this.idRuang});
  final List rekapPiket;
  final String idRuang;

  @override
  State<RekapPiket> createState() => _RekapPiketState(rekap: rekapPiket, id_ruang: idRuang);
}

class _RekapPiketState extends State<RekapPiket> {
  _RekapPiketState({required this.rekap, required this.id_ruang});
  List rekap;
  String id_ruang;

  //format tanggal ke hari
  String formatHari(String tanggal) {
    DateTime dateTime = DateFormat("yyyy-MM-dd").parse(tanggal);
    var day = DateFormat('EEEE').format(dateTime);
    var hari = "";
    switch (day) {
      case 'Sunday':
        {
          hari = "Minggu";
        }
        break;
      case 'Monday':
        {
          hari = "Senin";
        }
        break;
      case 'Tuesday':
        {
          hari = "Selasa";
        }
        break;
      case 'Wednesday':
        {
          hari = "Rabu";
        }
        break;
      case 'Thursday':
        {
          hari = "Kamis";
        }
        break;
      case 'Friday':
        {
          hari = "Jumat";
        }
        break;
      case 'Saturday':
        {
          hari = "Sabtu";
        }
        break;
    }
    return hari;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Rekap Piket Rayon"),
      ),
      body: ListView.builder(
        itemCount: rekap.length,
        itemBuilder: (context, index) {
          return Card(
            // elevation: 2,
            color: Colors.amber[100],
            child: InkWell(
              onTap: () {},
              child: ListTile(
                title: Text(formatHari(rekap[index]["tgl_piket"])),
                subtitle: Row(
                  children: [
                    Container(
                      width: 150,
                      child: Text(rekap[index]["tgl_piket"]),
                    ),
                    Text(rekap[index]["checker"])
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber[900],
        child: Icon(Icons.post_add_outlined),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TambahPiketHarian(
                      getRuang: rekap,
                      idRuang: id_ruang,
                    )),
          );
        },
      ),
    );
  }
}
