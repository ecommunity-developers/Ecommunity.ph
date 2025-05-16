import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BrgyAnnouncementsRecord extends FirestoreRecord {
  BrgyAnnouncementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "addresses" field.
  List<String>? _addresses;
  List<String> get addresses => _addresses ?? const [];
  bool hasAddresses() => _addresses != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "posted_by" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "edited_by" field.
  String? _editedBy;
  String get editedBy => _editedBy ?? '';
  bool hasEditedBy() => _editedBy != null;

  // "edit_time" field.
  DateTime? _editTime;
  DateTime? get editTime => _editTime;
  bool hasEditTime() => _editTime != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _addresses = getDataList(snapshotData['addresses']);
    _subject = snapshotData['subject'] as String?;
    _message = snapshotData['message'] as String?;
    _postedBy = snapshotData['posted_by'] as String?;
    _editedBy = snapshotData['edited_by'] as String?;
    _editTime = snapshotData['edit_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('brgy_announcements');

  static Stream<BrgyAnnouncementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BrgyAnnouncementsRecord.fromSnapshot(s));

  static Future<BrgyAnnouncementsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => BrgyAnnouncementsRecord.fromSnapshot(s));

  static BrgyAnnouncementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BrgyAnnouncementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BrgyAnnouncementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BrgyAnnouncementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BrgyAnnouncementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BrgyAnnouncementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBrgyAnnouncementsRecordData({
  DateTime? createdTime,
  String? subject,
  String? message,
  String? postedBy,
  String? editedBy,
  DateTime? editTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'subject': subject,
      'message': message,
      'posted_by': postedBy,
      'edited_by': editedBy,
      'edit_time': editTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class BrgyAnnouncementsRecordDocumentEquality
    implements Equality<BrgyAnnouncementsRecord> {
  const BrgyAnnouncementsRecordDocumentEquality();

  @override
  bool equals(BrgyAnnouncementsRecord? e1, BrgyAnnouncementsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.addresses, e2?.addresses) &&
        e1?.subject == e2?.subject &&
        e1?.message == e2?.message &&
        e1?.postedBy == e2?.postedBy &&
        e1?.editedBy == e2?.editedBy &&
        e1?.editTime == e2?.editTime;
  }

  @override
  int hash(BrgyAnnouncementsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.addresses,
        e?.subject,
        e?.message,
        e?.postedBy,
        e?.editedBy,
        e?.editTime
      ]);

  @override
  bool isValidKey(Object? o) => o is BrgyAnnouncementsRecord;
}
