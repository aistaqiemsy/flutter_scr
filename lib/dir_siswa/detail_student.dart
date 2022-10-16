import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailStudent extends StatelessWidget {
  const DetailStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.person
        ),
        backgroundColor: Colors.amber[600],
        title: Text("Profil Peserta Didik"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 15, right: 20, left: 20),
          child: Card(
          color: Colors.amber[50],
          elevation: 5,
          child: Column(
            children: [
              Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 25),
                    child: CircleAvatar(
                      maxRadius: 50,
                        child: Icon(
                          size: 40,
                          Icons.person_outlined
                        ),
                      ),
                  ),
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
            ],
          ),
        ),
        )
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: FloatingActionButton(
              backgroundColor: Colors.amber[200],
              child: Icon(
                color: Colors.blueGrey,
                Icons.create
              ),
              onPressed: () {

              },
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.amber[200],
            child: Icon(
              color:  Colors.red,
              Icons.delete
            ),
            onPressed: () {
              
            },
          )
        ],
      ),
      ),
    );
  }
}