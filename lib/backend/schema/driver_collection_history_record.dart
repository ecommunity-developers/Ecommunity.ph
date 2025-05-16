import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverCollectionHistoryRecord extends FirestoreRecord {
  DriverCollectionHistoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "driver_ID" field.
  DocumentReference? _driverID;
  DocumentReference? get driverID => _driverID;
  bool hasDriverID() => _driverID != null;

  // "collection_status" field.
  String? _collectionStatus;
  String get collectionStatus => _collectionStatus ?? '';
  bool hasCollectionStatus() => _collectionStatus != null;

  // "collection_date" field.
  DateTime? _collectionDate;
  DateTime? get collectionDate => _collectionDate;
  bool hasCollectionDate() => _collectionDate != null;

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

  // "collection_type" field.
  String? _collectionType;
  String get collectionType => _collectionType ?? '';
  bool hasCollectionType() => _collectionType != null;

  // "actual_time_started" field.
  DateTime? _actualTimeStarted;
  DateTime? get actualTimeStarted => _actualTimeStarted;
  bool hasActualTimeStarted() => _actualTimeStarted != null;

  // "actual_time_ended" field.
  DateTime? _actualTimeEnded;
  DateTime? get actualTimeEnded => _actualTimeEnded;
  bool hasActualTimeEnded() => _actualTimeEnded != null;

  // "reason" field.
  String? _reason;
  String get reason => _reason ?? '';
  bool hasReason() => _reason != null;

  // "truck_plate_num" field.
  String? _truckPlateNum;
  String get truckPlateNum => _truckPlateNum ?? '';
  bool hasTruckPlateNum() => _truckPlateNum != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "collectors" field.
  List<String>? _collectors;
  List<String> get collectors => _collectors ?? const [];
  bool hasCollectors() => _collectors != null;

  void _initializeFields() {
    _driverID = snapshotData['driver_ID'] as DocumentReference?;
    _collectionStatus = snapshotData['collection_status'] as String?;
    _collectionDate = snapshotData['collection_date'] as DateTime?;
    _timeStart = snapshotData['time_start'] as DateTime?;
    _timeEnd = snapshotData['time_end'] as DateTime?;
    _wasteType = snapshotData['waste_type'] as String?;
    _collectionType = snapshotData['collection_type'] as String?;
    _actualTimeStarted = snapshotData['actual_time_started'] as DateTime?;
    _actualTimeEnded = snapshotData['actual_time_ended'] as DateTime?;
    _reason = snapshotData['reason'] as String?;
    _truckPlateNum = snapshotData['truck_plate_num'] as String?;
    _barangay = snapshotData['barangay'] as String?;
    _collectors = getDataList(snapshotData['collectors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('driver_collection_history');

  static Stream<DriverCollectionHistoryRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => DriverCollectionHistoryRecord.fromSnapshot(s));

  static Future<DriverCollectionHistoryRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => DriverCollectionHistoryRecord.fromSnapshot(s));

  static DriverCollectionHistoryRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      DriverCollectionHistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverCollectionHistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverCollectionHistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverCollectionHistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverCollectionHistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverCollectionHistoryRecordData({
  DocumentReference? driverID,
  String? collectionStatus,
  DateTime? collectionDate,
  DateTime? timeStart,
  DateTime? timeEnd,
  String? wasteType,
  String? collectionType,
  DateTime? actualTimeStarted,
  DateTime? actualTimeEnded,
  String? reason,
  String? truckPlateNum,
  String? barangay,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'driver_ID': driverID,
      'collection_status': collectionStatus,
      'collection_date': collectionDate,
      'time_start': timeStart,
      'time_end': timeEnd,
      'waste_type': wasteType,
      'collection_type': collectionType,
      'actual_time_started': actualTimeStarted,
      'actual_time_ended': actualTimeEnded,
      'reason': reason,
      'truck_plate_num': truckPlateNum,
      'barangay': barangay,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverCollectionHistoryRecordDocumentEquality
    implements Equality<DriverCollectionHistoryRecord> {
  const DriverCollectionHistoryRecordDocumentEquality();

  @override
  bool equals(
      DriverCollectionHistoryRecord? e1, DriverCollectionHistoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.driverID == e2?.driverID &&
        e1?.collectionStatus == e2?.collectionStatus &&
        e1?.collectionDate == e2?.collectionDate &&
        e1?.timeStart == e2?.timeStart &&
        e1?.timeEnd == e2?.timeEnd &&
        e1?.wasteType == e2?.wasteType &&
        e1?.collectionType == e2?.collectionType &&
        e1?.actualTimeStarted == e2?.actualTimeStarted &&
        e1?.actualTimeEnded == e2?.actualTimeEnded &&
        e1?.reason == e2?.reason &&
        e1?.truckPlateNum == e2?.truckPlateNum &&
        e1?.barangay == e2?.barangay &&
        listEquality.equals(e1?.collectors, e2?.collectors);
  }

  @override
  int hash(DriverCollectionHistoryRecord? e) => const ListEquality().hash([
        e?.driverID,
        e?.collectionStatus,
        e?.collectionDate,
        e?.timeStart,
        e?.timeEnd,
        e?.wasteType,
        e?.collectionType,
        e?.actualTimeStarted,
        e?.actualTimeEnded,
        e?.reason,
        e?.truckPlateNum,
        e?.barangay,
        e?.collectors
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverCollectionHistoryRecord;
}
