import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ono/Admin/newSpeaker.dart';

class AddspePage extends StatefulWidget {
  @override
  _AddspePageState createState() => _AddspePageState();
}

class _AddspePageState extends State<AddspePage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'Darshan sir',
      'designation': 'CEO of planotech group of companies',
      'imagePath': 'assets/sir.jpg',
    },
    {
      'name': 'Niranjan sir',
      'designation': 'PHP developer',
      'imagePath': 'assets/nir.jpg',
    },
    {
      'name': 'Rithesh sir',
      'designation': 'Frontend developer',
      'imagePath': 'assets/r1.jpg',
    },
  ];

void _addNewUser(Map<String, dynamic> userDetails) {
  setState(() {
    String name = userDetails['name'];
    String designation = userDetails['designation'];
    File? image = userDetails['image'];

    _allMembers.add({
      'name': name,
      'designation': designation,
      'imagePath': image != null ? image.path : 'assets/avatar.png', // Assuming default image path if no image is provided
    });

    // Optionally, you can also update the filtered list if needed
    _filterMembers(_searchController.text);
  });
}

// Inside _AddexePageState class

void _navigateToNewUserPage() async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => NewUser1()),
  );

  if (result != null && result is Map<String, dynamic>) {
    _addNewUser(result);
  }
}


  @override
  void initState() {
    _filteredMembers.addAll(_allMembers);
    super.initState();
  }

  void _filterMembers(String query) {
    setState(() {
      _filteredMembers = _allMembers
          .where((member) =>
          member['name']!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speakers'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 50, // Set the desired height here
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search members...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                onChanged: _filterMembers,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMembers.length,
              itemBuilder: (context, index) {
                return _buildMember(_filteredMembers[index]);
              },
            ),
          ),
        ],
      ),

 floatingActionButton: FloatingActionButton(
       
        onPressed:  _navigateToNewUserPage,
        child: Icon(Icons.add),
        backgroundColor: Colors.red.shade900,
      ), 
    );
  }

  Widget _buildMember(Map<String, String> member) {
    String name = member['name']!;
    String designation = member['designation']!;
    String imagePath = member['imagePath']!;
return GestureDetector(
      onLongPress: () {
        _showOptions(member);
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          designation,
          style: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }

  void _showOptions(Map<String, String> member) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit'),
                onTap: () {
                  Navigator.pop(context);
                  // Add edit functionality
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () {
                  Navigator.pop(context);
                  // Add delete functionality
                },
              ),
            ],
          ),
        );
      },
    );
  }
}




