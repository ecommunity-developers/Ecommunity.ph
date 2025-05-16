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

import 'dart:async'; // Import dart:async for Timer

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> updateNotificationToSeen(DocumentReference userDocRef) async {
  // Query 'notification' documents where 'receiver' is the same as the authenticated user's document reference
  final QuerySnapshot notificationSnapshot = await FirebaseFirestore.instance
      .collection('notification')
      .where('receiver', isEqualTo: userDocRef)
      .get();

  // Update the 'seen' field to true for each notification
  for (DocumentSnapshot notificationDoc in notificationSnapshot.docs) {
    await notificationDoc.reference.update({'seen': true});
  }

  // Use a completer to create a delayed execution
  final Completer<void> completer = Completer<void>();
  Timer(Duration(seconds: 10), () => completer.complete());

  await completer.future; // Wait for the completer to complete

  final updatedNotificationSnapshot = await FirebaseFirestore.instance
      .collection('notification')
      .where('receiver', isEqualTo: userDocRef)
      .get();

  // Now you can work with updated notifications
  // For example, you can print the number of updated notifications
  print('Number of updated notifications: ${updatedNotificationSnapshot.size}');
}
