// import 'package:flutter/material.dart';
// import 'package:ono/Admin/adminNewUserService.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController countryController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   TextEditingController stateController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController genderController = TextEditingController();
//   TextEditingController positionController = TextEditingController();
//   TextEditingController departmentController = TextEditingController();
//   TextEditingController subDepartmentController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   TextEditingController photoLinkController = TextEditingController();
//   bool passToggle = true;

//   // Create the service class object
//   Service service = Service();

//   // Form key for validation
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'Add User',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.red.shade900,
//         foregroundColor: Colors.white,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: nameController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Name',
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: emailController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Email',
//                     prefixIcon: Icon(Icons.email),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your email';
//                     }
//                     // You can add more specific email validation if needed
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: 100, // Adjust the width as needed

//                   child: DropdownButtonFormField<String>(
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Country',
//                       prefixIcon: Icon(Icons.flag),
//                     ),
//                     items: <String>[
//                       'USA',
//                       'Canada',
//                       'UK',
//                       'Germany',
//                       'india',
//                       'Afghanistan',
//                       'Albania',
//                       'Algeria',
//                       'Angola',
//                       'Antigua and Barbuda',
//                       'Argentina',
//                       'Armenia',
//                       'Australia',
//                       'Austria',

//                       'Bahamas',
//                       'Bahrain',
//                       'Bangladesh',
//                       'Barbados',
//                       'Belarus',
//                       'Belgium',
//                       'Belize',
//                       'Benin',
//                       'Bhutan',
//                       'Bolivia',
//                       'Bosnia and Herzegovina',
//                       'Botswana',
//                       'Brazil',
//                       'Brunei',
//                       'Bulgaria',
//                       'Burkina Faso',
//                       'Burundi',
//                       'Cabo Verde',
//                       'Cambodia',
//                       'Cameroon',
//                       'Canada',
//                       'Central African Republic',

