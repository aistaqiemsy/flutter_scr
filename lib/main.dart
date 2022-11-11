import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scr_wikrama/api/ServicesApi.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:scr_wikrama/main_menu.dart';
import 'package:scr_wikrama/model_pembimbing.dart';
import 'package:scr_wikrama/ps/dashboard_ps.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PPLG APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const List<String> _ruang = <String>["134", "203", "206", "207", "210", "322", "323"];
  String _setRuang = "";

  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  List userLogin = [];

  Future<void> _onLogin() async {
    // login
    // var url = // server wikrama
    //     Uri.http(
    //         "10.20.30.100:812", "/scr_wikrama/lib_ps/login.php", {'q': '{http}'});

    var url = // gunakakan IP komputer saat debug ke physical device
        Uri.http(
            "localhost", "/scr_wikrama/lib_ps/login.php", {'q': '{http}'});
    
    var response = await http.post(url,
        body: {
          "username": _username.text, 
          "password": _password.text,
          "ruang":_setRuang
        },
        headers: {"Access-Control-Allow-Methods": "POST, OPTIONS"});

    if (response.statusCode == 200) {
      
      ScaffoldMessenger
        .of(context)
          .showSnackBar(SnackBar(
            content: Text(
              "Autentikasi berhasil!",
              style: TextStyle(
                color: Colors.cyan[700],
              ),
              ),
            backgroundColor: Colors.amberAccent[100],
            )
          );
      
      userLogin = jsonDecode(response.body);
      print(userLogin);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardPs(userLogin: userLogin)),
      );

      _username.clear();
      _password.clear();
    } else {
      print("Koneksi gagal!");
    }
  }

  @override
  void initState() {
    // _onLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(right: 15, top: 25, left: 15, bottom: 25),
              child: CircleAvatar(
                maxRadius: 50,
                backgroundColor: Colors.amber[600],
                child: Icon(
                  Icons.computer_sharp,
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("PPLG APPS"),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    iconColor: Colors.amber[50],
                    prefixIcon: Icon(Icons.email_rounded),
                    hintText: ("Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: TextFormField(
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    hintText: ("Kata Sandi"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 100, bottom: 10, left: 100),
              child: DropdownButtonFormField(
                          style: TextStyle(
                          fontSize: 14
                        ),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5))),
                                filled: true,
                                hintText: 'Ruang'),
                            items: _ruang
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String? value) {
                              setState(() {
                                _setRuang = value!;
                              });
                            }),
            ),
            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.amber),
                ),
                onPressed: () {
                  print("\nDEBUG : \n");
                  _onLogin();
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text("Masuk"),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainMenu()));
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
