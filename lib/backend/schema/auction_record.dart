import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuctionRecord extends FirestoreRecord {
  AuctionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "items" field.
  List<AuctionItemsStruct>? _items;
  List<AuctionItemsStruct> get items => _items ?? const [];
  bool hasItems() => _items != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "starting_bid" field.
  double? _startingBid;
  double get startingBid => _startingBid ?? 0.0;
  bool hasStartingBid() => _startingBid != null;

  // "min_increment" field.
  double? _minIncrement;
  double get minIncrement => _minIncrement ?? 0.0;
  bool hasMinIncrement() => _minIncrement != null;

  // "payment_mode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "auction_end_date" field.
  DateTime? _auctionEndDate;
  DateTime? get auctionEndDate => _auctionEndDate;
  bool hasAuctionEndDate() => _auctionEndDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "bids" field.
  List<BidsDetailsStruct>? _bids;
  List<BidsDetailsStruct> get bids => _bids ?? const [];
  bool hasBids() => _bids != null;

  // "uploader" field.
  UserStruct? _uploader;
  UserStruct get uploader => _uploader ?? UserStruct();
  bool hasUploader() => _uploader != null;

  // "payment_date" field.
  DateTime? _paymentDate;
  DateTime? get paymentDate => _paymentDate;
  bool hasPaymentDate() => _paymentDate != null;

  // "payment_ref_num" field.
  String? _paymentRefNum;
  String get paymentRefNum => _paymentRefNum ?? '';
  bool hasPaymentRefNum() => _paymentRefNum != null;

  // "payment_img_receipt" field.
  String? _paymentImgReceipt;
  String get paymentImgReceipt => _paymentImgReceipt ?? '';
  bool hasPaymentImgReceipt() => _paymentImgReceipt != null;

  // "accpeted_date" field.
  DateTime? _accpetedDate;
  DateTime? get accpetedDate => _accpetedDate;
  bool hasAccpetedDate() => _accpetedDate != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _images = getDataList(snapshotData['images']);
    _items = getStructList(
      snapshotData['items'],
      AuctionItemsStruct.fromMap,
    );
    _notes = snapshotData['notes'] as String?;
    _startingBid = castToType<double>(snapshotData['starting_bid']);
    _minIncrement = castToType<double>(snapshotData['min_increment']);
    _paymentMode = snapshotData['payment_mode'] as String?;
    _auctionEndDate = snapshotData['auction_end_date'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _bids = getStructList(
      snapshotData['bids'],
      BidsDetailsStruct.fromMap,
    );
    _uploader = snapshotData['uploader'] is UserStruct
        ? snapshotData['uploader']
        : UserStruct.maybeFromMap(snapshotData['uploader']);
    _paymentDate = snapshotData['payment_date'] as DateTime?;
    _paymentRefNum = snapshotData['payment_ref_num'] as String?;
    _paymentImgReceipt = snapshotData['payment_img_receipt'] as String?;
    _accpetedDate = snapshotData['accpeted_date'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('auction');

  static Stream<AuctionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AuctionRecord.fromSnapshot(s));

  static Future<AuctionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AuctionRecord.fromSnapshot(s));

  static AuctionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AuctionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AuctionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AuctionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AuctionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AuctionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAuctionRecordData({
  DateTime? createdTime,
  String? address,
  String? notes,
  double? startingBid,
  double? minIncrement,
  String? paymentMode,
  DateTime? auctionEndDate,
  String? status,
  UserStruct? uploader,
  DateTime? paymentDate,
  String? paymentRefNum,
  String? paymentImgReceipt,
  DateTime? accpetedDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'address': address,
      'notes': notes,
      'starting_bid': startingBid,
      'min_increment': minIncrement,
      'payment_mode': paymentMode,
      'auction_end_date': auctionEndDate,
      'status': status,
      'uploader': UserStruct().toMap(),
      'payment_date': paymentDate,
      'payment_ref_num': paymentRefNum,
      'payment_img_receipt': paymentImgReceipt,
      'accpeted_date': accpetedDate,
    }.withoutNulls,
  );

  // Handle nested data for "uploader" field.
  addUserStructData(firestoreData, uploader, 'uploader');

  return firestoreData;
}

class AuctionRecordDocumentEquality implements Equality<AuctionRecord> {
  const AuctionRecordDocumentEquality();

  @override
  bool equals(AuctionRecord? e1, AuctionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.address == e2?.address &&
        listEquality.equals(e1?.images, e2?.images) &&
        listEquality.equals(e1?.items, e2?.items) &&
        e1?.notes == e2?.notes &&
        e1?.startingBid == e2?.startingBid &&
        e1?.minIncrement == e2?.minIncrement &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.auctionEndDate == e2?.auctionEndDate &&
        e1?.status == e2?.status &&
        listEquality.equals(e1?.bids, e2?.bids) &&
        e1?.uploader == e2?.uploader &&
        e1?.paymentDate == e2?.paymentDate &&
        e1?.paymentRefNum == e2?.paymentRefNum &&
        e1?.paymentImgReceipt == e2?.paymentImgReceipt &&
        e1?.accpetedDate == e2?.accpetedDate;
  }

  @override
  int hash(AuctionRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.address,
        e?.images,
        e?.items,
        e?.notes,
        e?.startingBid,
        e?.minIncrement,
        e?.paymentMode,
        e?.auctionEndDate,
        e?.status,
        e?.bids,
        e?.uploader,
        e?.paymentDate,
        e?.paymentRefNum,
        e?.paymentImgReceipt,
        e?.accpetedDate
      ]);

  @override
  bool isValidKey(Object? o) => o is AuctionRecord;
}
