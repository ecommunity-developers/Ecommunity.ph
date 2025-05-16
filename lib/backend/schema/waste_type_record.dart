import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WasteTypeRecord extends FirestoreRecord {
  WasteTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type_name" field.
  String? _typeName;
  String get typeName => _typeName ?? '';
  bool hasTypeName() => _typeName != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "created_by" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "color" field.
  Color? _color;
  Color? get color => _color;
  bool hasColor() => _color != null;

  void _initializeFields() {
    _typeName = snapshotData['type_name'] as String?;
    _details = snapshotData['details'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _createdBy = snapshotData['created_by'] as DocumentReference?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _color = getSchemaColor(snapshotData['color']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('waste_type');

  static Stream<WasteTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WasteTypeRecord.fromSnapshot(s));

  static Future<WasteTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WasteTypeRecord.fromSnapshot(s));

  static WasteTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WasteTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WasteTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WasteTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WasteTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WasteTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWasteTypeRecordData({
  String? typeName,
  String? details,
  DateTime? createdTime,
  DocumentReference? createdBy,
  bool? isDeleted,
  Color? color,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type_name': typeName,
      'details': details,
      'created_time': createdTime,
      'created_by': createdBy,
      'is_deleted': isDeleted,
      'color': color,
    }.withoutNulls,
  );

  return firestoreData;
}

class WasteTypeRecordDocumentEquality implements Equality<WasteTypeRecord> {
  const WasteTypeRecordDocumentEquality();

  @override
  bool equals(WasteTypeRecord? e1, WasteTypeRecord? e2) {
    return e1?.typeName == e2?.typeName &&
        e1?.details == e2?.details &&
        e1?.createdTime == e2?.createdTime &&
        e1?.createdBy == e2?.createdBy &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.color == e2?.color;
  }

  @override
  int hash(WasteTypeRecord? e) => const ListEquality().hash([
        e?.typeName,
        e?.details,
        e?.createdTime,
        e?.createdBy,
        e?.isDeleted,
        e?.color
      ]);

  @override
  bool isValidKey(Object? o) => o is WasteTypeRecord;
}
