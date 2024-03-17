import 'package:flutter/material.dart';
import 'information_rooms.dart';
import 'information.dart';
import 'dart:async';

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
  late String _selectedDay;
  List<TimetableEntry> roomSchedule = [];
  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday'
  ];

  @override
  void initState() {
    super.initState();
    _selectedDay = daysOfWeek.first;
    _updateRoomSchedule();

    // Schedule notification
    _scheduleNotification();
  }

  void _scheduleNotification() {
    Future.delayed(Duration.zero, () {
      // Calculate time for notification (assuming it's the night before)
      DateTime now = DateTime.now();
      DateTime tomorrow = now.add(const Duration(days: 1));
      DateTime notificationTime = DateTime(
          tomorrow.year, tomorrow.month, tomorrow.day, 20, 0); // 8:00 PM

      // Schedule notification
      var difference = notificationTime.difference(now);
      Timer(difference, _showNotification);
    });
  }

  void _showNotification() {
    // Check if there are classes scheduled for the next day
    bool classesScheduled = roomSchedule.isNotEmpty;

    // Show notification
    if (classesScheduled) {
      _showAlertDialog(
          "Classes Tomorrow", "You have classes scheduled for tomorrow.");
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updateRoomSchedule() {
    setState(() {
      roomSchedule.clear();
      roomSchedule = [
        TimetableEntry('Monday', '9:00 - 12:00', 'Multimedia Database',
            'EN843303', 'Asst. Prof. JIRADEJ PONSAWAT'),
        TimetableEntry('Monday', '13:00 - 16:00', 'Advanced Data Structures',
            'EN843302', 'Lecturer SARUN PAISARNSRISOMSUK'),
        TimetableEntry('Tuesday', '9:00 - 12:00', 'Advanced Data Structures',
            'EN843302', 'Lecturer SARUN PAISARNSRISOMSUK'),
        TimetableEntry('Tuesday', '13:00 - 16:00', 'Multimedia Database',
            'EN843303', 'Asst. Prof. JIRADEJ PONSAWAT'),
        TimetableEntry('Wednesday', '9:00 - 12:00', 'Virtual Reality',
            'EN16201-M', 'Prof. JOHN DOE'),
        TimetableEntry(
            'Wednesday',
            '14:00 - 17:00',
            'Japanese for Communication',
            '049006',
            'Lecturer RUTCHANEE PIYATHAMRONGCHAI'),
        TimetableEntry('Thursday', '9:00 - 12:00', 'Virtual Reality',
            'EN16201-M', 'Prof. JOHN DOE'),
        TimetableEntry('Thursday', '13:00 - 16:00', 'Software Engineering',
            'EN04309', 'Lecturer SARUN PAISARNSRISOMSUK'),
        TimetableEntry('Thursday', '14:30 - 17:30', 'Artificial Intelligence',
            'EN18303', 'Lecturer THANATAT CHITPIPAT'),
        TimetableEntry('Friday', '9:00 - 12:00',
            'Mobile Application Development', 'EN04210', 'Prof. JANE DOE'),
        TimetableEntry('Friday', '13:00 - 16:00', 'Software Engineering',
            'EN04309', 'Lecturer SARUN PAISARNSRISOMSUK'),
        TimetableEntry('Friday', '16:30 - 19:30', 'Machine Learning', 'EN18320',
            'Assoc. Prof. KANDA SAIKAEW'),
      ]
          .where((entry) => entry.day == _selectedDay)
          .toList(); // Filter schedule for the selected day
    });
  }

  void _navigateToInformationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationPage(username: widget.username),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationPage(username: widget.username),
      ),
    );
  }

  void _navigateToInformationRooms(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationRooms(username: widget.username),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Room Schedule',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedDay,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedDay = newValue!;
                      _updateRoomSchedule();
                    });
                  },
                  items:
                      daysOfWeek.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
          if (roomSchedule.isNotEmpty)
            ExpansionTile(
              title: const Text('Classes Tomorrow'),
              children: [
                for (var entry in roomSchedule)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${entry.courseName} - ${entry.time}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Instructor: ${entry.instructor}',
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          Expanded(
            child: ListView.builder(
              itemCount: roomSchedule.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 20,
                  ),
                  child: ListTile(
                    title: Text(
                      roomSchedule[index].time,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          roomSchedule[index].courseName,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          roomSchedule[index].subjectCode,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          roomSchedule[index].instructor,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF9D2C13),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: 'home_button', // Unique tag
              onPressed: () {
                //
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'home_button_info', // Unique tag
              onPressed: () {
                _navigateToWelcomeScreen(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'apartment_button', // Unique tag
              onPressed: () {
                _navigateToInformationRooms(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'info_button', // Unique tag
              onPressed: () {
                _navigateToInformationPage(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.info, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
