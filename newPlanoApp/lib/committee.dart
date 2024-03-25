import 'package:flutter/material.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:ono/committee1.dart';
import 'package:ono/login.dart';
import 'package:ono/viewProfilePage.dart';

class CommitePage extends StatefulWidget {
  const CommitePage({Key? key}) : super(key: key);

  @override
  State<CommitePage> createState() => _CommitePageState();
}

class _CommitePageState extends State<CommitePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _navigateToDashboardPage(context);
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

  void _navigateToDashboardPage(BuildContext context) {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => dashboard()),
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
        title: Text('Committee'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
         onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const dashboard()));
                },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Committee1Page()), 
                );
              },
              child: Text(
                'Organising Committee',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
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
