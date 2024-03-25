import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ono/DASH/AboutUsScreen.dart';
import 'package:ono/DASH/Speakers.dart';
import 'package:ono/DASH/doc.dart';
import 'package:ono/DASH/scanner.dart';
import 'package:ono/committee.dart';
import 'package:ono/committee1.dart';
import 'package:ono/DASH/Contact.dart';

import 'package:ono/DASH/Ebadge.dart';
import 'package:ono/DASH/Feedback.dart';
import 'package:ono/DASH/Mettings.dart';
import 'package:ono/DASH/Mom.dart';
import 'package:ono/DASH/Venue.dart';
import 'package:ono/exhibitors.dart';
import 'package:ono/login.dart';
import 'package:ono/viewProfilePage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const dashboard());
}

class dashboard extends StatelessWidget {
  const dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        _navigateToDocumentPage(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 1) {
        _navigateToviewProfilePage(context);
      }
    });
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 3) {
        _navigateToLoginPage(context);
      }
    });
  }

  void _navigateToDocumentPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CommitePage()),
    );
  }

  void _navigateToviewProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => viewProfilePage()),
    );
  }

  void _navigateToLoginPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Image.asset(
              'assets/icons/Quantum_Logo.png',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8), // Add some space between the image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quantum Paradigm',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
              // Add your banner or image widget here
              SizedBox(
                height: 200,
                width: 400,// Adjust the height as needed
                child: Image.asset(
                  'assets/old.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child:Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children:[
                        ItemDashboard(
                          title: 'About Us',
                          iconData: CupertinoIcons.phone,
                          background: Colors.blueAccent,
                          onTap: AboutUspage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Committee',
                          iconData: CupertinoIcons.person_2_fill,
                          background: Colors.green,
                          onTap: Committee1Page(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Scanner',
                          iconData: CupertinoIcons.qrcode,
                          background: Colors.red,
                          onTap: Scannerpage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Speakers',
                          iconData: CupertinoIcons.person_3,
                          background: Colors.purple,
                          onTap: SpeakerPage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Venue',
                          iconData: CupertinoIcons.location_solid,
                          background: Colors.brown,
                          onTap: Venuepage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'MOM',
                          iconData: CupertinoIcons.time,
                          background: Colors.indigo,
                          onTap: Mompage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Exhibitors',
                          iconData: CupertinoIcons.person_alt,
                          background: Colors.black45,
                          onTap: ExhibitorsPage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Document',
                          iconData: CupertinoIcons.rectangle_fill_on_rectangle_fill,
                          background: Colors.deepPurpleAccent,
                          onTap: Docpage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Feedback',
                          iconData: CupertinoIcons.phone_badge_plus,
                          background: Colors.pinkAccent,
                          onTap: Feedbackpage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Contact Us',
                          iconData: CupertinoIcons.profile_circled,
                          background: Colors.deepOrange,
                          onTap: Contactpage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'E-Badge',
                          iconData: CupertinoIcons.app_badge_fill,
                          background: Colors.blueGrey,
                          onTap: Ebadgepage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                        ItemDashboard(
                          title: 'Meetings',
                          iconData: CupertinoIcons.person_2_alt,
                          background: Colors.yellow,
                          onTap: Mettingpage(),
                          titleTextStyle: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
              ),
              const SizedBox(height: 20),
            ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Committee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_outlined),
            label: 'Login',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.red,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),


    );
  }
}
class ItemDashboard extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Color background;
  final dynamic onTap;
  final TextStyle titleTextStyle;

  const ItemDashboard({
    required this.title,
    required this.iconData,
    required this.background,
    required this.onTap,
    required this.titleTextStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => onTap),
        );
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              title.toUpperCase(),
              style: titleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
