import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BlogspotRecord extends FirestoreRecord {
  BlogspotRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_posted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  bool hasDatePosted() => _datePosted != null;

  // "title_of_the_post" field.
  String? _titleOfThePost;
  String get titleOfThePost => _titleOfThePost ?? '';
  bool hasTitleOfThePost() => _titleOfThePost != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "isLiked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  bool hasIsLiked() => _isLiked != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "posted_by" field.
  String? _postedBy;
  String get postedBy => _postedBy ?? '';
  bool hasPostedBy() => _postedBy != null;

  // "isArchived" field.
  bool? _isArchived;
  bool get isArchived => _isArchived ?? false;
  bool hasIsArchived() => _isArchived != null;

  // "date_archived" field.
  DateTime? _dateArchived;
  DateTime? get dateArchived => _dateArchived;
  bool hasDateArchived() => _dateArchived != null;

  // "archived_by" field.
  String? _archivedBy;
  String get archivedBy => _archivedBy ?? '';
  bool hasArchivedBy() => _archivedBy != null;

  // "date_deleted" field.
  DateTime? _dateDeleted;
  DateTime? get dateDeleted => _dateDeleted;
  bool hasDateDeleted() => _dateDeleted != null;

  // "deleted_by" field.
  String? _deletedBy;
  String get deletedBy => _deletedBy ?? '';
  bool hasDeletedBy() => _deletedBy != null;

  // "permanentlyDeleteOn" field.
  DateTime? _permanentlyDeleteOn;
  DateTime? get permanentlyDeleteOn => _permanentlyDeleteOn;
  bool hasPermanentlyDeleteOn() => _permanentlyDeleteOn != null;

  void _initializeFields() {
    _datePosted = snapshotData['date_posted'] as DateTime?;
    _titleOfThePost = snapshotData['title_of_the_post'] as String?;
    _description = snapshotData['description'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isLiked = snapshotData['isLiked'] as bool?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _postedBy = snapshotData['posted_by'] as String?;
    _isArchived = snapshotData['isArchived'] as bool?;
    _dateArchived = snapshotData['date_archived'] as DateTime?;
    _archivedBy = snapshotData['archived_by'] as String?;
    _dateDeleted = snapshotData['date_deleted'] as DateTime?;
    _deletedBy = snapshotData['deleted_by'] as String?;
    _permanentlyDeleteOn = snapshotData['permanentlyDeleteOn'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('blogspot');

  static Stream<BlogspotRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BlogspotRecord.fromSnapshot(s));

  static Future<BlogspotRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BlogspotRecord.fromSnapshot(s));

  static BlogspotRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BlogspotRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BlogspotRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BlogspotRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BlogspotRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BlogspotRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBlogspotRecordData({
  DateTime? datePosted,
  String? titleOfThePost,
  String? description,
  String? photoUrl,
  bool? isLiked,
  bool? isDeleted,
  String? postedBy,
  bool? isArchived,
  DateTime? dateArchived,
  String? archivedBy,
  DateTime? dateDeleted,
  String? deletedBy,
  DateTime? permanentlyDeleteOn,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_posted': datePosted,
      'title_of_the_post': titleOfThePost,
      'description': description,
      'photo_url': photoUrl,
      'isLiked': isLiked,
      'isDeleted': isDeleted,
      'posted_by': postedBy,
      'isArchived': isArchived,
      'date_archived': dateArchived,
      'archived_by': archivedBy,
      'date_deleted': dateDeleted,
      'deleted_by': deletedBy,
      'permanentlyDeleteOn': permanentlyDeleteOn,
    }.withoutNulls,
  );

  return firestoreData;
}

class BlogspotRecordDocumentEquality implements Equality<BlogspotRecord> {
  const BlogspotRecordDocumentEquality();

  @override
  bool equals(BlogspotRecord? e1, BlogspotRecord? e2) {
    return e1?.datePosted == e2?.datePosted &&
        e1?.titleOfThePost == e2?.titleOfThePost &&
        e1?.description == e2?.description &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isLiked == e2?.isLiked &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.postedBy == e2?.postedBy &&
        e1?.isArchived == e2?.isArchived &&
        e1?.dateArchived == e2?.dateArchived &&
        e1?.archivedBy == e2?.archivedBy &&
        e1?.dateDeleted == e2?.dateDeleted &&
        e1?.deletedBy == e2?.deletedBy &&
        e1?.permanentlyDeleteOn == e2?.permanentlyDeleteOn;
  }

  @override
  int hash(BlogspotRecord? e) => const ListEquality().hash([
        e?.datePosted,
        e?.titleOfThePost,
        e?.description,
        e?.photoUrl,
        e?.isLiked,
        e?.isDeleted,
        e?.postedBy,
        e?.isArchived,
        e?.dateArchived,
        e?.archivedBy,
        e?.dateDeleted,
        e?.deletedBy,
        e?.permanentlyDeleteOn
      ]);

  @override
  bool isValidKey(Object? o) => o is BlogspotRecord;
}
