import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JunkshopRecord extends FirestoreRecord {
  JunkshopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "junkshop_ID" field.
  String? _junkshopID;
  String get junkshopID => _junkshopID ?? '';
  bool hasJunkshopID() => _junkshopID != null;

  // "business_trade_name" field.
  String? _businessTradeName;
  String get businessTradeName => _businessTradeName ?? '';
  bool hasBusinessTradeName() => _businessTradeName != null;

  // "account_number" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "permit_number" field.
  String? _permitNumber;
  String get permitNumber => _permitNumber ?? '';
  bool hasPermitNumber() => _permitNumber != null;

  // "mobile_number" field.
  String? _mobileNumber;
  String get mobileNumber => _mobileNumber ?? '';
  bool hasMobileNumber() => _mobileNumber != null;

  // "telephone_number" field.
  String? _telephoneNumber;
  String get telephoneNumber => _telephoneNumber ?? '';
  bool hasTelephoneNumber() => _telephoneNumber != null;

  // "email_address" field.
  String? _emailAddress;
  String get emailAddress => _emailAddress ?? '';
  bool hasEmailAddress() => _emailAddress != null;

  // "number_street" field.
  String? _numberStreet;
  String get numberStreet => _numberStreet ?? '';
  bool hasNumberStreet() => _numberStreet != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "isDeactivated" field.
  bool? _isDeactivated;
  bool get isDeactivated => _isDeactivated ?? false;
  bool hasIsDeactivated() => _isDeactivated != null;

  // "owner_ID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  // "plastic_instruction" field.
  String? _plasticInstruction;
  String get plasticInstruction => _plasticInstruction ?? '';
  bool hasPlasticInstruction() => _plasticInstruction != null;

  // "paper_instruction" field.
  String? _paperInstruction;
  String get paperInstruction => _paperInstruction ?? '';
  bool hasPaperInstruction() => _paperInstruction != null;

  // "metal_instruction" field.
  String? _metalInstruction;
  String get metalInstruction => _metalInstruction ?? '';
  bool hasMetalInstruction() => _metalInstruction != null;

  // "glass_instruction" field.
  String? _glassInstruction;
  String get glassInstruction => _glassInstruction ?? '';
  bool hasGlassInstruction() => _glassInstruction != null;

  // "ewaste_instruction" field.
  String? _ewasteInstruction;
  String get ewasteInstruction => _ewasteInstruction ?? '';
  bool hasEwasteInstruction() => _ewasteInstruction != null;

  // "junkshop_location" field.
  LatLng? _junkshopLocation;
  LatLng? get junkshopLocation => _junkshopLocation;
  bool hasJunkshopLocation() => _junkshopLocation != null;

  // "others_instruction" field.
  String? _othersInstruction;
  String get othersInstruction => _othersInstruction ?? '';
  bool hasOthersInstruction() => _othersInstruction != null;

  // "day_open_from" field.
  String? _dayOpenFrom;
  String get dayOpenFrom => _dayOpenFrom ?? '';
  bool hasDayOpenFrom() => _dayOpenFrom != null;

  // "day_open_until" field.
  String? _dayOpenUntil;
  String get dayOpenUntil => _dayOpenUntil ?? '';
  bool hasDayOpenUntil() => _dayOpenUntil != null;

  // "time_open" field.
  DateTime? _timeOpen;
  DateTime? get timeOpen => _timeOpen;
  bool hasTimeOpen() => _timeOpen != null;

  // "time_closed" field.
  DateTime? _timeClosed;
  DateTime? get timeClosed => _timeClosed;
  bool hasTimeClosed() => _timeClosed != null;

  // "total_paid_cash" field.
  double? _totalPaidCash;
  double get totalPaidCash => _totalPaidCash ?? 0.0;
  bool hasTotalPaidCash() => _totalPaidCash != null;

  // "total_paid_gcash" field.
  double? _totalPaidGcash;
  double get totalPaidGcash => _totalPaidGcash ?? 0.0;
  bool hasTotalPaidGcash() => _totalPaidGcash != null;

  // "total_payables" field.
  double? _totalPayables;
  double get totalPayables => _totalPayables ?? 0.0;
  bool hasTotalPayables() => _totalPayables != null;

  // "total_service_fee" field.
  double? _totalServiceFee;
  double get totalServiceFee => _totalServiceFee ?? 0.0;
  bool hasTotalServiceFee() => _totalServiceFee != null;

  // "general_service_instructions" field.
  String? _generalServiceInstructions;
  String get generalServiceInstructions => _generalServiceInstructions ?? '';
  bool hasGeneralServiceInstructions() => _generalServiceInstructions != null;

  // "mode_of_payment" field.
  List<String>? _modeOfPayment;
  List<String> get modeOfPayment => _modeOfPayment ?? const [];
  bool hasModeOfPayment() => _modeOfPayment != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _junkshopID = snapshotData['junkshop_ID'] as String?;
    _businessTradeName = snapshotData['business_trade_name'] as String?;
    _accountNumber = snapshotData['account_number'] as String?;
    _permitNumber = snapshotData['permit_number'] as String?;
    _mobileNumber = snapshotData['mobile_number'] as String?;
    _telephoneNumber = snapshotData['telephone_number'] as String?;
    _emailAddress = snapshotData['email_address'] as String?;
    _numberStreet = snapshotData['number_street'] as String?;
    _barangay = snapshotData['barangay'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _isDeactivated = snapshotData['isDeactivated'] as bool?;
    _ownerID = snapshotData['owner_ID'] as String?;
    _plasticInstruction = snapshotData['plastic_instruction'] as String?;
    _paperInstruction = snapshotData['paper_instruction'] as String?;
    _metalInstruction = snapshotData['metal_instruction'] as String?;
    _glassInstruction = snapshotData['glass_instruction'] as String?;
    _ewasteInstruction = snapshotData['ewaste_instruction'] as String?;
    _junkshopLocation = snapshotData['junkshop_location'] as LatLng?;
    _othersInstruction = snapshotData['others_instruction'] as String?;
    _dayOpenFrom = snapshotData['day_open_from'] as String?;
    _dayOpenUntil = snapshotData['day_open_until'] as String?;
    _timeOpen = snapshotData['time_open'] as DateTime?;
    _timeClosed = snapshotData['time_closed'] as DateTime?;
    _totalPaidCash = castToType<double>(snapshotData['total_paid_cash']);
    _totalPaidGcash = castToType<double>(snapshotData['total_paid_gcash']);
    _totalPayables = castToType<double>(snapshotData['total_payables']);
    _totalServiceFee = castToType<double>(snapshotData['total_service_fee']);
    _generalServiceInstructions =
        snapshotData['general_service_instructions'] as String?;
    _modeOfPayment = getDataList(snapshotData['mode_of_payment']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('junkshop');

  static Stream<JunkshopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JunkshopRecord.fromSnapshot(s));

  static Future<JunkshopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JunkshopRecord.fromSnapshot(s));

  static JunkshopRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JunkshopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JunkshopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JunkshopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JunkshopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JunkshopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJunkshopRecordData({
  DateTime? createdTime,
  String? junkshopID,
  String? businessTradeName,
  String? accountNumber,
  String? permitNumber,
  String? mobileNumber,
  String? telephoneNumber,
  String? emailAddress,
  String? numberStreet,
  String? barangay,
  String? photoUrl,
  bool? isDeactivated,
  String? ownerID,
  String? plasticInstruction,
  String? paperInstruction,
  String? metalInstruction,
  String? glassInstruction,
  String? ewasteInstruction,
  LatLng? junkshopLocation,
  String? othersInstruction,
  String? dayOpenFrom,
  String? dayOpenUntil,
  DateTime? timeOpen,
  DateTime? timeClosed,
  double? totalPaidCash,
  double? totalPaidGcash,
  double? totalPayables,
  double? totalServiceFee,
  String? generalServiceInstructions,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'junkshop_ID': junkshopID,
      'business_trade_name': businessTradeName,
      'account_number': accountNumber,
      'permit_number': permitNumber,
      'mobile_number': mobileNumber,
      'telephone_number': telephoneNumber,
      'email_address': emailAddress,
      'number_street': numberStreet,
      'barangay': barangay,
      'photo_url': photoUrl,
      'isDeactivated': isDeactivated,
      'owner_ID': ownerID,
      'plastic_instruction': plasticInstruction,
      'paper_instruction': paperInstruction,
      'metal_instruction': metalInstruction,
      'glass_instruction': glassInstruction,
      'ewaste_instruction': ewasteInstruction,
      'junkshop_location': junkshopLocation,
      'others_instruction': othersInstruction,
      'day_open_from': dayOpenFrom,
      'day_open_until': dayOpenUntil,
      'time_open': timeOpen,
      'time_closed': timeClosed,
      'total_paid_cash': totalPaidCash,
      'total_paid_gcash': totalPaidGcash,
      'total_payables': totalPayables,
      'total_service_fee': totalServiceFee,
      'general_service_instructions': generalServiceInstructions,
    }.withoutNulls,
  );

  return firestoreData;
}

