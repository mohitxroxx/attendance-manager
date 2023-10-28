import 'User/TimeTable.dart';
import 'package:attendanceflutter/User/attendance.dart';
import 'package:attendanceflutter/User/login.dart';
import 'package:attendanceflutter/signup.dart';
import 'package:attendanceflutter/startingpage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:attendanceflutter/User/Sprofile.dart';
import 'package:attendanceflutter/splashscreen.dart';

void main() {
  runApp(MeraApp());
}

class MeraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Attend-O",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
            displayLarge: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Font2'),
            displayMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Font2',
                fontSize: 28,
                color: Colors.white),
            displaySmall: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.white,
            )),
      ),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Attend-O',
              style: TextStyle(fontSize: 28, color: Colors.black)),
        ),
      ),
      bottomNavigationBar: Container(
        height: h * 0.08,
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 13,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                offset: Offset(2, 2),
              )
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 1;
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeTable(),
                      ));
                },
                icon: Icon(FontAwesomeIcons.calendar,
                    color:
                        currentIndex == 1 ? Colors.deepPurple : Colors.black),
                iconSize: currentIndex == 1 ? 35 : 26,
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 2;
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Attendance(),
                      ));
                },
                icon: Icon(FontAwesomeIcons.checkDouble,
                    color:
                        currentIndex == 2 ? Colors.deepPurple : Colors.black),
                iconSize: currentIndex == 2 ? 35 : 26,
              )),
              Expanded(
                  child: IconButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 3;
                  });
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentProfile(),
                      ));
                },
                icon: Icon(FontAwesomeIcons.person,
                    color:
                        currentIndex == 3 ? Colors.deepPurple : Colors.black),
                iconSize: currentIndex == 3 ? 35 : 26,
              )),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Student',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                  Container()
                ],
              )),
          // ListView.builder(itemBuilder:(context, index) {
          //   return ListTile(

          //   )
          // },

          // )
        ],
      ),
    );
  }
}
