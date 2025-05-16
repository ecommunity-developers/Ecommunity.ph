import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialCollectionRecord extends FirestoreRecord {
  SpecialCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "time_start" field.
  DateTime? _timeStart;
  DateTime? get timeStart => _timeStart;
  bool hasTimeStart() => _timeStart != null;

  // "time_end" field.
  DateTime? _timeEnd;
  DateTime? get timeEnd => _timeEnd;
  bool hasTimeEnd() => _timeEnd != null;

  // "waste_type" field.
  String? _wasteType;
  String get wasteType => _wasteType ?? '';
  bool hasWasteType() => _wasteType != null;

  // "truck_driver" field.
  String? _truckDriver;
  String get truckDriver => _truckDriver ?? '';
  bool hasTruckDriver() => _truckDriver != null;

  // "collectors" field.
  List<String>? _collectors;
  List<String> get collectors => _collectors ?? const [];
  bool hasCollectors() => _collectors != null;

  // "truck" field.
  String? _truck;
  String get truck => _truck ?? '';
  bool hasTruck() => _truck != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "added_by" field.
  String? _addedBy;
  String get addedBy => _addedBy ?? '';
  bool hasAddedBy() => _addedBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _timeStart = snapshotData['time_start'] as DateTime?;
    _timeEnd = snapshotData['time_end'] as DateTime?;
    _wasteType = snapshotData['waste_type'] as String?;
    _truckDriver = snapshotData['truck_driver'] as String?;
    _collectors = getDataList(snapshotData['collectors']);
    _truck = snapshotData['truck'] as String?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _day = snapshotData['day'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _barangay = snapshotData['barangay'] as String?;
    _addedBy = snapshotData['added_by'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('special_collection')
          : FirebaseFirestore.instance.collectionGroup('special_collection');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('special_collection').doc(id);

  static Stream<SpecialCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpecialCollectionRecord.fromSnapshot(s));

  static Future<SpecialCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SpecialCollectionRecord.fromSnapshot(s));

  static SpecialCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpecialCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpecialCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpecialCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpecialCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpecialCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpecialCollectionRecordData({
  DateTime? timeStart,
  DateTime? timeEnd,
  String? wasteType,
  String? truckDriver,
  String? truck,
  DateTime? timeCreated,
  String? day,
  DateTime? date,
  String? barangay,
  String? addedBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'time_start': timeStart,
      'time_end': timeEnd,
      'waste_type': wasteType,
      'truck_driver': truckDriver,
      'truck': truck,
      'time_created': timeCreated,
      'day': day,
      'date': date,
      'barangay': barangay,
      'added_by': addedBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpecialCollectionRecordDocumentEquality
    implements Equality<SpecialCollectionRecord> {
  const SpecialCollectionRecordDocumentEquality();

  @override
  bool equals(SpecialCollectionRecord? e1, SpecialCollectionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStart == e2?.timeStart &&
        e1?.timeEnd == e2?.timeEnd &&
        e1?.wasteType == e2?.wasteType &&
        e1?.truckDriver == e2?.truckDriver &&
        listEquality.equals(e1?.collectors, e2?.collectors) &&
        e1?.truck == e2?.truck &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.day == e2?.day &&
        e1?.date == e2?.date &&
        e1?.barangay == e2?.barangay &&
        e1?.addedBy == e2?.addedBy;
  }

  @override
  int hash(SpecialCollectionRecord? e) => const ListEquality().hash([
        e?.timeStart,
        e?.timeEnd,
        e?.wasteType,
        e?.truckDriver,
        e?.collectors,
        e?.truck,
        e?.timeCreated,
        e?.day,
        e?.date,
        e?.barangay,
        e?.addedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is SpecialCollectionRecord;
}
