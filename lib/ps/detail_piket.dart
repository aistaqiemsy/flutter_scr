import 'package:flutter/material.dart';

//BATAS

class DetailPiket extends StatelessWidget {
  DetailPiket(
      {super.key, required this.piket });

  late final List piket;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text("Detail Piket"),
        leading: Icon(
          Icons.list_alt_rounded,
        ),
      ),
      body: Center(
          child: ListView.builder(
            itemCount: piket.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Card(
                      elevation: 2,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text("DETAIL PIKET HARIAN RAYON"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 5),
                    child: Card(
                      elevation: 2,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Ruang"),
                                ),
                              ),
                              Text(": " + piket[index]["id_ruang"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Tanggal Piket"),
                                ),
                              ),
                              Text(": " + piket[index]["tgl_piket"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Saksi Piket"),
                                ),
                              ),
                              Text(": " + piket[index]["checker"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Sapu Lantai"),
                                ),
                              ),
                              Text(": " + piket[index]["sapu_lantai"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Lap Kaca"),
                                ),
                              ),
                              Text(": " + piket[index]["lap_kaca"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Pel Lantai"),
                                ),
                              ),
                              Text(": " + piket[index]["pel_lantai"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Menata Meja Kursi"),
                                ),
                              ),
                              Text(": " + piket[index]["menata_meja_kursi"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Membersihkan Sampah"),
                                ),
                              ),
                              Text(": " + piket[index]["clean_sampah"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Lap Komputer"),
                                ),
                              ),
                              Text(": " + piket[index]["lap_komputer"])
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 15, top: 5, bottom: 5),
                                  child: Text("Lampu/Komputer ( Mati )"),
                                ),
                              ),
                              Text(": " + piket[index]["lampu_komp_saklar"])
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 5),
                    child: Card(
                      elevation: 2,
                      child: ListTile(
                        leading: Icon(Icons.info),
                        title: Text("Info Tambahan"),
                        subtitle: Text(piket[index]["ket_lain"]),
                      ),
                    ),
                  )
            ],
          );
        },
      )),
    );
  }
}
