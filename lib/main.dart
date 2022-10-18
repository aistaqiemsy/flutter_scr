import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:scr_wikrama/dir_siswa/display_students.dart';
import 'package:scr_wikrama/main_menu.dart';
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
  List userdata = [];
  Future<void> _onLogin() async {
    final url =
        Uri.http("10.10.9.103", "/scr_wikrama/login.php", {'q': '{http}'});

    try {
      var response = await http.get(url);

      print(response.body);

      setState(() {
        userdata = jsonDecode(response.body);
      });
      
    } catch (e) {
      print(e);
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => DashboardPs(
                      //             pembimbing: "Juliana Mansur, M.Kom",
                      //             id_ps: 1)));

                      print("\nDEBUG : \n");
                      _onLogin();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Masuk"),
                    ))),
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
