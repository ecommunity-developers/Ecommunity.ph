import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IncidentReportsRecord extends FirestoreRecord {
  IncidentReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "concern" field.
  String? _concern;
  String get concern => _concern ?? '';
  bool hasConcern() => _concern != null;

  // "sender_location" field.
  String? _senderLocation;
  String get senderLocation => _senderLocation ?? '';
  bool hasSenderLocation() => _senderLocation != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "updated_by" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  bool hasUpdatedBy() => _updatedBy != null;

  // "updated_on" field.
  DateTime? _updatedOn;
  DateTime? get updatedOn => _updatedOn;
  bool hasUpdatedOn() => _updatedOn != null;

  // "actions_taken" field.
  String? _actionsTaken;
  String get actionsTaken => _actionsTaken ?? '';
  bool hasActionsTaken() => _actionsTaken != null;

  // "sender_name" field.
  String? _senderName;
  String get senderName => _senderName ?? '';
  bool hasSenderName() => _senderName != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _concern = snapshotData['concern'] as String?;
    _senderLocation = snapshotData['sender_location'] as String?;
    _message = snapshotData['message'] as String?;
    _images = getDataList(snapshotData['images']);
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _updatedBy = snapshotData['updated_by'] as String?;
    _updatedOn = snapshotData['updated_on'] as DateTime?;
    _actionsTaken = snapshotData['actions_taken'] as String?;
    _senderName = snapshotData['sender_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('incident_reports');

  static Stream<IncidentReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IncidentReportsRecord.fromSnapshot(s));

  static Future<IncidentReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IncidentReportsRecord.fromSnapshot(s));

  static IncidentReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IncidentReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IncidentReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IncidentReportsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IncidentReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IncidentReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIncidentReportsRecordData({
  DateTime? createdTime,
  String? concern,
  String? senderLocation,
  String? message,
  DocumentReference? senderRef,
  String? status,
  String? updatedBy,
  DateTime? updatedOn,
  String? actionsTaken,
  String? senderName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'concern': concern,
      'sender_location': senderLocation,
      'message': message,
      'sender_ref': senderRef,
      'status': status,
      'updated_by': updatedBy,
      'updated_on': updatedOn,
      'actions_taken': actionsTaken,
      'sender_name': senderName,
    }.withoutNulls,
  );

  return firestoreData;
}

class IncidentReportsRecordDocumentEquality
    implements Equality<IncidentReportsRecord> {
  const IncidentReportsRecordDocumentEquality();

  @override
  bool equals(IncidentReportsRecord? e1, IncidentReportsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.concern == e2?.concern &&
        e1?.senderLocation == e2?.senderLocation &&
        e1?.message == e2?.message &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.senderRef == e2?.senderRef &&
        e1?.status == e2?.status &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updatedOn == e2?.updatedOn &&
        e1?.actionsTaken == e2?.actionsTaken &&
        e1?.senderName == e2?.senderName;
  }

  @override
  int hash(IncidentReportsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.concern,
        e?.senderLocation,
        e?.message,
        e?.images,
        e?.senderRef,
        e?.status,
        e?.updatedBy,
        e?.updatedOn,
        e?.actionsTaken,
        e?.senderName
      ]);

  @override
  bool isValidKey(Object? o) => o is IncidentReportsRecord;
}
