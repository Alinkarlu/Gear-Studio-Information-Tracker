import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'room_schedule.dart';
import 'information_rooms.dart';

class InformationPage extends StatefulWidget {
  final String username;

  const InformationPage({Key? key, required this.username}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  bool _isOpenHoursExpanded = false;
  bool _isContactInfoExpanded = false;
  bool _isFAQsExpanded = false;
  bool _isMapExpanded = false;

  void _navigateToRoomSchedule(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => RoomSchedule(username: widget.username),
      ),
    );
  }

  void _navigateToWelcomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomeScreen(username: widget.username),
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
          'Contact Information',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildExpandableSection(
                title: 'Opening Hours:',
                content: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weekdays: 09:00 - 16:00',
                        style: TextStyle(fontSize: 18.0)),
                    Text('Weekends & Holidays: Closed',
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                isExpanded: _isOpenHoursExpanded,
                onToggle: () {
                  setState(() {
                    _isOpenHoursExpanded = !_isOpenHoursExpanded;
                  });
                },
              ),
              _buildExpandableSection(
                title: 'Contact Information:',
                content: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: info@gearstudio.com',
                        style: TextStyle(fontSize: 18.0)),
                    Text('Phone: +1 (123) 456-7890',
                        style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                isExpanded: _isContactInfoExpanded,
                onToggle: () {
                  setState(() {
                    _isContactInfoExpanded = !_isContactInfoExpanded;
                  });
                },
              ),
              _buildExpandableSection(
                title: 'Location Map:',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // Attach the image map.png
                    Image.asset(
                      'assets/map.png',
                      height: 200, // Adjust the height as needed
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                isExpanded: _isMapExpanded,
                onToggle: () {
                  setState(() {
                    _isMapExpanded = !_isMapExpanded;
                  });
                },
              ),
              _buildExpandableSection(
                title: 'FAQs:',
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildFAQCard(
                      'Can I bring my own laptop to the center?',
                      'Yes, you are allowed to bring your own laptop to the center.',
                    ),
                    _buildFAQCard(
                      'Are there any parking facilities available nearby?',
                      'Yes, there are parking facilities available nearby. Please refer to our location map for more details.',
                    ),
                    _buildFAQCard(
                      'Do I need to make an appointment before visiting?',
                      'No, appointments are not necessary. You can visit the center during our opening hours.',
                    ),
                    _buildFAQCard(
                      'Is there Wi-Fi available at the center?',
                      'Yes, Wi-Fi is available for visitors to use at the center.',
                    ),
                  ],
                ),
                isExpanded: _isFAQsExpanded,
                onToggle: () {
                  setState(() {
                    _isFAQsExpanded = !_isFAQsExpanded;
                  });
                },
              ),
            ],
          ),
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
              heroTag: 'home_button_info',
              onPressed: () {
                _navigateToWelcomeScreen(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'calendar_button_info',
              onPressed: () {
                _navigateToRoomSchedule(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'rooms_button_info',
              onPressed: () {
                _navigateToInformationRooms(context);
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'info_button_info',
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

  Widget _buildExpandableSection({
    required String title,
    required Widget content,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onToggle,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Icon(
                isExpanded ? Icons.expand_less : Icons.expand_more,
                color: Colors.black,
              ),
            ],
          ),
        ),
        if (isExpanded) content,
        const SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildFAQCard(String question, String answer) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Q: $question',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              'A: $answer',
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
