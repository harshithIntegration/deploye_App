import 'package:flutter/material.dart';

class Docpage extends StatefulWidget {
  const Docpage({Key? key}) : super(key: key);

  @override
  State<Docpage> createState() => _DocpageState();
}

class _DocpageState extends State<Docpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Document',
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
    );
  }
}
