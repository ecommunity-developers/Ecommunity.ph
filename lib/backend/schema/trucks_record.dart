import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TrucksRecord extends FirestoreRecord {
  TrucksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "plate_number" field.
  String? _plateNumber;
  String get plateNumber => _plateNumber ?? '';
  bool hasPlateNumber() => _plateNumber != null;

  // "chasis_number" field.
  String? _chasisNumber;
  String get chasisNumber => _chasisNumber ?? '';
  bool hasChasisNumber() => _chasisNumber != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "brand" field.
  String? _brand;
  String get brand => _brand ?? '';
  bool hasBrand() => _brand != null;

  // "fuel" field.
  String? _fuel;
  String get fuel => _fuel ?? '';
  bool hasFuel() => _fuel != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "created_by" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  void _initializeFields() {
    _plateNumber = snapshotData['plate_number'] as String?;
    _chasisNumber = snapshotData['chasis_number'] as String?;
    _color = snapshotData['color'] as String?;
    _brand = snapshotData['brand'] as String?;
    _fuel = snapshotData['fuel'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _createdBy = snapshotData['created_by'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _type = snapshotData['type'] as String?;
    _barangay = snapshotData['barangay'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('trucks');

  static Stream<TrucksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TrucksRecord.fromSnapshot(s));

  static Future<TrucksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TrucksRecord.fromSnapshot(s));

  static TrucksRecord fromSnapshot(DocumentSnapshot snapshot) => TrucksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TrucksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TrucksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TrucksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TrucksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTrucksRecordData({
  String? plateNumber,
  String? chasisNumber,
  String? color,
  String? brand,
  String? fuel,
  DateTime? createdTime,
  String? createdBy,
  bool? isActive,
  String? type,
  String? barangay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'plate_number': plateNumber,
      'chasis_number': chasisNumber,
      'color': color,
      'brand': brand,
      'fuel': fuel,
      'created_time': createdTime,
      'created_by': createdBy,
      'isActive': isActive,
      'type': type,
      'barangay': barangay,
    }.withoutNulls,
  );

  return firestoreData;
}

class TrucksRecordDocumentEquality implements Equality<TrucksRecord> {
  const TrucksRecordDocumentEquality();

  @override
  bool equals(TrucksRecord? e1, TrucksRecord? e2) {
    return e1?.plateNumber == e2?.plateNumber &&
        e1?.chasisNumber == e2?.chasisNumber &&
        e1?.color == e2?.color &&
        e1?.brand == e2?.brand &&
        e1?.fuel == e2?.fuel &&
        e1?.createdTime == e2?.createdTime &&
        e1?.createdBy == e2?.createdBy &&
        e1?.isActive == e2?.isActive &&
        e1?.type == e2?.type &&
        e1?.barangay == e2?.barangay;
  }

  @override
  int hash(TrucksRecord? e) => const ListEquality().hash([
        e?.plateNumber,
        e?.chasisNumber,
        e?.color,
        e?.brand,
        e?.fuel,
        e?.createdTime,
        e?.createdBy,
        e?.isActive,
        e?.type,
        e?.barangay
      ]);

  @override
  bool isValidKey(Object? o) => o is TrucksRecord;
}
