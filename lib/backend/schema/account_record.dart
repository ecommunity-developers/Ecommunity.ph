import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountRecord extends FirestoreRecord {
  AccountRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "emailAdd" field.
  String? _emailAdd;
  String get emailAdd => _emailAdd ?? '';
  bool hasEmailAdd() => _emailAdd != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _username = snapshotData['username'] as String?;
    _emailAdd = snapshotData['emailAdd'] as String?;
    _password = snapshotData['password'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('account')
          : FirebaseFirestore.instance.collectionGroup('account');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('account').doc(id);

  static Stream<AccountRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountRecord.fromSnapshot(s));

  static Future<AccountRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountRecord.fromSnapshot(s));

  static AccountRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountRecordData({
  String? username,
  String? emailAdd,
  String? password,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'username': username,
      'emailAdd': emailAdd,
      'password': password,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountRecordDocumentEquality implements Equality<AccountRecord> {
  const AccountRecordDocumentEquality();

  @override
  bool equals(AccountRecord? e1, AccountRecord? e2) {
    return e1?.username == e2?.username &&
        e1?.emailAdd == e2?.emailAdd &&
        e1?.password == e2?.password;
  }

  @override
  int hash(AccountRecord? e) =>
      const ListEquality().hash([e?.username, e?.emailAdd, e?.password]);

  @override
  bool isValidKey(Object? o) => o is AccountRecord;
}
