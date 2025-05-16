import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StaffRecord extends FirestoreRecord {
  StaffRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "staff_user_ID" field.
  String? _staffUserID;
  String get staffUserID => _staffUserID ?? '';
  bool hasStaffUserID() => _staffUserID != null;

  // "isRemoved" field.
  bool? _isRemoved;
  bool get isRemoved => _isRemoved ?? false;
  bool hasIsRemoved() => _isRemoved != null;

  // "added_time" field.
  List<DateTime>? _addedTime;
  List<DateTime> get addedTime => _addedTime ?? const [];
  bool hasAddedTime() => _addedTime != null;

  // "removed_time" field.
  List<DateTime>? _removedTime;
  List<DateTime> get removedTime => _removedTime ?? const [];
  bool hasRemovedTime() => _removedTime != null;

  // "full_name" field.
  String? _fullName;
  String get fullName => _fullName ?? '';
  bool hasFullName() => _fullName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _staffUserID = snapshotData['staff_user_ID'] as String?;
    _isRemoved = snapshotData['isRemoved'] as bool?;
    _addedTime = getDataList(snapshotData['added_time']);
    _removedTime = getDataList(snapshotData['removed_time']);
    _fullName = snapshotData['full_name'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('staff')
          : FirebaseFirestore.instance.collectionGroup('staff');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('staff').doc(id);

  static Stream<StaffRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StaffRecord.fromSnapshot(s));

  static Future<StaffRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StaffRecord.fromSnapshot(s));

  static StaffRecord fromSnapshot(DocumentSnapshot snapshot) => StaffRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StaffRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StaffRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StaffRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StaffRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStaffRecordData({
  String? staffUserID,
  bool? isRemoved,
  String? fullName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'staff_user_ID': staffUserID,
      'isRemoved': isRemoved,
      'full_name': fullName,
    }.withoutNulls,
  );

  return firestoreData;
}

class StaffRecordDocumentEquality implements Equality<StaffRecord> {
  const StaffRecordDocumentEquality();

  @override
  bool equals(StaffRecord? e1, StaffRecord? e2) {
    const listEquality = ListEquality();
    return e1?.staffUserID == e2?.staffUserID &&
        e1?.isRemoved == e2?.isRemoved &&
        listEquality.equals(e1?.addedTime, e2?.addedTime) &&
        listEquality.equals(e1?.removedTime, e2?.removedTime) &&
        e1?.fullName == e2?.fullName;
  }

  @override
  int hash(StaffRecord? e) => const ListEquality().hash([
        e?.staffUserID,
        e?.isRemoved,
        e?.addedTime,
        e?.removedTime,
        e?.fullName
      ]);

  @override
  bool isValidKey(Object? o) => o is StaffRecord;
}
