import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewUser1 extends StatefulWidget {
  const NewUser1({Key? key}) : super(key: key);

  @override
  State<NewUser1> createState() => _NewUser1State();
}

class _NewUser1State extends State<NewUser1> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  File? _image; // Variable to store the selected image
  final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

  // Method to pick an image from gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Speakers',
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
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Assign the GlobalKey to the Form widget
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: _image != null ? FileImage(_image!) : AssetImage('assets/avatar.png') as ImageProvider,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _designationController,
                  decoration: InputDecoration(
                    labelText: 'Designation',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a designation';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate form
                      if (_formKey.currentState!.validate()) {
                        // Handle saving changes
                        String name = _nameController.text;
                        String designation = _designationController.text;
                        // Navigate back to AddexePage and pass the new user details
                        Navigator.pop(context, {'name': name, 'designation': designation, 'image': _image});
                      }
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class NewUser1 extends StatefulWidget {
//   const NewUser1({Key? key}) : super(key: key);

//   @override
//   State<NewUser1> createState() => _NewUser1State();
// }

// class _NewUser1State extends State<NewUser1> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _designationController = TextEditingController();
//   File? _image; // Variable to store the selected image
//   final _formKey = GlobalKey<FormState>(); // GlobalKey for form validation

//   @override
//   void initState() {
//     super.initState();
//     // Load saved speaker details
//     _loadSpeakerDetails();
//   }

//   Future<void> _loadSpeakerDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _nameController.text = prefs.getString('speaker_name') ?? '';
//       _designationController.text = prefs.getString('speaker_designation') ?? '';
//       String? imagePath = prefs.getString('speaker_image_path');
//       if (imagePath != null && imagePath.isNotEmpty) {
//         _image = File(imagePath);
//       }
//     });
//   }

//   // Method to pick an image from gallery
//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Add Speakers',
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           color: Colors.white,
//           onPressed: () {
//             Navigator.pop(context); // Navigate back to previous screen
//           },
//         ),
//       ),
//       body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey, // Assign the GlobalKey to the Form widget
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     GestureDetector(
//                       onTap: _pickImage,
//                       child: CircleAvatar(
//                         radius: 35,
//                         backgroundImage: _image != null ? FileImage(_image!) : AssetImage('assets/avatar.png') as ImageProvider,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 30),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Name',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 30),
//                 TextFormField(
//                   controller: _designationController,
//                   decoration: InputDecoration(
//                     labelText: 'Designation',
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a designation';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 30),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () async {
//                       // Validate form
//                       if (_formKey.currentState!.validate()) {
//                         // Handle saving changes
//                         String name = _nameController.text;
//                         String designation = _designationController.text;
//                         // Save speaker details to shared preferences
//                         SharedPreferences prefs = await SharedPreferences.getInstance();
//                         prefs.setString('speaker_name', name);
//                         prefs.setString('speaker_designation', designation);
//                         if (_image != null) {
//                           prefs.setString('speaker_image_path', _image!.path);
//                         }
//                         // Navigate back to previous page
//                         Navigator.pop(context);
//                       }
//                     },
//                     child: Text('Save'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red.shade900,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




