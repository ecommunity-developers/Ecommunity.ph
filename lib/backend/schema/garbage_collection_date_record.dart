import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GarbageCollectionDateRecord extends FirestoreRecord {
  GarbageCollectionDateRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "day" field.
  List<String>? _day;
  List<String> get day => _day ?? const [];
  bool hasDay() => _day != null;

  void _initializeFields() {
    _barangay = snapshotData['barangay'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _day = getDataList(snapshotData['day']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('garbage_collection_date');

  static Stream<GarbageCollectionDateRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => GarbageCollectionDateRecord.fromSnapshot(s));

  static Future<GarbageCollectionDateRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => GarbageCollectionDateRecord.fromSnapshot(s));

  static GarbageCollectionDateRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GarbageCollectionDateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GarbageCollectionDateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GarbageCollectionDateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GarbageCollectionDateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GarbageCollectionDateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGarbageCollectionDateRecordData({
  String? barangay,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangay': barangay,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class GarbageCollectionDateRecordDocumentEquality
    implements Equality<GarbageCollectionDateRecord> {
  const GarbageCollectionDateRecordDocumentEquality();

  @override
  bool equals(
      GarbageCollectionDateRecord? e1, GarbageCollectionDateRecord? e2) {
    const listEquality = ListEquality();
    return e1?.barangay == e2?.barangay &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.day, e2?.day);
  }

  @override
  int hash(GarbageCollectionDateRecord? e) =>
      const ListEquality().hash([e?.barangay, e?.createdTime, e?.day]);

  @override
  bool isValidKey(Object? o) => o is GarbageCollectionDateRecord;
}
