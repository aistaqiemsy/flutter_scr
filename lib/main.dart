import 'package:flutter/material.dart';
import 'package:scr_wikrama/dir_siswa/display_student.dart';
import 'package:scr_wikrama/main_menu.dart';
import 'package:scr_wikrama/ps/dashboard_ps.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomRight: Radius.circular(25),
      //       bottomLeft: Radius.circular(25)
      //     )
      //   ),
      //   leading: Icon(
      //     Icons.cleaning_services
      //   ),
      //   title: Text("SCR Wikrama"),
      // ),

      // backgroundColor: Colors.orange[400], // warna dasar app
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 15, top: 25, left: 15, bottom: 25),
              child: Card(
                elevation: 5,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 10
                    ),
                    child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: Icon(
                      Icons.computer_sharp,
                    ),
                  ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("PPLG APPS"),
            ),

            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child:  TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_rounded
                  ),
                  hintText: ("Email"),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child:  TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.password_rounded
                  ),
                  hintText: ("Kata Sandi"),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(right: 15, left: 15, bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => DashboardPs(
                        pembimbing: "Juliana Mansur, M.Kom",
                        id_ps: 1
                      ))
                  );
                }, 
                child: Text("Masuk")
              )
            ),




          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => MainMenu())
          );
        },
        child: const Icon(Icons.logout_outlined),
      ),
    );
  }
}
