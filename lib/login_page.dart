import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isButtonPressed = false;

  void _onButtonPressed() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isButtonPressed = true;
      });

      await Future.delayed(const Duration(seconds: 1));
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ),
      );
      setState(() {
        _isButtonPressed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFF0),
        appBar: AppBar(
          foregroundColor: const Color(0xffFFD700),
          backgroundColor: const Color(0xffFFFFF0),
          title: const Center(
            child: Text(
              "Login Page",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.w900,
                color: Colors.blueAccent,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/thumbnails/006/450/051/small/gradient-red-blue-purple-abstract-background-you-can-use-this-background-for-your-content-like-as-video-game-qoute-promotion-template-presentation-education-sports-card-banner-website-etc-free-vector.jpg'),
                  fit: BoxFit.cover),
          ),

          // margin: EdgeInsets.all(50),
          padding: const EdgeInsets.all(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'images/pioneer_logo_app1.png', // Add the missing 'images' folder path
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Enter your Email',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          border: OutlineInputBorder(),
                          hintText: 'abc@gmail.com',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.green, width: 5.0),
                            // Set the desired border color
                          ),
                          prefixIcon: Icon(Icons.mail),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Enter your password',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                          border: OutlineInputBorder(),
                          hintText: '********',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .orange),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .orange),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 5.0),

                          ),
                          prefixIcon: Icon(Icons.key),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter username';
                          } else if (value.length < 6) {
                            return 'Atleast 6 digit';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Add forget password field
                          },
                          child: const Text(
                            'Forgot Password ?',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _onButtonPressed,
                        child: AnimatedContainer(
                          margin: const EdgeInsets.only(top: 20),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                          width: _isButtonPressed ? 80 : 150,
                          height: 60,
                          decoration: BoxDecoration(
                            color: _isButtonPressed ? Colors.green : Colors.blue,
                            borderRadius:
                                BorderRadius.circular(_isButtonPressed ? 30 : 10),
                          ),
                          child: Center(
                            child: _isButtonPressed
                                ? const Icon(Icons.done, color: Colors.white)
                                : const Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