//                       'Chile',
//                       'China',
//                       'Colombia',
//                       'Comoros',
//                       'Congo (Congo-Brazzaville)',
//                       'Costa Rica',
//                       'Croatia',
//                       'Cuba',
//                       'Cyprus',
//                       'Czechia (Czech Republic)',
//                       'Democratic Republic of the Congo',
//                       'Denmark',
//                       'Djibouti',
//                       'Dominica',
//                       'Dominican Republic',
//                       'Ecuador',
//                       'Egypt',
//                       'El Salvador',
//                       'Equatorial Guinea',
//                       'Eritrea',
//                       'Estonia',
//                       'Eswatini (fmr. "Swaziland")',
//                       'Ethiopia',
//                       'Fiji',
//                       'Finland',
//                       'France',
//                       'Gabon',
//                       'Gambia',
//                       'Georgia',
//                       'Germany',
//                       'Ghana',
//                       'Greece',
//                       'Grenada',
//                       'Guatemala',
//                       'Guinea',
//                       'Guinea-Bissau',
//                       'Guyana',
//                       'Haiti',
//                       'Holy See',
//                       'Honduras',
//                       'Hungary',
//                       'Iceland',
//                       'India',
//                       'Indonesia',
//                       'Iran',
//                       'Iraq',
//                       'Ireland',
//                       'Israel',
//                       'Italy',
//                       'Jamaica',
//                       'Japan',
//                       'Jordan',
//                       'Kazakhstan',
//                       'Kenya',
//                       'Kiribati',
//                       'Kuwait',
//                       'Kyrgyzstan',
//                       'Laos',
//                       'Latvia',
//                       'Lebanon',
//                       'Lesotho',
//                       'Liberia',
//                       'Libya',
//                       'Liechtenstein',
//                       'Lithuania',
//                       'Luxembourg',
//                       'Madagascar',
//                       'Malawi',
//                       'Malaysia',
//                       'Maldives',
//                       'Mali',
//                       'Malta',
//                       'Marshall Islands',
//                       'Mauritania',
//                       'Mauritius',
//                       'Mexico',
//                       'Micronesia',
//                       'Moldova',
//                       'Monaco',
//                       'Mongolia',
//                       'Montenegro',
//                       'Morocco',
//                       'Mozambique',
//                       'Myanmar (formerly Burma)',
//                       'Namibia',
//                       'Nauru',
//                       'Nepal',
//                       'Netherlands',
//                       'New Zealand',
//                       'Nicaragua',
//                       'Niger',
//                       'Nigeria',
//                       'North Korea',
//                       'North Macedonia',
//                       'Norway',
//                       'Oman',
//                       'Pakistan',
//                       'Palau',
//                       'Palestine State',
//                       'Panama',
//                       'Papua New Guinea',
//                       'Paraguay',
//                       'Peru',
//                       'Philippines',
//                       'Poland',
//                       'Portugal',
//                       'Qatar',
//                       'Romania',
//                       'Russia',
//                       'Rwanda',
//                       'Saint Kitts and Nevis',
//                       'Saint Lucia',
//                       'Saint Vincent and the Grenadines',
//                       'Samoa',
//                       'San Marino',
//                       'Sao Tome and Principe',
//                       'Saudi Arabia',
//                       'Senegal',
//                       'Serbia',
//                       'Seychelles',
//                       'Sierra Leone',
//                       'Singapore',
//                       'Slovakia',
//                       'Slovenia',
//                       'Solomon Islands',
//                       'Somalia',
//                       'South Africa',
//                       'South Korea',
//                       'South Sudan',
//                       'Spain',
//                       'Sri Lanka',
//                       'Sudan',
//                       'Suriname',
//                       'Sweden',
//                       'Switzerland',
//                       'Syria',
//                       'Tajikistan',
//                       'Tanzania',
//                       'Thailand',
//                       'Timor-Leste',
//                       'Togo',
//                       'Tonga',
//                       'Trinidad and Tobago',
//                       'Tunisia',
//                       'Turkey',
//                       'Turkmenistan',
//                       'Tuvalu',
//                       'Uganda',
//                       'Ukraine',
//                       'United Arab Emirates',
//                       'United Kingdom',
//                       'United States of America',
//                       'Uruguay',
//                       'Uzbekistan',
//                       'Vanuatu',
//                       'Venezuela',
//                       'Vietnam',
//                       'Yemen',
//                       'Zambia',
//                       'Zimbabwe',
//                     ].map((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                     onChanged: (String? value) {
//                       setState(() {
//                         countryController.text = value!;
//                       });
//                     },
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please select your country';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: stateController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'State',
//                     prefixIcon: Icon(Icons.stacked_bar_chart_sharp),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your state';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: cityController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'City',
//                     prefixIcon: Icon(Icons.location_city),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your city';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: passwordController,
//                   obscureText: passToggle,
//                   decoration: InputDecoration(
//                     border: const OutlineInputBorder(),
//                     labelText: 'Password',
//                     suffixIcon: InkWell(
//                       onTap: () {
//                         setState(() {
//                           passToggle = !passToggle;
//                         });
//                       },
//                       child: Icon(
//                           passToggle ? Icons.visibility_off : Icons.visibility),
//                     ),
//                     prefixIcon: const Icon(Icons.lock),
//                   ),
//                   // obscureText: true,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter a password';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: mobileController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Mobile',
//                     prefixIcon: Icon(Icons.phone),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your mobile number';
//                     }
//                     return null;
//                   },
//                   keyboardType: TextInputType.phone,
//                 ),
//                 const SizedBox(height: 20),
//                 DropdownButtonFormField<String>(
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Gender',
//                     prefixIcon: Icon(Icons.people),
//                   ),
//                   items:
//                       <String>['Male', 'Female', 'Other'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? value) {
//                     setState(() {
//                       genderController.text = value!;
//                     });
//                   },
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please select your gender';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: positionController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Position',
//                     prefixIcon: Icon(Icons.work),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your position';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: departmentController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Department',
//                     prefixIcon: Icon(Icons.work),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your department';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: subDepartmentController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'SubDepartment',
//                     prefixIcon: Icon(Icons.work),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your subdepartment';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: addressController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Address',
//                     prefixIcon: Icon(Icons.location_on),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your address';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 TextFormField(
//                   controller: photoLinkController,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Photo Link',
//                     prefixIcon: Icon(Icons.photo),
//                   ),
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Please enter your photo link';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         service.saveUser(
//                           nameController.text,
//                           emailController.text,
//                           countryController.text,
//                           stateController.text,
//                           cityController.text,
//                           passwordController.text,
//                           mobileController.text,
//                           genderController.text,
//                           positionController.text,
//                           departmentController.text,
//                           subDepartmentController.text,
//                           addressController.text,
//                           photoLinkController.text,
//                         );
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('user registered Successful',
//                                 style: TextStyle(color: Colors.white)),
//                             duration: Duration(seconds: 10),
//                             behavior: SnackBarBehavior
//                                 .floating, 
//                             margin: EdgeInsets.only(
//                                 bottom: 735,
//                                 left: 150,
//                                 right: 0),
//                             backgroundColor:
//                                 Colors.green, // Set background color
//                             shape: RoundedRectangleBorder(
//                               // Set shape for rounded corners
//                               borderRadius: BorderRadius.circular(35),
//                             ),
//                           ),
//                         );

//                         // Clear all text fields
//                         nameController.clear();
//                         emailController.clear();
//                         countryController.clear();
//                         stateController.clear();
//                         cityController.clear();
//                         passwordController.clear();
//                         mobileController.clear();
//                         genderController.clear();
//                         positionController.clear();
//                         departmentController.clear();
//                         subDepartmentController.clear();
//                         addressController.clear();
//                         photoLinkController.clear();
//                       }
//                     },
//                     child: Text(
//                       'Submit',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red.shade900,
//                       foregroundColor: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
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










// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class NewUser extends StatefulWidget {
//   const NewUser({Key? key}) : super(key: key);

//   @override
//   State<NewUser> createState() => _NewUserState();
// }

// class _NewUserState extends State<NewUser> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _designationController = TextEditingController();
//   File? _image; // Variable to store the selected image

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
//   appBar: AppBar(
//     title: Text(
//       'Add Exhibitors',
//       style: TextStyle(
//         color: Colors.white,
//       ),
//     ),
//     centerTitle: true,
//     backgroundColor: Colors.red.shade900,
//     leading: IconButton(
//       icon: Icon(Icons.arrow_back),
//       color: Colors.white,
//       onPressed: () {
//         Navigator.pop(context); // Navigate back to previous screen
//       },
//     ),
//   ),
//   body: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 35,
//                 backgroundImage: _image != null ? FileImage(_image!) : AssetImage('assets/avatar.png') as ImageProvider,
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 30),
//         TextField(
//           controller: _nameController,
//           decoration: InputDecoration(
//             labelText: 'Name',
//           ),
//         ),
//         SizedBox(height: 30),
//         TextField(
//           controller: _designationController,
//           decoration: InputDecoration(
//             labelText: 'Designation',
//           ),
//         ),
//         SizedBox(height: 30),
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: () {
//               // Handle saving changes
//               String name = _nameController.text;
//               String designation = _designationController.text;
//               // Perform actions with name, designation, and image
//               print('Name: $name, Designation: $designation, Image: $_image');
//             },
//             child: Text('Save'),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red.shade900,
//               foregroundColor: Colors.white,
//             ),
//           ),
//         ),
//       ],
//     ),
//   ),
// );

//   }
// }




import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NewUser extends StatefulWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  State<NewUser> createState() => _NewUserState();
}

class _NewUserState extends State<NewUser> {
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
          'Add Exhibitors',
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
