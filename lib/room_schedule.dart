import 'package:flutter/material.dart';

class TimetableEntry {
  final String day;
  final String time;
  final String courseName;
  final String subjectCode;
  final String instructor;

  TimetableEntry(
      this.day, this.time, this.courseName, this.subjectCode, this.instructor);
}

class RoomSchedule extends StatefulWidget {
  final String username;

  const RoomSchedule({Key? key, required this.username}) : super(key: key);

  @override
  _RoomScheduleState createState() => _RoomScheduleState();
}

class _RoomScheduleState extends State<RoomSchedule> {
  List<TimetableEntry> roomSchedule = [
    TimetableEntry(
      'Monday',
      '9:00 - 12:00',
      'Multimedia Database',
      'EN843303',
      'Asst. Prof. JIRADEJ PONSAWAT',
    ),
    TimetableEntry(
      'Tuesday',
      '9:00 - 12:00',
      'Advanced Data Structures',
      'EN843302',
      'Lecturer SARUN PAISARNSRISOMSUK',
    ),
    TimetableEntry(
      'Wednesday',
      '14:00 - 17:00',
      'Japanese for Communication',
      '049006',
      'Lecturer RUTCHANEE PIYATHAMRONGCHAI',
    ),
    TimetableEntry(
      'Thursday',
      '9:00 - 12:00',
      'Virtual Reality',
      'EN16201-M',
      'Prof. JOHN DOE',
    ),
    TimetableEntry(
      'Thursday',
      '13:00 - 16:00',
      'Software Engineering',
      'EN04309',
      'Lecturer SARUN PAISARNSRISOMSUK',
    ),
    TimetableEntry(
      'Thursday',
      '14:30 - 17:30',
      'Artificial Intelligence',
      'EN18303',
      'Lecturer THANATAT CHITPIPAT',
    ),
    TimetableEntry(
      'Thursday',
      '16:30 - 19:30',
      'Machine Learning',
      'EN18320',
      'Assoc. Prof. KANDA SAIKAEW',
    ),
    TimetableEntry(
      'Thursday',
      '9:00 - 12:00',
      'Mobile Application Development',
      'EN04210',
      'Prof. JANE DOE',
    ),
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
              'Room Schedule:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF9D2C13),
              ),
            ),
            const SizedBox(height: 10.0),
            Table(
              defaultColumnWidth: const IntrinsicColumnWidth(),
              border: TableBorder.all(color: Colors.black),
              children: [
                const TableRow(
                  children: [
                    TableCell(
                      child: Center(
                        child: Text(
                          'Day',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          'Time',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          'Course Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          'Subject Code',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(
                          'Instructor',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...roomSchedule.map((entry) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Text(entry.day),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Text(entry.time),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Text(entry.courseName),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Text(entry.subjectCode),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            color: Colors.white,
                            child: Text(entry.instructor),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateBack(context);
        },
        backgroundColor: const Color(0xFF9D2C13),
        child: const Icon(Icons.home),
      ),
    );
  }
}
