import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:scr_wikrama/api/ServicesApi.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:scr_wikrama/main_menu.dart';
import 'package:scr_wikrama/model_pembimbing.dart';
import 'package:scr_wikrama/ps/dashboard_ps.dart';
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
  TextEditingController _username = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  List userLogin = [];

  Future<void> _onLogin() async { // login
    var url =
        Uri.http("127.0.0.1", "/scr_wikrama/lib_ps/login.php", {'q': '{http}'});
    var response = await http.post(
        url,
        body: {
          "username": _username.text,
          "password": _password.text
        },
        headers: {
          "Access-Control-Allow-Methods": "POST, OPTIONS"
        }
      );

        if (response.statusCode == 200) {
          userLogin = jsonDecode(response.body);
          print(userLogin);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DashboardPs(userLogin: userLogin)
                  ),
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
                padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
                child: ElevatedButton(
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
              context, MaterialPageRoute(
                builder: (context) => MainMenu()));
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
