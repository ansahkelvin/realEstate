import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  static const String routeName = 'signup';

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signup() async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      final db = FirebaseFirestore.instance;

      final documentPath = db.doc("users/${user.user!.uid}");
      documentPath
          .set({"email": emailController.text, "name": nameController.text});
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
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3 - 12,
                  child: Center(child: Image.asset("assets/logo.webp")),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Register Now",
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
                    "Please enter your details below to register",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      CupertinoIcons.person,
                      color: Colors.grey,
                    ),
                    fillColor: Color(0xffe1e1e1),
                    filled: true,
                    border: OutlineInputBorder(borderSide: BorderSide.none),

                    hintText: "Full Name",
                    // border: InputBorder.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
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

                    hintText: "Password",
                    // border: InputBorder.none,
                  ),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: signup,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        "Register now",
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
                              "Already Have An Account?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed(LoginPage.routeName);
                              },
                              child: const Text(
                                " Login",
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
