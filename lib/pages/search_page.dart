import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:realestate/pages/home.dart';
import 'package:realestate/pages/page_details.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key, required this.location}) : super(key: key);
  final String location;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Search Results",
          style: TextStyle(color: Colors.black87),
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
      body: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: FirebaseFirestore.instance
              .collection("homes")
              .where("location", isEqualTo: widget.location)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              );
            }
            if (snapshot.data != null) {
              final List<DocumentSnapshot> data = snapshot.data!.docs;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                PageDetails(homeInfo: data[index]),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index]["imgUrl"][0]),
                      ),
                      isThreeLine: true,
                      title: Text(
                        data[index]["title"],
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]["location"].toString(),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "${data[index]['bathroom']} Bathroom -${data[index]['bedroom']} Bedroom",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: Text(
                  "No Properties found",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.purple,
              ),
            );
          }),
    );
  }
}
