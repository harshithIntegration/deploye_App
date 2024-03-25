import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ono/Admin/admin.dart';
import 'package:ono/DASH/Ebadge.dart';
import 'package:ono/signUp.dart';
import 'package:ono/forgotPassword.dart';
// import './DASH/Document.dart';

class User {
  final String email;
  final String password; // Include password for admin user authentication

  User({required this.email, required this.password});
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passToggle = true;

  List<User> adminUsers = [
    User(email: 'Admin987@gmail.com', password: 'admin123987'), // Admin user
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.red.shade900,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.normal,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(
                      r"^[a-zA-Z0-9,a-zA-Z0-9,!#$%&'*+-/=?^_`{|~}]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                obscureText: passToggle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        passToggle = !passToggle;
                      });
                    },
                    child: Icon(
                        passToggle ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  } 
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              // TextButton(
              //   onPressed: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const ResetPasswordPage()));
              //     print('Forgot Password pressed');
              //   },
              //   child: const Text('Forgot Password?'),
              // ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('userEmail: ${_emailController.text}');
                      print('userPassword: ${_passwordController.text}');

                                      String email = _emailController.text;
                  String password = _passwordController.text;

                  User? adminUser = adminUsers.firstWhereOrNull(
                    (user) =>
                        user.email == email && user.password == password,
                  );

                  if (adminUser != null) {
                    // Admin login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Adminpage()),
                    );
                  } 
                  else if (email.isNotEmpty && password.isNotEmpty) {
                    // Non-admin user login
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Ebadgepage()),
                    );
                  } else {
                    
                  }

                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade900,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                      print('Sign up now pressed');
                    },
                    child: const Text('Sign up'),
                  ),
                  const SizedBox(height: 32.0),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
