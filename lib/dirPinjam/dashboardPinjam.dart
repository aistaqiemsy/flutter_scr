import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scr_wikrama/dirPinjam/pinjam.dart';

class DashboardPinjam extends StatelessWidget {
  const DashboardPinjam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[600],
      body: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text("TAMBAH DATA PINJAMAN BARANG"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 5,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.camera_alt,
                          size: 50,
                        ),
                      ),
                      onTap: () {},
                    )),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 25),
                child: ElevatedButton(
                  child: Text("TANPA GAMBAR"),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Pinjam()));
                  },
                ),
              ),
              Container()
            ],
          ),
        ),
      ),
    );
  }
}
