import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WasteKilogramRecord extends FirestoreRecord {
  WasteKilogramRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "kilogram_list" field.
  List<SegregatedWasteKilogramStruct>? _kilogramList;
  List<SegregatedWasteKilogramStruct> get kilogramList =>
      _kilogramList ?? const [];
  bool hasKilogramList() => _kilogramList != null;

  // "ecobin_num" field.
  String? _ecobinNum;
  String get ecobinNum => _ecobinNum ?? '';
  bool hasEcobinNum() => _ecobinNum != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  void _initializeFields() {
    _barangay = snapshotData['barangay'] as String?;
    _kilogramList = getStructList(
      snapshotData['kilogram_list'],
      SegregatedWasteKilogramStruct.fromMap,
    );
    _ecobinNum = snapshotData['ecobin_num'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('waste_kilogram');

  static Stream<WasteKilogramRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WasteKilogramRecord.fromSnapshot(s));

  static Future<WasteKilogramRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WasteKilogramRecord.fromSnapshot(s));

  static WasteKilogramRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WasteKilogramRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WasteKilogramRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WasteKilogramRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WasteKilogramRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WasteKilogramRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWasteKilogramRecordData({
  String? barangay,
  String? ecobinNum,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'barangay': barangay,
      'ecobin_num': ecobinNum,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class WasteKilogramRecordDocumentEquality
    implements Equality<WasteKilogramRecord> {
  const WasteKilogramRecordDocumentEquality();

  @override
  bool equals(WasteKilogramRecord? e1, WasteKilogramRecord? e2) {
    const listEquality = ListEquality();
    return e1?.barangay == e2?.barangay &&
        listEquality.equals(e1?.kilogramList, e2?.kilogramList) &&
        e1?.ecobinNum == e2?.ecobinNum &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(WasteKilogramRecord? e) => const ListEquality()
      .hash([e?.barangay, e?.kilogramList, e?.ecobinNum, e?.isActive]);

  @override
  bool isValidKey(Object? o) => o is WasteKilogramRecord;
}
