import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InactiveTruckRecord extends FirestoreRecord {
  InactiveTruckRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "archived_time" field.
  DateTime? _archivedTime;
  DateTime? get archivedTime => _archivedTime;
  bool hasArchivedTime() => _archivedTime != null;

  // "archived_by" field.
  String? _archivedBy;
  String get archivedBy => _archivedBy ?? '';
  bool hasArchivedBy() => _archivedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _archivedTime = snapshotData['archived_time'] as DateTime?;
    _archivedBy = snapshotData['archived_by'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('inactive_truck')
          : FirebaseFirestore.instance.collectionGroup('inactive_truck');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('inactive_truck').doc(id);

  static Stream<InactiveTruckRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InactiveTruckRecord.fromSnapshot(s));

  static Future<InactiveTruckRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InactiveTruckRecord.fromSnapshot(s));

  static InactiveTruckRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InactiveTruckRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InactiveTruckRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InactiveTruckRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InactiveTruckRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InactiveTruckRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInactiveTruckRecordData({
  DateTime? archivedTime,
  String? archivedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'archived_time': archivedTime,
      'archived_by': archivedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class InactiveTruckRecordDocumentEquality
    implements Equality<InactiveTruckRecord> {
  const InactiveTruckRecordDocumentEquality();

  @override
  bool equals(InactiveTruckRecord? e1, InactiveTruckRecord? e2) {
    return e1?.archivedTime == e2?.archivedTime &&
        e1?.archivedBy == e2?.archivedBy;
  }

  @override
  int hash(InactiveTruckRecord? e) =>
      const ListEquality().hash([e?.archivedTime, e?.archivedBy]);

  @override
  bool isValidKey(Object? o) => o is InactiveTruckRecord;
}
