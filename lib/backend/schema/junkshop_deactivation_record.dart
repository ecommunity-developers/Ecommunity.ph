import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JunkshopDeactivationRecord extends FirestoreRecord {
  JunkshopDeactivationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

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
    _deletedBy = snapshotData['deletedBy'] as String?;
    _timeDeleted = snapshotData['timeDeleted'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('junkshop_deactivation')
          : FirebaseFirestore.instance.collectionGroup('junkshop_deactivation');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('junkshop_deactivation').doc(id);

  static Stream<JunkshopDeactivationRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => JunkshopDeactivationRecord.fromSnapshot(s));

  static Future<JunkshopDeactivationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => JunkshopDeactivationRecord.fromSnapshot(s));

  static JunkshopDeactivationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JunkshopDeactivationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JunkshopDeactivationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JunkshopDeactivationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JunkshopDeactivationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JunkshopDeactivationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJunkshopDeactivationRecordData({
  String? deletedBy,
  DateTime? timeDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'deletedBy': deletedBy,
      'timeDeleted': timeDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class JunkshopDeactivationRecordDocumentEquality
    implements Equality<JunkshopDeactivationRecord> {
  const JunkshopDeactivationRecordDocumentEquality();

  @override
  bool equals(JunkshopDeactivationRecord? e1, JunkshopDeactivationRecord? e2) {
    return e1?.deletedBy == e2?.deletedBy && e1?.timeDeleted == e2?.timeDeleted;
  }

  @override
  int hash(JunkshopDeactivationRecord? e) =>
      const ListEquality().hash([e?.deletedBy, e?.timeDeleted]);

  @override
  bool isValidKey(Object? o) => o is JunkshopDeactivationRecord;
}
