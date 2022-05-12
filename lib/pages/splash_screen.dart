import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:realestate/pages/login.dart';
import 'package:realestate/pages/register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1479839672679-a46483c0e7c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fHJlYWwlMjBlc3RhdGV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60"),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 46),
            child: Text(
              "Discover dream house",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 2.0),
            child: Text(
              "from smartphone",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black87,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              "The No.1 App for searching and finding\nthe most suitable house with you",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Signup.routeName);
            },
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already Have An Account?",
                  style: TextStyle(color: Colors.grey),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LoginPage.routeName);
                  },
                  child: const Text(
                    " Log in",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
