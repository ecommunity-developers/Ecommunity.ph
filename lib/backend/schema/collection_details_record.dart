import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CollectionDetailsRecord extends FirestoreRecord {
  CollectionDetailsRecord._(
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

  // "added_by" field.
  String? _addedBy;
  String get addedBy => _addedBy ?? '';
  bool hasAddedBy() => _addedBy != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

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
    _addedBy = snapshotData['added_by'] as String?;
    _barangay = snapshotData['barangay'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('collection_details')
          : FirebaseFirestore.instance.collectionGroup('collection_details');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('collection_details').doc(id);

  static Stream<CollectionDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CollectionDetailsRecord.fromSnapshot(s));

  static Future<CollectionDetailsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CollectionDetailsRecord.fromSnapshot(s));

  static CollectionDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CollectionDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CollectionDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CollectionDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CollectionDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CollectionDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCollectionDetailsRecordData({
  DateTime? timeStart,
  DateTime? timeEnd,
  String? wasteType,
  String? truckDriver,
  String? truck,
  DateTime? timeCreated,
  String? day,
  String? addedBy,
  String? barangay,
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
      'added_by': addedBy,
      'barangay': barangay,
    }.withoutNulls,
  );

  return firestoreData;
}

class CollectionDetailsRecordDocumentEquality
    implements Equality<CollectionDetailsRecord> {
  const CollectionDetailsRecordDocumentEquality();

  @override
  bool equals(CollectionDetailsRecord? e1, CollectionDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.timeStart == e2?.timeStart &&
        e1?.timeEnd == e2?.timeEnd &&
        e1?.wasteType == e2?.wasteType &&
        e1?.truckDriver == e2?.truckDriver &&
        listEquality.equals(e1?.collectors, e2?.collectors) &&
        e1?.truck == e2?.truck &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.day == e2?.day &&
        e1?.addedBy == e2?.addedBy &&
        e1?.barangay == e2?.barangay;
  }

  @override
  int hash(CollectionDetailsRecord? e) => const ListEquality().hash([
        e?.timeStart,
        e?.timeEnd,
        e?.wasteType,
        e?.truckDriver,
        e?.collectors,
        e?.truck,
        e?.timeCreated,
        e?.day,
        e?.addedBy,
        e?.barangay
      ]);

  @override
  bool isValidKey(Object? o) => o is CollectionDetailsRecord;
}
