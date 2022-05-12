import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String routeName = 'login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isVisble = false;

  Future<void> signin() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3 - 12,
                  child: Center(
                    child: Image.network(
                        "https://cdn.dribbble.com/users/238864/screenshots/17667119/media/ced9e10f73afbe02b450c19479aa34f5.jpg?compress=1&resize=640x480&vertical=top"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  "Login Now",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    "Please enter your details below to continue",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.mail,
                      color: Colors.grey,
                    ),
                    fillColor: Color(0xffe1e1e1),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),

                    hintText: "Email",
                    // border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.lock,
                      color: Colors.grey,
                    ),
                    fillColor: Color(0xffe1e1e1),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),

                    hintText: "password",
                    // border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 15),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password? ",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: signin,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        " Login",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  child: Column(
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't Have An Account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(Signup.routeName);
                              },
                              child: const Text(
                                " Register",
                                style: TextStyle(color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
