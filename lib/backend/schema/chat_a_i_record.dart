import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatAIRecord extends FirestoreRecord {
  ChatAIRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "isAI" field.
  bool? _isAI;
  bool get isAI => _isAI ?? false;
  bool hasIsAI() => _isAI != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _isAI = snapshotData['isAI'] as bool?;
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatAI');

  static Stream<ChatAIRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatAIRecord.fromSnapshot(s));

  static Future<ChatAIRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatAIRecord.fromSnapshot(s));

  static ChatAIRecord fromSnapshot(DocumentSnapshot snapshot) => ChatAIRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatAIRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatAIRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatAIRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatAIRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatAIRecordData({
  DateTime? createdTime,
  String? message,
  DocumentReference? sender,
  bool? isAI,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'message': message,
      'sender': sender,
      'isAI': isAI,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatAIRecordDocumentEquality implements Equality<ChatAIRecord> {
  const ChatAIRecordDocumentEquality();

  @override
  bool equals(ChatAIRecord? e1, ChatAIRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.message == e2?.message &&
        e1?.sender == e2?.sender &&
        e1?.isAI == e2?.isAI &&
        e1?.image == e2?.image;
  }

  @override
  int hash(ChatAIRecord? e) => const ListEquality()
      .hash([e?.createdTime, e?.message, e?.sender, e?.isAI, e?.image]);

  @override
  bool isValidKey(Object? o) => o is ChatAIRecord;
}
