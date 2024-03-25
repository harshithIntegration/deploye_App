import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ono/Admin/newExhibitors.dart';

class AddexePage extends StatefulWidget {
  @override
  _AddexePageState createState() => _AddexePageState();
}

class _AddexePageState extends State<AddexePage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredMembers = [];
  List<Map<String, String>> _allMembers = [
    {
      'name': 'John Doe',
      'designation': 'Chairperson',
      'imagePath': 'assets/johndoe.jpg',
    },
    {
      'name': 'Jane Smith',
      'designation': 'Vice Chairperson',
      'imagePath': 'assets/jane smith.jpg',
    },
    {
      'name': 'Michael Johnson',
      'designation': 'Secretary',
      'imagePath': 'assets/micheal johnson.jpg',
    },
    {
      'name': 'Emily Brown',
      'designation': 'Treasurer',
      'imagePath': 'assets/emilybrown.jpg',
    },
    {
      'name': 'Alice Johnson',
      'designation': 'Event Coordinator',
      'imagePath': 'assets/alice.jpg',
    },
    {
      'name': 'Bob Smith',
      'designation': 'Marketing Manager',
      'imagePath': 'assets/bobsmith.jpg',
    },
    {
      'name': 'Ella Davis',
      'designation': 'Public Relations Officer',
      'imagePath': 'assets/ella.jpg',
    },
    {
      'name': 'Jack Wilson',
      'designation': 'Finance Director',
      'imagePath': 'assets/jack.jpg',
    },
    {
      'name': 'Sophia Brown',
      'designation': 'Membership Secretary',
      'imagePath': 'assets/sophia.jpg',
    },
    {
      'name': 'William Taylor',
      'designation': 'Technical Lead',
      'imagePath': 'assets/william.jpg',
    },
    {
      'name': 'Sanketh Dani',
      'designation': 'Technical Lead',
      'imagePath': 'assets/sann.jfif',
    },
    
  ];
// Inside _AddexePageState class

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
    MaterialPageRoute(builder: (context) => NewUser()),
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
        title: Text('Exhibitors'),
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
              height: 50,
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
        // onPressed: () {
         
        //               Navigator.push(
        //                 context,
        //                 MaterialPageRoute(builder: (context) => NewUser()),
        //               ); 
               
        // },
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
