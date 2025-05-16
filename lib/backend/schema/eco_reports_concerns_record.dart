import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EcoReportsConcernsRecord extends FirestoreRecord {
  EcoReportsConcernsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "type_of_concern" field.
  String? _typeOfConcern;
  String get typeOfConcern => _typeOfConcern ?? '';
  bool hasTypeOfConcern() => _typeOfConcern != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _typeOfConcern = snapshotData['type_of_concern'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('eco_reports_concerns');

  static Stream<EcoReportsConcernsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EcoReportsConcernsRecord.fromSnapshot(s));

  static Future<EcoReportsConcernsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => EcoReportsConcernsRecord.fromSnapshot(s));

  static EcoReportsConcernsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EcoReportsConcernsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EcoReportsConcernsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EcoReportsConcernsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EcoReportsConcernsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EcoReportsConcernsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEcoReportsConcernsRecordData({
  DateTime? createdTime,
  String? typeOfConcern,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'type_of_concern': typeOfConcern,
    }.withoutNulls,
  );

  return firestoreData;
}

class EcoReportsConcernsRecordDocumentEquality
    implements Equality<EcoReportsConcernsRecord> {
  const EcoReportsConcernsRecordDocumentEquality();

  @override
  bool equals(EcoReportsConcernsRecord? e1, EcoReportsConcernsRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.typeOfConcern == e2?.typeOfConcern;
  }

  @override
  int hash(EcoReportsConcernsRecord? e) =>
      const ListEquality().hash([e?.createdTime, e?.typeOfConcern]);

  @override
  bool isValidKey(Object? o) => o is EcoReportsConcernsRecord;
}
