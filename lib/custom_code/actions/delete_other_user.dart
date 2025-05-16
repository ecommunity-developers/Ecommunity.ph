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

import 'package:cloud_functions/cloud_functions.dart';

Future<void> deleteOtherUser(String documentRef) async {
  try {
    final HttpsCallable callable =
        FirebaseFunctions.instance.httpsCallable('deleteUserByDocumentRef');
    final result = await callable.call({'documentRef': documentRef});
    print(result.data);
  } on FirebaseFunctionsException catch (e) {
    print('Firebase function call failed: $e');
    // Handle error
  } catch (e) {
    print('Error calling Firebase function: $e');
    // Handle error
  }
}
