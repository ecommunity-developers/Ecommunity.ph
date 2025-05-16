import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TopRecyclerOfTheMonthRecord extends FirestoreRecord {
  TopRecyclerOfTheMonthRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "recycler_reference" field.
  DocumentReference? _recyclerReference;
  DocumentReference? get recyclerReference => _recyclerReference;
  bool hasRecyclerReference() => _recyclerReference != null;

  // "month" field.
  String? _month;
  String get month => _month ?? '';
  bool hasMonth() => _month != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "eco_points" field.
  double? _ecoPoints;
  double get ecoPoints => _ecoPoints ?? 0.0;
  bool hasEcoPoints() => _ecoPoints != null;

  // "display_photo" field.
  String? _displayPhoto;
  String get displayPhoto => _displayPhoto ?? '';
  bool hasDisplayPhoto() => _displayPhoto != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _recyclerReference =
        snapshotData['recycler_reference'] as DocumentReference?;
    _month = snapshotData['month'] as String?;
    _username = snapshotData['username'] as String?;
    _barangay = snapshotData['barangay'] as String?;
    _ecoPoints = castToType<double>(snapshotData['eco_points']);
    _displayPhoto = snapshotData['display_photo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('top_recycler_of_the_month');

  static Stream<TopRecyclerOfTheMonthRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => TopRecyclerOfTheMonthRecord.fromSnapshot(s));

  static Future<TopRecyclerOfTheMonthRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => TopRecyclerOfTheMonthRecord.fromSnapshot(s));

  static TopRecyclerOfTheMonthRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopRecyclerOfTheMonthRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopRecyclerOfTheMonthRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopRecyclerOfTheMonthRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopRecyclerOfTheMonthRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopRecyclerOfTheMonthRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopRecyclerOfTheMonthRecordData({
  DateTime? createdTime,
  DocumentReference? recyclerReference,
  String? month,
  String? username,
  String? barangay,
  double? ecoPoints,
  String? displayPhoto,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'recycler_reference': recyclerReference,
      'month': month,
      'username': username,
      'barangay': barangay,
      'eco_points': ecoPoints,
      'display_photo': displayPhoto,
    }.withoutNulls,
  );

  return firestoreData;
}

class TopRecyclerOfTheMonthRecordDocumentEquality
    implements Equality<TopRecyclerOfTheMonthRecord> {
  const TopRecyclerOfTheMonthRecordDocumentEquality();

  @override
  bool equals(
      TopRecyclerOfTheMonthRecord? e1, TopRecyclerOfTheMonthRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.recyclerReference == e2?.recyclerReference &&
        e1?.month == e2?.month &&
        e1?.username == e2?.username &&
        e1?.barangay == e2?.barangay &&
        e1?.ecoPoints == e2?.ecoPoints &&
        e1?.displayPhoto == e2?.displayPhoto;
  }

  @override
  int hash(TopRecyclerOfTheMonthRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.recyclerReference,
        e?.month,
        e?.username,
        e?.barangay,
        e?.ecoPoints,
        e?.displayPhoto
      ]);

  @override
  bool isValidKey(Object? o) => o is TopRecyclerOfTheMonthRecord;
}
