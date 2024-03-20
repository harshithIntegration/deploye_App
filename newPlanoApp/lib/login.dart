import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ono/signUp.dart';
import 'package:ono/forgotPassword.dart';

class LoginCredentials {
  final String userEmail;
  final String userPassword;

  LoginCredentials({
    required this.userEmail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'userEmail': userEmail,
      'userPassword': userPassword,
    };
  }
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

  // Method to save user authentication data
  Future<void> saveUserData(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  // Method to check if user is already logged in
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') != null;
  }

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
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResetPasswordPage()));
                  print('Forgot Password pressed');
                },
                child: const Text('Forgot Password?'),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('userEmail: ${_emailController.text}');
                      print('userPassword: ${_passwordController.text}');

                      LoginCredentials credentials = LoginCredentials(
                        userEmail: _emailController.text,
                        userPassword: _passwordController.text,
                      );
                      String jsonData = jsonEncode(credentials.toJson());
                      print('JSON Data: $jsonData');
                      http.post(
                        Uri.parse("http://10.0.2.2:4040/userLogin"),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonData,
                      ).then((response) async {
                        if (response.statusCode == 200) {
                          var res = json.decode(response.body);
                          debugPrint(res);
                          debugPrint(response.body);

                          await saveUserData(res['token']);
                        } else {

                          print('Login failed');
                        }
                      }).catchError((error) {

                        print('Error: $error');
                      });
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
