import 'package:flutter/material.dart';

class RoomSchedule extends StatefulWidget {
  final String username;

  const RoomSchedule({Key? key, required this.username}) : super(key: key);

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

  void _navigateBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text('Room Schedule', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Rooms Schedule:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: roomSchedule.length,
                itemBuilder: (context, index) {
                  return _buildScheduleItem(roomSchedule[index]);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateBack(context);
        },
        child: const Icon(Icons.home),
      ),
    );
  }

  Widget _buildScheduleItem(Map<String, dynamic> scheduleItem) {
    return Card(
      elevation: 5.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Day: ${scheduleItem['day']}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Time: ${scheduleItem['time']}'),
            const SizedBox(height: 8.0),
            Text('Subject Code: ${scheduleItem['subjectCode']}'),
            const SizedBox(height: 8.0),
            Text('Subject Name: ${scheduleItem['subjectName']}'),
            const SizedBox(height: 8.0),
            Text('Lecturer: ${scheduleItem['lecturer']}'),
          ],
        ),
      ),
    );
  }
}
