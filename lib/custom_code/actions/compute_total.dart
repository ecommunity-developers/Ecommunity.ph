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

import 'dart:convert';
import 'dart:math' as math;

Future<void> computeTotal(
    DocumentReference? appointmentReference, double? serviceCharge) async {
  try {
    // Reference to the parent document containing the subcollection
    DocumentReference parentDocRef = FirebaseFirestore.instance
        .collection('junkshop_appointments')
        .doc(appointmentReference?.id);

    // Reference to the subcollection
    CollectionReference subcollectionRef = parentDocRef.collection('quantity');

    // Get all documents from the subcollection
    QuerySnapshot querySnapshot = await subcollectionRef.get();

    // Initialize a variable to store the sum
    double sum = 0;

    // Iterate through each document
    querySnapshot.docs.forEach((doc) {
      // Extract the value of the variable from the document
      Map<String, dynamic>? data =
          doc.data() as Map<String, dynamic>?; // Cast to Map<String, dynamic>

      if (data != null) {
        double? value = data['total_price'];

        // Check if the value is not null before adding it to the sum
        if (value != null) {
          sum += value;
        }
      }
    });
    if (serviceCharge != null) {
      double total = sum - serviceCharge;
      await parentDocRef.update({'total': total});
    }

    // Perform the Firestore update operation and wait for it to complete

    // Once the update operation completes, print the final message
    print('Sum computed and updated successfully 6666: $sum');
    // print('Subtotal: $subtotal');
  } catch (error) {
    print('Error computing subcollection sum: $error');
  }
}
