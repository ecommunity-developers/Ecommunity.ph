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

Future<void> updateDocumentStatusAfter12Hours() async {
  // Get the current date and time
  DateTime now = DateTime.now();

  // Get a reference to the Firestore collection
  CollectionReference appointmentsRef =
      FirebaseFirestore.instance.collection('junkshop_appointments');

  // Query documents where rejection_time is less than or equal to the current time
  appointmentsRef
      .where('rejection_time', isLessThanOrEqualTo: now)
      .get()
      .then((QuerySnapshot querySnapshot) {
    // Iterate over the documents and update each one
    querySnapshot.docs.forEach((doc) async {
      try {
        if (doc.exists && doc['status'] == 'Requested') {
          await doc.reference.update({
            'status': 'Rejected',
            'cancellation_remarks':
                'The junskshop took too long to respond. Your request has been automatically rejected.',
            'time_deleted': now,
          });
          print('Document updated: ${doc.id}');

          // Extract the document reference from the 'booker_ref' field
          DocumentReference bookerRef = doc['booker_ref'];

          // Create a document under the 'notification' collection
          await FirebaseFirestore.instance.collection('notification').add({
            'created_time': Timestamp.now(),
            'image':
                'https://firebasestorage.googleapis.com/v0/b/ecommunity-awspik.appspot.com/o/junkshop.png?alt=media&token=75a3b503-13d1-4371-ad84-1b37117de0e9',
            'message': 'Your appointment has expired.',
            'receiver': bookerRef,
          });
        }
      } catch (e) {
        print('Error updating document ${doc.id}: $e');
      }
    });
  }).catchError((error) {
    print('Error querying documents: $error');
  });
}
