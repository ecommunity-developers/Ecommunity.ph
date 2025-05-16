import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "user_type_of_receiver" field.
  String? _userTypeOfReceiver;
  String get userTypeOfReceiver => _userTypeOfReceiver ?? '';
  bool hasUserTypeOfReceiver() => _userTypeOfReceiver != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _image = snapshotData['image'] as String?;
    _message = snapshotData['message'] as String?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _userTypeOfReceiver = snapshotData['user_type_of_receiver'] as String?;
    _seen = snapshotData['seen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? createdTime,
  String? image,
  String? message,
  DocumentReference? receiver,
  String? userTypeOfReceiver,
  bool? seen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'image': image,
      'message': message,
      'receiver': receiver,
      'user_type_of_receiver': userTypeOfReceiver,
      'seen': seen,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.image == e2?.image &&
        e1?.message == e2?.message &&
        e1?.receiver == e2?.receiver &&
        e1?.userTypeOfReceiver == e2?.userTypeOfReceiver &&
        e1?.seen == e2?.seen;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.image,
        e?.message,
        e?.receiver,
        e?.userTypeOfReceiver,
        e?.seen
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
