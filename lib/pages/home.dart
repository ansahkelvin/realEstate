import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/widget/container_banner.dart';
import 'package:realestate/widget/featured_house.dart';
import 'package:realestate/widget/search_bar.dart';
import 'package:realestate/widget/user_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String routeName = "home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12.0, left: 12),
              child: Text(
                "current Location",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.purple,
                  ),
                  Text(
                    "Accra, Ghana",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.sort_down,
            ),
          ),
        ],
      ),
      drawer: const UserDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SearchBarWidget(),
            ContainerBanner(),
            SizedBox(
              height: 30,
            ),
            FeaturedHomes(),
          ],
        ),
      ),
    );
  }
}
