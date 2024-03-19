import 'package:flutter/material.dart';
import 'welcomescreen.dart';
import 'information.dart';
import 'room_schedule.dart';

class InformationRooms extends StatelessWidget {
  final String username;

  const InformationRooms({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gear Studio Info Tracker',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF9D2C13),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle('Rooms Information'),
              SizedBox(height: 20.0),
              Text(
                'You can explore information about the rooms in Gear Studio here.',
                style: TextStyle(fontSize: 18.0),
              ),
              MainClassroom(),
            ],
          ),
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
              heroTag: 'home_button', // Unique tag
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(username: username),
                  ),
                );
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.home, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'calendar_button', // Unique tag
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RoomSchedule(username: username),
                  ),
                );
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.calendar_today, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'rooms_button', // Unique tag
              onPressed: () {
                // Add functionality for the rooms icon
              },
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: const Icon(Icons.apartment, color: Colors.white),
            ),
            FloatingActionButton(
              heroTag: 'info_button', // Unique tag
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InformationPage(username: username),
                  ),
                );
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

class MainClassroom extends StatelessWidget {
  const MainClassroom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _navigateToClassroomInfo(context, 'Mac Classroom');
          },
          child: buildClassroomWidget(
            'Mac Classroom',
            'images/macroom.jpg',
          ),
        ),
        GestureDetector(
          onTap: () {
            _navigateToClassroomInfo(context, 'Smart Classroom');
          },
          child: buildClassroomWidget(
            'Smart Classroom',
            'images/smartroom.jpg',
          ),
        ),
      ],
    );
  }

  Widget buildClassroomWidget(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imagePath,
                    width: 400,
                    height: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    color: Colors.black54,
                    child: const Text(
                      'Tap for details',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ClassroomInformation extends StatelessWidget {
  final String title;
  final List<Widget> informationSections;
  final List<Widget>? additionalWidgets;

  const ClassroomInformation({
    Key? key,
    required this.title,
    required this.informationSections,
    this.additionalWidgets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Gear Studio Info Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF9D2C13),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Information about $title'),
            ...informationSections,
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
        color: const Color(0xFF9D2C13),
      ),
      label: '',
    );
  }
}

class SmartClassroomInformation extends StatelessWidget {
  const SmartClassroomInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassroomInformation(
      title: 'Smart Classroom',
      informationSections: [
        SubSectionTitle('Smart Devices Usage'),
        InstructionStep('1. Use the touchscreen panel to control devices.'),
        InstructionStep(
            '2. Connect your device via Bluetooth for presentations.'),
        InstructionStep(
            '3. In case of technical issues, contact our support team.'),
        SubSectionTitle('Remarks: Maintenance'),
        Remark(
          'If you notice any issues with the equipment, please report it to the information counter.',
        ),
      ],
    );
  }
}

class MacClassroomInformation extends StatelessWidget {
  const MacClassroomInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ClassroomInformation(
      title: 'Mac Classroom',
      informationSections: [
        SubSectionTitle('IMac User Guide'),
        InstructionStep('1. Turn on Mac.'),
        InstructionStep('2. Turn on Magic Keyboard and Magic Mouse.'),
        InstructionStep(
            '3. Choose the account that corresponds to your device number.'),
        InstructionStep(
            '4. You will see the password when you click the hint button.'),
        SubSectionTitle('Remarks: Extension Sockets'),
        Remark(
          'If you require an extension, please kindly reach out to our team at the information counter.',
        ),
        Remark(
          'Before taking the Extension Sockets, please remove the black strap and place it on the counter.',
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class SubSectionTitle extends StatelessWidget {
  final String title;

  const SubSectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class InstructionStep extends StatelessWidget {
  final String text;

  const InstructionStep(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

class Remark extends StatelessWidget {
  final String text;

  const Remark(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}

// Utility function for navigation
void _navigateToClassroomInfo(BuildContext context, String title) {
  if (title == 'Mac Classroom') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MacClassroomInformation(),
      ),
    );
  } else if (title == 'Smart Classroom') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SmartClassroomInformation(),
      ),
    );
  }
}
