import 'package:flutter/material.dart';
import 'room_schedule.dart';
import 'information.dart';
import 'information_rooms.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  void _navigateToRoomSchedule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSchedule(username: username),
      ),
    );
  }

  void _navigateToInformationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationPage(username: username),
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
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, $username!',
              style: const TextStyle(
                fontSize: 32.0, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed text color to black
                fontFamily: 'Montserrat', // Example of using a custom font
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Creative Digital Learning Center Rules & Regulations',
              style: TextStyle(
                fontSize: 24.0, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed text color to black
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildRule('Please take the shoes off when you come in.'),
                  _buildRule('Please do not bring any food or drink inside.'),
                  _buildRule(
                      'Maintain a quiet environment to avoid disturbing others.'),
                  _buildRule(
                      'Respect the privacy of others\' data and information stored on the computers. Log out properly after use.'),
                  _buildRule(
                      'Treat the equipment with care. Report any malfunctions or damage immediately.'),
                ],
              ),
            ),
          ],
        ),
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
              heroTag: 'calendar_button', // Unique tag
              onPressed: () {
                _navigateToRoomSchedule(context);
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

  Widget _buildRule(String rule) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 18.0)),
          Expanded(child: Text(rule, style: const TextStyle(fontSize: 18.0))),
        ],
      ),
    );
  }
}
