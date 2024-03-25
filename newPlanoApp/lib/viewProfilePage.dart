import 'package:flutter/material.dart';
import 'package:ono/DASH/dashboard.dart';
import 'package:ono/editprofile.dart';
import 'package:ono/user.dart';

class viewProfilePage extends StatefulWidget {
  const viewProfilePage();

  @override
  _viewProfilePageState createState() => _viewProfilePageState();
}

class _viewProfilePageState extends State<viewProfilePage> {
  late Future<List<User>> futureUsers;
  

  @override
  void initState() {
    super.initState();
    futureUsers = User.fetchAllUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
         onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const dashboard()));
                },
        ),
      ),
      body: FutureBuilder<List<User>>(
        future: futureUsers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            // Assuming there's only one user fetched
            User user = snapshot.data![0];
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    itemProfile('Name', user.userName, Icons.person),
                    const SizedBox(height: 10),
                    itemProfile(
                        'Phone', user.userMobile.toString(), Icons.phone),
                    const SizedBox(height: 10),
                    itemProfile('Address', user.userCity, Icons.location_on),
                    const SizedBox(height: 10),
                    itemProfile('Email', user.userEmail, Icons.email),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditviewProfilePage(
                                name: user.userName,
                                phone: user.userMobile.toString(),
                                address: user.userCity,
                                email: user.userEmail,
                                onProfileUpdated:
                                    (name, phone, address, email) {
                                  setState(() {
                                    user.userName = name;
                                    user.userMobile = int.parse(phone);
                                    user.userCity = address;
                                    user.userEmail = email;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(15),
                          backgroundColor: Colors.red.shade900,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text('Edit Profile'),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }

  Widget itemProfile(String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Color.fromARGB(255, 240, 221, 221),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: TextFormField(
          initialValue: subtitle,
          readOnly: true,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        leading: Icon(icon),
        tileColor: Colors.white,
      ),
    );
  }
}
