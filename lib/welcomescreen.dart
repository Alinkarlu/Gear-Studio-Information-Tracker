import 'package:flutter/material.dart';
import 'room_schedule.dart';
import 'information.dart';
import 'information_rooms.dart';

class WelcomeScreen extends StatelessWidget {
  final String username;

  const WelcomeScreen({Key? key, required this.username}) : super(key: key);

  String _getGreetingUsername(String email) {
    List<String> parts = email.split('.'); // Split at the dot
    String firstName = parts[0]; // Take the first part

    // If the email has a dot before the "@" symbol
    if (parts.length > 1) {
      List<String> firstNameParts = firstName.split('@');
      firstName = firstNameParts[0]; // Take the first part
    }

    // Capitalize the first letter of the first part
    firstName = firstName.substring(0, 1).toUpperCase() +
        firstName.substring(1).toLowerCase();

    return firstName;
  }

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

  void _logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    String greetingUsername = _getGreetingUsername(username);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
        actions: [
          IconButton(
            onPressed: () {
              _logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color:
                    const Color(0xFFF5F5F5), // Background color of the bubble
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    color: const Color(0xFF9D2C13),
                    width: 2), // Border color and width
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                'Hello, $greetingUsername!',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Creative Digital Learning Center Rules & Regulations',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
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
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              heroTag: 'home_button',
              onPressed: () {},
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'calendar_button',
              onPressed: () {
                _navigateToRoomSchedule(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'apartment_button',
              onPressed: () {
                _navigateToInformationRooms(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'info_button',
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
