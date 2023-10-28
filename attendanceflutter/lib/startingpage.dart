import 'package:attendanceflutter/Admin/adminattendance.dart';
import 'package:attendanceflutter/Admin/adminlogin.dart';
import 'package:attendanceflutter/User/login.dart';
import 'package:flutter/material.dart';

class StartingPage extends StatefulWidget {
  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdminLogin(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 60,
                        ),
                        Text('Admin')
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(onPressed: () {}, child: Text('Admin'))
              ],
            ),
            SizedBox(
              width: 50,
              height: 50,
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ));
                  },
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          size: 60,
                          color: Colors.deepPurple,
                        ),
                        Text('User')
                      ],
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(onPressed: () {}, child: Text('User'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
