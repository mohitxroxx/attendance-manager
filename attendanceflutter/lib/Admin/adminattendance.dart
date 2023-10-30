import 'package:attendanceflutter/Admin/adduser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminAttendance extends StatefulWidget {
  @override
  State<AdminAttendance> createState() => _AdminAttendanceState();
}

class _AdminAttendanceState extends State<AdminAttendance> {
  bool _switch = false;
  var names = [
    'Manas',
    'Yash',
    'Mohit',
    'Kartik',
    'Ud',
    'Pd',
    'Omega',
    'apurv',
    'Kanha'
  ];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                icon: Icon(Icons.calendar_month_sharp),
                onPressed: () async {
                  DateTime? datePicked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2003),
                    lastDate: DateTime(2025),
                  );
                }),
            SizedBox(
              width: 80,
            ),
            Text(
              'Attendance',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              width: 50,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddUser(),
                      ));
                },
                icon: Icon(FontAwesomeIcons.personCirclePlus))
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: IconButton(
      //             icon: Icon(Icons.calendar_month_sharp),
      //             onPressed: () async {
      //               DateTime? datePicked = await showDatePicker(
      //                 context: context,
      //                 initialDate: DateTime.now(),
      //                 firstDate: DateTime(2003),
      //                 lastDate: DateTime(2025),
      //               );
      //             }),
      //         label: 'Date'),
      //     BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add User'),
      //   ],
      // ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 80,
                child: Text(
                  names[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: w * 0.56,
              ),
              FlutterSwitch(
                  activeColor: Colors.green,
                  inactiveColor: Colors.red,
                  value: _switch,
                  onToggle: (value) {
                    setState(() {
                      _switch = !_switch;
                    });
                  })
            ]),
          );
          ;
        },
        itemCount: names.length,
      ),
    );
  }
}
