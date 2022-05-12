import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PageDetails extends StatefulWidget {
  const PageDetails({Key? key, required this.homeInfo}) : super(key: key);
  final DocumentSnapshot homeInfo;

  @override
  State<PageDetails> createState() => _PageDetailsState();
}

class _PageDetailsState extends State<PageDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          widget.homeInfo["title"],
          style: const TextStyle(
              color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.network(widget.homeInfo["imgUrl"][0]),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 230, 228, 228),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.homeInfo["title"],
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                            "${widget.homeInfo['bathroom']} Bathroom - ${widget.homeInfo['bedroom']} Bedroom"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.homeInfo["location"],
                          style: const TextStyle(
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "GHC ${widget.homeInfo['price']}",
                          style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        widget.homeInfo["contact"],
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(widget.homeInfo["description"]),
          )
        ],
      ),
    );
  }
}
