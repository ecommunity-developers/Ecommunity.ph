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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future createAdminAcc(
  String? firstName,
  String? lastName,
  DateTime? birthday,
  String? gender,
  String? phoneNumber,
  String? houseNoStreet,
  String? barangay,
  String? photoUrl,
  String? email,
  String? houseNumStreet,
  bool? activeAccStatus,
  String? username,
  String? password,
  String? userType,
  bool? isDeactivated,
  String? office,
  List<String>? role,
  String? randomDocGen,
) async {
  randomDocGen ??= "";
  firstName ??= "";
  lastName ??= "";
  birthday ??= DateTime.now();
  gender ??= "";
  phoneNumber ??= "";
  houseNoStreet ??= "";
  barangay ??= "";
  photoUrl ??= "";
  email ??= "";
  houseNumStreet ??= "";
  activeAccStatus ??= true;
  username ??= "";
  password ??= "";
  userType ??= "";
  isDeactivated ??= false;
  office ??= "";
  role ??= [];

  //Create the return msg
  String returnmsg = 'Success';
  //created time variable
  DateTime createdTime = DateTime.now();
  //Create the secondary app to create the users
  FirebaseApp app = await Firebase.initializeApp(
      name: randomDocGen, options: Firebase.app().options);

  try {
    //Create the user with the email & password provided
    UserCredential userCredential = await FirebaseAuth.instanceFor(app: app)
        .createUserWithEmailAndPassword(email: email, password: password);
    // Set the UID generated to a variable so we can use it later
    String? uid = userCredential.user?.uid;
    // Check if UID is not empy
    if (uid != null) {
      //Get collection reference to create our new user document
      final CollectionReference<Map<String, dynamic>> usersRef =
          FirebaseFirestore.instance.collection('user');

      //Create new user document with the parameters we have (you can add more parameters and just add here the extra)
      usersRef.doc(uid).set({
        'uid': uid,
        'created_time': createdTime,
        'first_name': firstName,
        'last_name': lastName,
        'birthday': birthday,
        'gender': gender,
        'photo_url': photoUrl,
        'phone_number': phoneNumber,
        'email': email,
        'houseNoStreet': houseNumStreet,
        'barangay': barangay,
        'activeAccStatus': activeAccStatus,
        'username': username,
        'password': password,
        'user_type': userType,
        'isDeactivated': isDeactivated,
        'office': office,
        'role': role,
      });
      return returnmsg;
    } else {
      return "Error while creating the UID";
    }
  } on FirebaseAuthException catch (e) {
    return e.code;
  }
}
