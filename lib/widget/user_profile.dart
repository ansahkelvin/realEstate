import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text("User"),
            ),
            accountName: Text("Current User"),
            accountEmail: Text("user@example.com"),
          ),
        ],
      ),
    );
  }
}
