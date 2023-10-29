import 'package:attendanceflutter/User/Sprofile.dart';
import 'package:attendanceflutter/User/attendance.dart';
import 'package:flutter/material.dart';

class BottonNav extends StatefulWidget {
  @override
  State<BottonNav> createState() => _BottonNavState();
}

class _BottonNavState extends State<BottonNav> {
  int _currentIndex = 0;
  List<Widget> body = [
    Attendance(),
    StudentProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          selectedItemColor: Colors.deepPurple,
          currentIndex: _currentIndex,
          elevation: 50,
          items: [
            // BottomNavigationBarItem(
            //   icon: IconButton(
            //     icon: Icon(FontAwesomeIcons.calendar),
            //     onPressed: () {
            //       Navigator.pushReplacement(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => TimeTable(),
            //           ));
            //       // setState(() {
            //       //   counter = 1;
            //       // });
            //     },
            //   ),
            //   label: 'Time-Table',
            // ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
