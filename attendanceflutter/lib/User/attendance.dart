import 'package:flutter/material.dart';
import 'Sprofile.dart';
import 'package:attendanceflutter/User/TimeTable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Attendance extends StatefulWidget {
  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  bool _attendance = false;

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    int counter = 0;
    var subjects = [
      'English',
      'Science',
      'Hindi',
      'Maths',
      'Computer',
      'Games'
    ];
    return Scaffold(
      // backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: Center(
          child: Row(
            children: [
              Text(
                'Attendance',
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                width: 180,
              ),
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.calendarDays,
                    size: 30,
                  ),
                  onPressed: () async {
                    DateTime? datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2003),
                        lastDate: DateTime(2025));
                  })
            ],
          ),
        ),
      ),

      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(children: [
              SizedBox(
                width: 20,
              ),
              Container(
                width: 150,
                child: Text(
                  subjects[index],
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                width: 160,
              ),
              Checkbox(
                  activeColor: Colors.white,
                  checkColor: Colors.green,
                  value: _attendance,
                  onChanged: (value) {
                    setState(() {
                      _attendance = !_attendance;
                    });
                  })
            ]),
          );
          ;
        },
        itemCount: subjects.length,
      ),
    );
  }
}
