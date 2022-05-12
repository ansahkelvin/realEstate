import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({Key? key}) : super(key: key);

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1626806819282-2c1dc01a5e0c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1770&q=80"),
            ),
            accountName: Text("Sadio Mane"),
            accountEmail: Text(
              "sadiomane@gmail.com",
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            title: const Text("Account Settings"),
            leading: const Icon(CupertinoIcons.settings),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Contact us"),
            leading: const Icon(CupertinoIcons.chat_bubble),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Payment Settings"),
            leading: const Icon(CupertinoIcons.creditcard),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Visit website"),
            leading: const Icon(CupertinoIcons.device_laptop),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
