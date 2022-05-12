// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = FutureProvider<dynamic>((ref) async {
  List homes = [];

  final db = FirebaseFirestore.instance;
  await db.collection("homes").get().then((querySnapshot) {
    for (var result in querySnapshot.docs) {
      homes.add(result.data());
    }
  });

  return homes;
});
