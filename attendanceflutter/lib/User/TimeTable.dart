import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Sprofile.dart';
import 'attendance.dart';

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    TableRow _tableRow = TableRow(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('8:30-9:20am'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Content 2'),
      ),
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Time-Table',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BottomNavigationBar(
          elevation: 50,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(FontAwesomeIcons.calendar),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TimeTable(),
                      ));
                },
              ),
              label: 'Time-Table',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(FontAwesomeIcons.checkDouble),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Attendance(),
                      ));
                },
              ),
              label: 'Attendance',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentProfile(),
                      ));
                },
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Table(
            border: TableBorder.all(color: Colors.black),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: <TableRow>[
              _tableRow,
              _tableRow,
              _tableRow,
              _tableRow,
              _tableRow,
              _tableRow,
            ],
          ),
        ),
      ),
    );
  }
}
