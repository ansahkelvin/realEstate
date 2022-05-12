import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/search_page.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final locationController = TextEditingController();
  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {},
        child: TextField(
          onSubmitted: (value) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchPage(location: value.trim()),
              ),
            );
          },
          decoration: const InputDecoration(
            iconColor: Colors.purple,
            border: InputBorder.none,
            prefixIconColor: Colors.purple,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: Colors.purple,
            ),
            hintText: "Search for dream home",
          ),
        ),
      ),
    );
  }
}
