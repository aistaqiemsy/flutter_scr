import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailStudent extends StatelessWidget {
  const DetailStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL PESERTA DIDIK"),
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              Row(
                children: [                  
                  Padding(
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
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
                      ": [ Nama ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
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
                      ": [ Kelamin ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
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
                      ": [ Kelas ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
                            "Jurusan",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                    
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ": [ Jurusan ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
                            "Rayon",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                    
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ": [ Rayon ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
                            "Status",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                    
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ": [ Status ]",
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
                    padding: EdgeInsets.only(right: 50, left: 25, top: 20),
                    child: Container(
                    width: 70,
                    child: Text(
                            "Jadwal",
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                    
                    ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      ": [ Hari ]",
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      ),
                    )
                ],
              ),

              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                      
                      },
                      child: Text("EDIT"),
                    ),
                    TextButton(
                      onPressed: () {
                      
                      },
                      child: Text(
                        "HAPUS",
                        style: TextStyle(
                          color: Colors.red[400]
                        ),
                        
                        ),
                    ),

                  ],
                )
              )          
            ],
          ),
        )
      ),
    );
  }
}