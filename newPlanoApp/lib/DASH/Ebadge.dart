import 'package:flutter/material.dart';
import 'package:ono/DASH/dashboard.dart';

class Ebadgepage extends StatefulWidget {
  const Ebadgepage({Key? key}) : super(key: key);

  @override
  State<Ebadgepage> createState() => _EbadgepageState();
}

class _EbadgepageState extends State<Ebadgepage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  // late QRViewController controller;

  @override
  Widget build(BuildContext context) {
    // Get the current date
    final String formattedDate = DateTime.now().toString().substring(0, 10);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Badge',
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const dashboard()));
                },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent, // Make the container transparent
                border: Border.all(color: Colors.transparent), // Add border for clarity
                borderRadius: BorderRadius.zero // Make the container circular
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Custom logo
                  ClipOval(
                    child: Container(
                      height: 70, // Adjust height to your preference
                      width: 70, // Adjust width to your preference
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/ban.png'), // Replace 'your_logo.png' with your actual logo asset path
                          fit: BoxFit.cover, // Adjust how the logo fills the container
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add spacing between logo and date
                  // Current date
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Date: $formattedDate',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
