// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? firstName,
    String? lastName,
    DocumentReference? userRef,
    String? profilePic,
    String? address,
    String? phoneNum,
    String? gcashQR,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _firstName = firstName,
        _lastName = lastName,
        _userRef = userRef,
        _profilePic = profilePic,
        _address = address,
        _phoneNum = phoneNum,
        _gcashQR = gcashQR,
        super(firestoreUtilData);

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;

  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  set lastName(String? val) => _lastName = val;

  bool hasLastName() => _lastName != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  set userRef(DocumentReference? val) => _userRef = val;

  bool hasUserRef() => _userRef != null;

  // "profile_pic" field.
  String? _profilePic;
  String get profilePic => _profilePic ?? '';
  set profilePic(String? val) => _profilePic = val;

  bool hasProfilePic() => _profilePic != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  set address(String? val) => _address = val;

  bool hasAddress() => _address != null;

  // "phone_num" field.
  String? _phoneNum;
  String get phoneNum => _phoneNum ?? '';
  set phoneNum(String? val) => _phoneNum = val;

  bool hasPhoneNum() => _phoneNum != null;

  // "gcashQR" field.
  String? _gcashQR;
  String get gcashQR => _gcashQR ?? '';
  set gcashQR(String? val) => _gcashQR = val;

  bool hasGcashQR() => _gcashQR != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        firstName: data['first_name'] as String?,
        lastName: data['last_name'] as String?,
        userRef: data['user_ref'] as DocumentReference?,
        profilePic: data['profile_pic'] as String?,
        address: data['address'] as String?,
        phoneNum: data['phone_num'] as String?,
        gcashQR: data['gcashQR'] as String?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'first_name': _firstName,
        'last_name': _lastName,
        'user_ref': _userRef,
        'profile_pic': _profilePic,
        'address': _address,
        'phone_num': _phoneNum,
        'gcashQR': _gcashQR,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'last_name': serializeParam(
          _lastName,
          ParamType.String,
        ),
        'user_ref': serializeParam(
          _userRef,
          ParamType.DocumentReference,
        ),
        'profile_pic': serializeParam(
          _profilePic,
          ParamType.String,
        ),
        'address': serializeParam(
          _address,
          ParamType.String,
        ),
        'phone_num': serializeParam(
          _phoneNum,
          ParamType.String,
        ),
        'gcashQR': serializeParam(
          _gcashQR,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        lastName: deserializeParam(
          data['last_name'],
          ParamType.String,
          false,
        ),
        userRef: deserializeParam(
          data['user_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
        profilePic: deserializeParam(
          data['profile_pic'],
          ParamType.String,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.String,
          false,
        ),
        phoneNum: deserializeParam(
          data['phone_num'],
          ParamType.String,
          false,
        ),
        gcashQR: deserializeParam(
          data['gcashQR'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        userRef == other.userRef &&
        profilePic == other.profilePic &&
        address == other.address &&
        phoneNum == other.phoneNum &&
        gcashQR == other.gcashQR;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [firstName, lastName, userRef, profilePic, address, phoneNum, gcashQR]);
}

UserStruct createUserStruct({
  String? firstName,
  String? lastName,
  DocumentReference? userRef,
  String? profilePic,
  String? address,
  String? phoneNum,
  String? gcashQR,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      firstName: firstName,
      lastName: lastName,
      userRef: userRef,
      profilePic: profilePic,
      address: address,
      phoneNum: phoneNum,
      gcashQR: gcashQR,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