class JunkshopRecordDocumentEquality implements Equality<JunkshopRecord> {
  const JunkshopRecordDocumentEquality();

  @override
  bool equals(JunkshopRecord? e1, JunkshopRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.junkshopID == e2?.junkshopID &&
        e1?.businessTradeName == e2?.businessTradeName &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.permitNumber == e2?.permitNumber &&
        e1?.mobileNumber == e2?.mobileNumber &&
        e1?.telephoneNumber == e2?.telephoneNumber &&
        e1?.emailAddress == e2?.emailAddress &&
        e1?.numberStreet == e2?.numberStreet &&
        e1?.barangay == e2?.barangay &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.isDeactivated == e2?.isDeactivated &&
        e1?.ownerID == e2?.ownerID &&
        e1?.plasticInstruction == e2?.plasticInstruction &&
        e1?.paperInstruction == e2?.paperInstruction &&
        e1?.metalInstruction == e2?.metalInstruction &&
        e1?.glassInstruction == e2?.glassInstruction &&
        e1?.ewasteInstruction == e2?.ewasteInstruction &&
        e1?.junkshopLocation == e2?.junkshopLocation &&
        e1?.othersInstruction == e2?.othersInstruction &&
        e1?.dayOpenFrom == e2?.dayOpenFrom &&
        e1?.dayOpenUntil == e2?.dayOpenUntil &&
        e1?.timeOpen == e2?.timeOpen &&
        e1?.timeClosed == e2?.timeClosed &&
        e1?.totalPaidCash == e2?.totalPaidCash &&
        e1?.totalPaidGcash == e2?.totalPaidGcash &&
        e1?.totalPayables == e2?.totalPayables &&
        e1?.totalServiceFee == e2?.totalServiceFee &&
        e1?.generalServiceInstructions == e2?.generalServiceInstructions &&
        listEquality.equals(e1?.modeOfPayment, e2?.modeOfPayment);
  }

  @override
  int hash(JunkshopRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.junkshopID,
        e?.businessTradeName,
        e?.accountNumber,
        e?.permitNumber,
        e?.mobileNumber,
        e?.telephoneNumber,
        e?.emailAddress,
        e?.numberStreet,
        e?.barangay,
        e?.photoUrl,
        e?.isDeactivated,
        e?.ownerID,
        e?.plasticInstruction,
        e?.paperInstruction,
        e?.metalInstruction,
        e?.glassInstruction,
        e?.ewasteInstruction,
        e?.junkshopLocation,
        e?.othersInstruction,
        e?.dayOpenFrom,
        e?.dayOpenUntil,
        e?.timeOpen,
        e?.timeClosed,
        e?.totalPaidCash,
        e?.totalPaidGcash,
        e?.totalPayables,
        e?.totalServiceFee,
        e?.generalServiceInstructions,
        e?.modeOfPayment
      ]);

  @override
  bool isValidKey(Object? o) => o is JunkshopRecord;
}
