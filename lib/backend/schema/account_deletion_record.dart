import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountDeletionRecord extends FirestoreRecord {
  AccountDeletionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "deletedBy" field.
  String? _deletedBy;
  String get deletedBy => _deletedBy ?? '';
  bool hasDeletedBy() => _deletedBy != null;

  // "timeDeleted" field.
  DateTime? _timeDeleted;
  DateTime? get timeDeleted => _timeDeleted;
  bool hasTimeDeleted() => _timeDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _deletedBy = snapshotData['deletedBy'] as String?;
    _timeDeleted = snapshotData['timeDeleted'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('account_deletion')
          : FirebaseFirestore.instance.collectionGroup('account_deletion');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('account_deletion').doc(id);

  static Stream<AccountDeletionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountDeletionRecord.fromSnapshot(s));

  static Future<AccountDeletionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountDeletionRecord.fromSnapshot(s));

  static AccountDeletionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountDeletionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountDeletionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountDeletionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountDeletionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountDeletionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountDeletionRecordData({
  bool? isDeleted,
  String? deletedBy,
  DateTime? timeDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'isDeleted': isDeleted,
      'deletedBy': deletedBy,
      'timeDeleted': timeDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountDeletionRecordDocumentEquality
    implements Equality<AccountDeletionRecord> {
  const AccountDeletionRecordDocumentEquality();

  @override
  bool equals(AccountDeletionRecord? e1, AccountDeletionRecord? e2) {
    return e1?.isDeleted == e2?.isDeleted &&
        e1?.deletedBy == e2?.deletedBy &&
        e1?.timeDeleted == e2?.timeDeleted;
  }

  @override
  int hash(AccountDeletionRecord? e) =>
      const ListEquality().hash([e?.isDeleted, e?.deletedBy, e?.timeDeleted]);

  @override
  bool isValidKey(Object? o) => o is AccountDeletionRecord;
}
