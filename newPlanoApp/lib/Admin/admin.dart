import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ono/DASH/Document.dart';
import 'package:ono/Admin/view.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:ono/committee.dart';
import 'package:ono/viewProfilePage.dart';
import 'package:ono/login.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({Key? key}) : super(key: key);

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
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

  void _navigateToDashboardPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => dashboard()),
    );
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          SizedBox(height: 50),
          Container(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2, // Change to 2 for two columns
                crossAxisSpacing: 20, // Adjust spacing as needed
                mainAxisSpacing: 20,
                childAspectRatio: 1.5,
                children: [
                  ItemDashboard(
                    title: 'View',
                    iconData: CupertinoIcons.viewfinder,
                    background: Colors.blueAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Viewpage()),
                      );
                    },
                  ),
                  ItemDashboard(
                    title: 'Documents',
                    iconData: CupertinoIcons.folder_circle_fill,
                    background: Colors.pinkAccent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Documentpage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
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
  final Function onTap; 

  const ItemDashboard({
    required this.title,
    required this.iconData,
    required this.background,
    required this.onTap, 
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(); 
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 3 - 50,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(10),
        //   boxShadow: const [
        //     BoxShadow(
        //       offset: Offset(0,1),
        //       color: Colors.black12,
        //       spreadRadius: 1,
        //       blurRadius: 2,
        //     ),
        //   ],
        // ),
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
            const SizedBox(height: 2),
            Text(title.toString(),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
