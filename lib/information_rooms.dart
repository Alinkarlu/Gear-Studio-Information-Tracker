import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define routes
      routes: {
        '/': (context) => MainClassroom(),
        '/macClassroomInfo': (context) => MacClassroomInformation(),
      },
      initialRoute: '/',
    );
  }
}

class MainClassroom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gear Studio Info Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(157, 44, 19, 1),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/macClassroomInfo');
              },
              child:
                  buildClassroomWidget('Mac Classroom', 'images/macroom.jpg'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/macClassroomInfo');
              },
              child: buildClassroomWidget(
                  'Smart Classroom', 'images/smartroom.jpg'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(157, 44, 19, 1),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Add your code for calendar icon
                },
                child: Icon(
                  Icons.calendar_today,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Add your code for notebook icon
                },
                child: Icon(
                  Icons.book,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Add your code for chat icon
                },
                child: Icon(
                  Icons.chat,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildClassroomWidget(String title, String imagePath) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Center(
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 400,
                height: 160,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MacClassroomInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gear Studio Info Tracker',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(157, 44, 19, 1),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle('Information about Mac Classroom'),
            SubSectionTitle('IMac User Guide'),
            InstructionStep('1. Turn on Mac.'),
            InstructionStep('2. Turn on Magic Keyboard and Magic Mouse.'),
            InstructionStep(
              '3. Choose the account that corresponds your device number.',
            ),
            InstructionStep(
              '4. You will see the password when you click the hint button.',
            ),
            SubSectionTitle('Remarks: Extension Sockets'),
            Remark(
              'If you require extension, please kindly reach out to our team at the information counter.',
            ),
            Remark(
              'Before Taking the Extension Sockets, please remove the black strap and place it on the counter.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(157, 44, 19, 1),
        items: [
          buildBottomNavigationBarItem(Icons.calendar_today),
          buildBottomNavigationBarItem(Icons.book),
          buildBottomNavigationBarItem(Icons.chat),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
      label: '',
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16, left: 10),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}

class SubSectionTitle extends StatelessWidget {
  final String title;

  SubSectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class InstructionStep extends StatelessWidget {
  final String text;

  InstructionStep(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class Remark extends StatelessWidget {
  final String text;

  Remark(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 18),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
