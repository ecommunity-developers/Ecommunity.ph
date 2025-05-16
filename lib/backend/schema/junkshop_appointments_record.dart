import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JunkshopAppointmentsRecord extends FirestoreRecord {
  JunkshopAppointmentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "collection_mode" field.
  String? _collectionMode;
  String get collectionMode => _collectionMode ?? '';
  bool hasCollectionMode() => _collectionMode != null;

  // "plastic_junks" field.
  List<String>? _plasticJunks;
  List<String> get plasticJunks => _plasticJunks ?? const [];
  bool hasPlasticJunks() => _plasticJunks != null;

  // "glass_junks" field.
  List<String>? _glassJunks;
  List<String> get glassJunks => _glassJunks ?? const [];
  bool hasGlassJunks() => _glassJunks != null;

  // "paper_junks" field.
  List<String>? _paperJunks;
  List<String> get paperJunks => _paperJunks ?? const [];
  bool hasPaperJunks() => _paperJunks != null;

  // "metal_junks" field.
  List<String>? _metalJunks;
  List<String> get metalJunks => _metalJunks ?? const [];
  bool hasMetalJunks() => _metalJunks != null;

  // "ewaste_junks" field.
  List<String>? _ewasteJunks;
  List<String> get ewasteJunks => _ewasteJunks ?? const [];
  bool hasEwasteJunks() => _ewasteJunks != null;

  // "other_junks" field.
  List<String>? _otherJunks;
  List<String> get otherJunks => _otherJunks ?? const [];
  bool hasOtherJunks() => _otherJunks != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "junk_IMG" field.
  String? _junkIMG;
  String get junkIMG => _junkIMG ?? '';
  bool hasJunkIMG() => _junkIMG != null;

  // "junkshop_owner" field.
  DocumentReference? _junkshopOwner;
  DocumentReference? get junkshopOwner => _junkshopOwner;
  bool hasJunkshopOwner() => _junkshopOwner != null;

  // "booker_ref" field.
  DocumentReference? _bookerRef;
  DocumentReference? get bookerRef => _bookerRef;
  bool hasBookerRef() => _bookerRef != null;

  // "time_of_meetup" field.
  DateTime? _timeOfMeetup;
  DateTime? get timeOfMeetup => _timeOfMeetup;
  bool hasTimeOfMeetup() => _timeOfMeetup != null;

  // "junkshop_name" field.
  String? _junkshopName;
  String get junkshopName => _junkshopName ?? '';
  bool hasJunkshopName() => _junkshopName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "junkshop_profile_pic" field.
  String? _junkshopProfilePic;
  String get junkshopProfilePic => _junkshopProfilePic ?? '';
  bool hasJunkshopProfilePic() => _junkshopProfilePic != null;

  // "service_charge" field.
  double? _serviceCharge;
  double get serviceCharge => _serviceCharge ?? 0.0;
  bool hasServiceCharge() => _serviceCharge != null;

  // "cancellation_remarks" field.
  String? _cancellationRemarks;
  String get cancellationRemarks => _cancellationRemarks ?? '';
  bool hasCancellationRemarks() => _cancellationRemarks != null;

  // "time_deleted" field.
  DateTime? _timeDeleted;
  DateTime? get timeDeleted => _timeDeleted;
  bool hasTimeDeleted() => _timeDeleted != null;

  // "pickup_address" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  bool hasPickupAddress() => _pickupAddress != null;

  // "client_full_name" field.
  String? _clientFullName;
  String get clientFullName => _clientFullName ?? '';
  bool hasClientFullName() => _clientFullName != null;

  // "collection_contact_num" field.
  String? _collectionContactNum;
  String get collectionContactNum => _collectionContactNum ?? '';
  bool hasCollectionContactNum() => _collectionContactNum != null;

  // "dropoff_address" field.
  String? _dropoffAddress;
  String get dropoffAddress => _dropoffAddress ?? '';
  bool hasDropoffAddress() => _dropoffAddress != null;

  // "payment_reference_num" field.
  String? _paymentReferenceNum;
  String get paymentReferenceNum => _paymentReferenceNum ?? '';
  bool hasPaymentReferenceNum() => _paymentReferenceNum != null;

  // "payment_receipt" field.
  String? _paymentReceipt;
  String get paymentReceipt => _paymentReceipt ?? '';
  bool hasPaymentReceipt() => _paymentReceipt != null;

  // "mode_of_payment" field.
  String? _modeOfPayment;
  String get modeOfPayment => _modeOfPayment ?? '';
  bool hasModeOfPayment() => _modeOfPayment != null;

  // "proceeded_to_payment" field.
  bool? _proceededToPayment;
  bool get proceededToPayment => _proceededToPayment ?? false;
  bool hasProceededToPayment() => _proceededToPayment != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  bool hasTotal() => _total != null;

  // "subtotal" field.
  double? _subtotal;
  double get subtotal => _subtotal ?? 0.0;
  bool hasSubtotal() => _subtotal != null;

  // "payment_time" field.
  DateTime? _paymentTime;
  DateTime? get paymentTime => _paymentTime;
  bool hasPaymentTime() => _paymentTime != null;

  // "payment_request_time" field.
  DateTime? _paymentRequestTime;
  DateTime? get paymentRequestTime => _paymentRequestTime;
  bool hasPaymentRequestTime() => _paymentRequestTime != null;

  // "rejection_time" field.
  DateTime? _rejectionTime;
  DateTime? get rejectionTime => _rejectionTime;
  bool hasRejectionTime() => _rejectionTime != null;

  // "appointed_staff_ref" field.
  DocumentReference? _appointedStaffRef;
  DocumentReference? get appointedStaffRef => _appointedStaffRef;
  bool hasAppointedStaffRef() => _appointedStaffRef != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _collectionMode = snapshotData['collection_mode'] as String?;
    _plasticJunks = getDataList(snapshotData['plastic_junks']);
    _glassJunks = getDataList(snapshotData['glass_junks']);
    _paperJunks = getDataList(snapshotData['paper_junks']);
    _metalJunks = getDataList(snapshotData['metal_junks']);
    _ewasteJunks = getDataList(snapshotData['ewaste_junks']);
    _otherJunks = getDataList(snapshotData['other_junks']);
    _description = snapshotData['description'] as String?;
    _junkIMG = snapshotData['junk_IMG'] as String?;
    _junkshopOwner = snapshotData['junkshop_owner'] as DocumentReference?;
    _bookerRef = snapshotData['booker_ref'] as DocumentReference?;
    _timeOfMeetup = snapshotData['time_of_meetup'] as DateTime?;
    _junkshopName = snapshotData['junkshop_name'] as String?;
    _status = snapshotData['status'] as String?;
    _junkshopProfilePic = snapshotData['junkshop_profile_pic'] as String?;
    _serviceCharge = castToType<double>(snapshotData['service_charge']);
    _cancellationRemarks = snapshotData['cancellation_remarks'] as String?;
    _timeDeleted = snapshotData['time_deleted'] as DateTime?;
    _pickupAddress = snapshotData['pickup_address'] as String?;
    _clientFullName = snapshotData['client_full_name'] as String?;
    _collectionContactNum = snapshotData['collection_contact_num'] as String?;
    _dropoffAddress = snapshotData['dropoff_address'] as String?;
    _paymentReferenceNum = snapshotData['payment_reference_num'] as String?;
    _paymentReceipt = snapshotData['payment_receipt'] as String?;
    _modeOfPayment = snapshotData['mode_of_payment'] as String?;
    _proceededToPayment = snapshotData['proceeded_to_payment'] as bool?;
    _total = castToType<double>(snapshotData['total']);
    _subtotal = castToType<double>(snapshotData['subtotal']);
    _paymentTime = snapshotData['payment_time'] as DateTime?;
    _paymentRequestTime = snapshotData['payment_request_time'] as DateTime?;
    _rejectionTime = snapshotData['rejection_time'] as DateTime?;
    _appointedStaffRef =
        snapshotData['appointed_staff_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('junkshop_appointments');

  static Stream<JunkshopAppointmentsRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => JunkshopAppointmentsRecord.fromSnapshot(s));

  static Future<JunkshopAppointmentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => JunkshopAppointmentsRecord.fromSnapshot(s));

  static JunkshopAppointmentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JunkshopAppointmentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JunkshopAppointmentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JunkshopAppointmentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JunkshopAppointmentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JunkshopAppointmentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJunkshopAppointmentsRecordData({
  DateTime? createdTime,
  String? collectionMode,
  String? description,
  String? junkIMG,
  DocumentReference? junkshopOwner,
  DocumentReference? bookerRef,
  DateTime? timeOfMeetup,
  String? junkshopName,
  String? status,
  String? junkshopProfilePic,
  double? serviceCharge,
  String? cancellationRemarks,
  DateTime? timeDeleted,
  String? pickupAddress,
  String? clientFullName,
  String? collectionContactNum,
  String? dropoffAddress,
  String? paymentReferenceNum,
  String? paymentReceipt,
  String? modeOfPayment,
  bool? proceededToPayment,
  double? total,
  double? subtotal,
  DateTime? paymentTime,
  DateTime? paymentRequestTime,
  DateTime? rejectionTime,
  DocumentReference? appointedStaffRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'collection_mode': collectionMode,
      'description': description,
      'junk_IMG': junkIMG,
      'junkshop_owner': junkshopOwner,
      'booker_ref': bookerRef,
      'time_of_meetup': timeOfMeetup,
      'junkshop_name': junkshopName,
      'status': status,
      'junkshop_profile_pic': junkshopProfilePic,
      'service_charge': serviceCharge,
      'cancellation_remarks': cancellationRemarks,
      'time_deleted': timeDeleted,
      'pickup_address': pickupAddress,
      'client_full_name': clientFullName,
      'collection_contact_num': collectionContactNum,
      'dropoff_address': dropoffAddress,
      'payment_reference_num': paymentReferenceNum,
      'payment_receipt': paymentReceipt,
      'mode_of_payment': modeOfPayment,
      'proceeded_to_payment': proceededToPayment,
      'total': total,
      'subtotal': subtotal,
      'payment_time': paymentTime,
      'payment_request_time': paymentRequestTime,
      'rejection_time': rejectionTime,
      'appointed_staff_ref': appointedStaffRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class JunkshopAppointmentsRecordDocumentEquality
    implements Equality<JunkshopAppointmentsRecord> {
  const JunkshopAppointmentsRecordDocumentEquality();

  @override
  bool equals(JunkshopAppointmentsRecord? e1, JunkshopAppointmentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.collectionMode == e2?.collectionMode &&
        listEquality.equals(e1?.plasticJunks, e2?.plasticJunks) &&
        listEquality.equals(e1?.glassJunks, e2?.glassJunks) &&
        listEquality.equals(e1?.paperJunks, e2?.paperJunks) &&
        listEquality.equals(e1?.metalJunks, e2?.metalJunks) &&
        listEquality.equals(e1?.ewasteJunks, e2?.ewasteJunks) &&
        listEquality.equals(e1?.otherJunks, e2?.otherJunks) &&
        e1?.description == e2?.description &&
        e1?.junkIMG == e2?.junkIMG &&
        e1?.junkshopOwner == e2?.junkshopOwner &&
        e1?.bookerRef == e2?.bookerRef &&
        e1?.timeOfMeetup == e2?.timeOfMeetup &&
        e1?.junkshopName == e2?.junkshopName &&
        e1?.status == e2?.status &&
        e1?.junkshopProfilePic == e2?.junkshopProfilePic &&
        e1?.serviceCharge == e2?.serviceCharge &&
        e1?.cancellationRemarks == e2?.cancellationRemarks &&
        e1?.timeDeleted == e2?.timeDeleted &&
        e1?.pickupAddress == e2?.pickupAddress &&
        e1?.clientFullName == e2?.clientFullName &&
        e1?.collectionContactNum == e2?.collectionContactNum &&
        e1?.dropoffAddress == e2?.dropoffAddress &&
        e1?.paymentReferenceNum == e2?.paymentReferenceNum &&
        e1?.paymentReceipt == e2?.paymentReceipt &&
        e1?.modeOfPayment == e2?.modeOfPayment &&
        e1?.proceededToPayment == e2?.proceededToPayment &&
        e1?.total == e2?.total &&
        e1?.subtotal == e2?.subtotal &&
        e1?.paymentTime == e2?.paymentTime &&
        e1?.paymentRequestTime == e2?.paymentRequestTime &&
        e1?.rejectionTime == e2?.rejectionTime &&
        e1?.appointedStaffRef == e2?.appointedStaffRef;
  }

  @override
  int hash(JunkshopAppointmentsRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.collectionMode,
        e?.plasticJunks,
        e?.glassJunks,
        e?.paperJunks,
        e?.metalJunks,
        e?.ewasteJunks,
        e?.otherJunks,
        e?.description,
        e?.junkIMG,
        e?.junkshopOwner,
        e?.bookerRef,
        e?.timeOfMeetup,
        e?.junkshopName,
        e?.status,
        e?.junkshopProfilePic,
        e?.serviceCharge,
        e?.cancellationRemarks,
        e?.timeDeleted,
        e?.pickupAddress,
        e?.clientFullName,
        e?.collectionContactNum,
        e?.dropoffAddress,
        e?.paymentReferenceNum,
        e?.paymentReceipt,
        e?.modeOfPayment,
        e?.proceededToPayment,
        e?.total,
        e?.subtotal,
        e?.paymentTime,
        e?.paymentRequestTime,
        e?.rejectionTime,
        e?.appointedStaffRef
      ]);

  @override
  bool isValidKey(Object? o) => o is JunkshopAppointmentsRecord;
}
