import 'package:flutter/material.dart';
import 'welcomescreen.dart';

class RoomSchedule extends StatefulWidget {
  const RoomSchedule({Key? key}) : super(key: key);

  @override
  _RoomScheduleState createState() => _RoomScheduleState();
}

class _RoomScheduleState extends State<RoomSchedule> {
  List<Map<String, dynamic>> roomSchedule = [
    {
      'day': 'Monday',
      'time': '9:00 - 12:00',
      'subjectCode': 'EN843303',
      'subjectName': 'Multimedia Database',
      'lecturer': 'Asst. Prof. JIRADEJ PONSAWAT',
    },
    {
      'day': 'Tuesday',
      'time': '9:00 - 12:00',
      'subjectCode': 'EN843302',
      'subjectName': 'Advanced Data Structures',
      'lecturer': 'Lecturer SARUN PAISARNSRISOMSUK',
    },
    {
      'day': 'Wednesday',
      'time': '14:00 - 17:00',
      'subjectCode': '049006',
      'subjectName': 'Japanese for Communication',
      'lecturer': 'Lecturer RUTCHANEE PIYATHAMRONGCHAI',
    },
    {
      'day': 'Thursday',
      'time': '9:00 - 12:00',
      'subjectCode': 'EN16201-M',
      'subjectName': 'Virtual Reality',
      'lecturer': 'Prof. JOHN DOE',
    },
    {
      'day': 'Thursday',
      'time': '13:00 - 16:00',
      'subjectCode': 'EN04309',
      'subjectName': 'Software Engineering',
      'lecturer': 'Lecturer SARUN PAISARNSRISOMSUK',
    },
    {
      'day': 'Thursday',
      'time': '14:30 - 17:30',
      'subjectCode': 'EN18303',
      'subjectName': 'Artificial Intelligence',
      'lecturer': 'Lecturer THANATAT CHITPIPAT',
    },
    {
      'day': 'Thursday',
      'time': '16:30 - 19:30',
      'subjectCode': 'EN18320',
      'subjectName': 'Machine Learning',
      'lecturer': 'Assoc. Prof. KANDA SAIKAEW',
    },
    {
      'day': 'Thursday',
      'time': '9:00 - 12:00',
      'subjectCode': 'EN04210',
      'subjectName': 'Mobile Application Development',
      'lecturer': 'Prof. JANE DOE',
    },
  ];


 void _navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(username: "Dummy"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gear Studio Info Tracker',
            style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: ListView.builder(
        itemCount: roomSchedule.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${roomSchedule[index]['day']} - ${roomSchedule[index]['time']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subject Code: ${roomSchedule[index]['subjectCode']}'),
                Text('Subject Name: ${roomSchedule[index]['subjectName']}'),
                Text('Lecturer: ${roomSchedule[index]['lecturer']}'),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF9D2C13),
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                _navigateToWelcomeScreen(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                // No need to navigate to RoomSchedule here
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                // Add logic for apartment icon
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                // Add logic for information icon
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.info, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
