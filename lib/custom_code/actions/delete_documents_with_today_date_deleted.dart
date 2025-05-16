// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteDocumentsWithTodayDateDeleted() async {
  // Get a reference to the Firestore collection
  String blogspot = 'blogspot';
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection(blogspot);

  // Get today's date
  DateTime today = DateTime.now();

  // Query documents where isDeleted is true
  QuerySnapshot querySnapshot =
      await collectionRef.where('isDeleted', isEqualTo: true).get();

  // Iterate over the documents and delete each one if permanentlyDeleteOn matches today's date
  querySnapshot.docs.forEach((doc) async {
    // Get the permanentlyDeleteOn value from the document
    Timestamp? permanentlyDeleteTimestamp = doc['permanentlyDeleteOn'];

    // Convert Timestamp to DateTime
    DateTime? permanentlyDeleteDate;
    if (permanentlyDeleteTimestamp != null) {
      permanentlyDeleteDate = permanentlyDeleteTimestamp.toDate();
    }

    // Check if permanentlyDeleteDate matches today's date
    if (permanentlyDeleteDate != null &&
        permanentlyDeleteDate.year >= today.year &&
        permanentlyDeleteDate.month >= today.month &&
        permanentlyDeleteDate.day >= today.day) {
      try {
        await doc.reference.delete();
        print('Document deleted: ${doc.id}');
      } catch (e) {
        print('Error deleting document ${doc.id}: $e');
      }
    }
  });
}
