import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LikesRecord extends FirestoreRecord {
  LikesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "liked_by" field.
  DocumentReference? _likedBy;
  DocumentReference? get likedBy => _likedBy;
  bool hasLikedBy() => _likedBy != null;

  // "time_liked" field.
  DateTime? _timeLiked;
  DateTime? get timeLiked => _timeLiked;
  bool hasTimeLiked() => _timeLiked != null;

  // "post_reference" field.
  DocumentReference? _postReference;
  DocumentReference? get postReference => _postReference;
  bool hasPostReference() => _postReference != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _likedBy = snapshotData['liked_by'] as DocumentReference?;
    _timeLiked = snapshotData['time_liked'] as DateTime?;
    _postReference = snapshotData['post_reference'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('likes')
          : FirebaseFirestore.instance.collectionGroup('likes');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('likes').doc(id);

  static Stream<LikesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LikesRecord.fromSnapshot(s));

  static Future<LikesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LikesRecord.fromSnapshot(s));

  static LikesRecord fromSnapshot(DocumentSnapshot snapshot) => LikesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LikesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LikesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LikesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LikesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLikesRecordData({
  DocumentReference? likedBy,
  DateTime? timeLiked,
  DocumentReference? postReference,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'liked_by': likedBy,
      'time_liked': timeLiked,
      'post_reference': postReference,
    }.withoutNulls,
  );

  return firestoreData;
}

class LikesRecordDocumentEquality implements Equality<LikesRecord> {
  const LikesRecordDocumentEquality();

  @override
  bool equals(LikesRecord? e1, LikesRecord? e2) {
    return e1?.likedBy == e2?.likedBy &&
        e1?.timeLiked == e2?.timeLiked &&
        e1?.postReference == e2?.postReference;
  }

  @override
  int hash(LikesRecord? e) =>
      const ListEquality().hash([e?.likedBy, e?.timeLiked, e?.postReference]);

  @override
  bool isValidKey(Object? o) => o is LikesRecord;
}
