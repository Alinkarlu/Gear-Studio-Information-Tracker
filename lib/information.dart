import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'room_schedule.dart';
import 'information_rooms.dart';

class InformationPage extends StatelessWidget {
  final String username;

  const InformationPage({Key? key, required this.username}) : super(key: key);

  void _navigateToRoomSchedule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSchedule(username: username),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(username: username),
      ),
    );
  }

  void _navigateToInformationRooms(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationRooms(username: username),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gear Studio Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Location Map:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            InkWell(
              onTap: () {
                // Open the location map link when tapped
                // You can use the url_launcher package for this purpose
              },
              child: const Text(
                'https://maps.app.goo.gl/VNARieJvW6rXgJaR8',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Opening Hours:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text('Weekdays: 09:00 - 16:00'),
            const Text('Weekends & Holidays: Closed'),
            const SizedBox(height: 20.0),
            const Text(
              'Contact Information:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text('Email: info@gearstudio.com'),
            const Text('Phone: +1 (123) 456-7890'),
          ],
        ),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF9D2C13),
          borderRadius: BorderRadius.circular(10.0),
        ),
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
                _navigateToRoomSchedule(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                _navigateToInformationRooms(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              onPressed: () {
                // Do nothing or add your functionality
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
