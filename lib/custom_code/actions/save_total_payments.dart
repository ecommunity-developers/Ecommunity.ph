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

Future<void> saveTotalPayments(
  String? junkshopID,
) async {
  DocumentReference junkshopRef =
      FirebaseFirestore.instance.collection('junkshop').doc(junkshopID);
  try {
    if (junkshopID != null) {
      // Get the document reference for the junkshop with the specified ID

      // Initialize variables to store the total sum for Cash and GCash payments
      double cashSum = 0;
      double gcashSum = 0;

      // Query the collection 'junkshop_appointments' based on the provided junkshopID
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('junkshop_appointments')
          .where('junkshop_owner', isEqualTo: junkshopRef)
          .where('mode_of_payment', whereIn: ['Cash', 'GCash']).get();

      // Iterate through each document in the query snapshot
      querySnapshot.docs.forEach((doc) {
        // Extract the value of the 'total' field and add it to the sum based on the mode of payment
        double? total = doc['total'] as double?;
        String? modeOfPayment = doc['mode_of_payment'] as String?;
        if (total != null && modeOfPayment != null) {
          if (modeOfPayment == 'Cash') {
            cashSum += total;
          } else if (modeOfPayment == 'GCash') {
            gcashSum += total;
          }
        }
      });

      // Update the Firestore document with the total sums for Cash and GCash payments
      await junkshopRef
          .update({'total_paid_cash': cashSum, 'total_paid_gcash': gcashSum});
    } else {
      print('Invalid junkshopID: $junkshopID');
    }
  } catch (error) {
    // Handle error if needed
    print('Error updating total paid: $junkshopRef, $error');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
