import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "barangay" field.
  String? _barangay;
  String get barangay => _barangay ?? '';
  bool hasBarangay() => _barangay != null;

  // "houseNoStreet" field.
  String? _houseNoStreet;
  String get houseNoStreet => _houseNoStreet ?? '';
  bool hasHouseNoStreet() => _houseNoStreet != null;

  // "activeAccStatus" field.
  bool? _activeAccStatus;
  bool get activeAccStatus => _activeAccStatus ?? false;
  bool hasActiveAccStatus() => _activeAccStatus != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "user_type" field.
  String? _userType;
  String get userType => _userType ?? '';
  bool hasUserType() => _userType != null;

  // "isDeactivated" field.
  bool? _isDeactivated;
  bool get isDeactivated => _isDeactivated ?? false;
  bool hasIsDeactivated() => _isDeactivated != null;

  // "office" field.
  String? _office;
  String get office => _office ?? '';
  bool hasOffice() => _office != null;

  // "role" field.
  List<String>? _role;
  List<String> get role => _role ?? const [];
  bool hasRole() => _role != null;

  // "drivers_license" field.
  String? _driversLicense;
  String get driversLicense => _driversLicense ?? '';
  bool hasDriversLicense() => _driversLicense != null;

  // "drivers_license_url" field.
  String? _driversLicenseUrl;
  String get driversLicenseUrl => _driversLicenseUrl ?? '';
  bool hasDriversLicenseUrl() => _driversLicenseUrl != null;

  // "gcash_no" field.
  String? _gcashNo;
  String get gcashNo => _gcashNo ?? '';
  bool hasGcashNo() => _gcashNo != null;

  // "gcash_qr_code" field.
  String? _gcashQrCode;
  String get gcashQrCode => _gcashQrCode ?? '';
  bool hasGcashQrCode() => _gcashQrCode != null;

  // "staff_at_this_junkshop" field.
  DocumentReference? _staffAtThisJunkshop;
  DocumentReference? get staffAtThisJunkshop => _staffAtThisJunkshop;
  bool hasStaffAtThisJunkshop() => _staffAtThisJunkshop != null;

  // "valid_ID_pic_front" field.
  String? _validIDPicFront;
  String get validIDPicFront => _validIDPicFront ?? '';
  bool hasValidIDPicFront() => _validIDPicFront != null;

  // "valid_ID_pic_back" field.
  String? _validIDPicBack;
  String get validIDPicBack => _validIDPicBack ?? '';
  bool hasValidIDPicBack() => _validIDPicBack != null;

  // "valid_ID_pic_selfie" field.
  String? _validIDPicSelfie;
  String get validIDPicSelfie => _validIDPicSelfie ?? '';
  bool hasValidIDPicSelfie() => _validIDPicSelfie != null;

  // "ID_type" field.
  String? _iDType;
  String get iDType => _iDType ?? '';
  bool hasIDType() => _iDType != null;

  // "ID_number" field.
  String? _iDNumber;
  String get iDNumber => _iDNumber ?? '';
  bool hasIDNumber() => _iDNumber != null;

  // "middle_name" field.
  String? _middleName;
  String get middleName => _middleName ?? '';
  bool hasMiddleName() => _middleName != null;

  // "suffix" field.
  String? _suffix;
  String get suffix => _suffix ?? '';
  bool hasSuffix() => _suffix != null;

  // "time_verified" field.
  DateTime? _timeVerified;
  DateTime? get timeVerified => _timeVerified;
  bool hasTimeVerified() => _timeVerified != null;

  // "verification_status" field.
  String? _verificationStatus;
  String get verificationStatus => _verificationStatus ?? '';
  bool hasVerificationStatus() => _verificationStatus != null;

  // "time_requested_for_verification" field.
  DateTime? _timeRequestedForVerification;
  DateTime? get timeRequestedForVerification => _timeRequestedForVerification;
  bool hasTimeRequestedForVerification() =>
      _timeRequestedForVerification != null;

  // "approved_or_rejected_by" field.
  String? _approvedOrRejectedBy;
  String get approvedOrRejectedBy => _approvedOrRejectedBy ?? '';
  bool hasApprovedOrRejectedBy() => _approvedOrRejectedBy != null;

  // "eco_points" field.
  double? _ecoPoints;
  double get ecoPoints => _ecoPoints ?? 0.0;
  bool hasEcoPoints() => _ecoPoints != null;

  // "pendingPayables" field.
  bool? _pendingPayables;
  bool get pendingPayables => _pendingPayables ?? false;
  bool hasPendingPayables() => _pendingPayables != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _gender = snapshotData['gender'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _barangay = snapshotData['barangay'] as String?;
    _houseNoStreet = snapshotData['houseNoStreet'] as String?;
    _activeAccStatus = snapshotData['activeAccStatus'] as bool?;
    _username = snapshotData['username'] as String?;
    _password = snapshotData['password'] as String?;
    _userType = snapshotData['user_type'] as String?;
    _isDeactivated = snapshotData['isDeactivated'] as bool?;
    _office = snapshotData['office'] as String?;
    _role = getDataList(snapshotData['role']);
    _driversLicense = snapshotData['drivers_license'] as String?;
    _driversLicenseUrl = snapshotData['drivers_license_url'] as String?;
    _gcashNo = snapshotData['gcash_no'] as String?;
    _gcashQrCode = snapshotData['gcash_qr_code'] as String?;
    _staffAtThisJunkshop =
        snapshotData['staff_at_this_junkshop'] as DocumentReference?;
    _validIDPicFront = snapshotData['valid_ID_pic_front'] as String?;
    _validIDPicBack = snapshotData['valid_ID_pic_back'] as String?;
    _validIDPicSelfie = snapshotData['valid_ID_pic_selfie'] as String?;
    _iDType = snapshotData['ID_type'] as String?;
    _iDNumber = snapshotData['ID_number'] as String?;
    _middleName = snapshotData['middle_name'] as String?;
    _suffix = snapshotData['suffix'] as String?;
    _timeVerified = snapshotData['time_verified'] as DateTime?;
    _verificationStatus = snapshotData['verification_status'] as String?;
    _timeRequestedForVerification =
        snapshotData['time_requested_for_verification'] as DateTime?;
    _approvedOrRejectedBy = snapshotData['approved_or_rejected_by'] as String?;
    _ecoPoints = castToType<double>(snapshotData['eco_points']);
    _pendingPayables = snapshotData['pendingPayables'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  DateTime? createdTime,
  String? firstName,
  String? lastName,
  String? gender,
  String? phoneNumber,
  DateTime? birthday,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  String? barangay,
  String? houseNoStreet,
  bool? activeAccStatus,
  String? username,
  String? password,
  String? userType,
  bool? isDeactivated,
  String? office,
  String? driversLicense,
  String? driversLicenseUrl,
  String? gcashNo,
  String? gcashQrCode,
  DocumentReference? staffAtThisJunkshop,
  String? validIDPicFront,
  String? validIDPicBack,
  String? validIDPicSelfie,
  String? iDType,
  String? iDNumber,
  String? middleName,
  String? suffix,
  DateTime? timeVerified,
  String? verificationStatus,
  DateTime? timeRequestedForVerification,
  String? approvedOrRejectedBy,
  double? ecoPoints,
  bool? pendingPayables,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'barangay': barangay,
      'houseNoStreet': houseNoStreet,
      'activeAccStatus': activeAccStatus,
      'username': username,
      'password': password,
      'user_type': userType,
      'isDeactivated': isDeactivated,
      'office': office,
      'drivers_license': driversLicense,
      'drivers_license_url': driversLicenseUrl,
      'gcash_no': gcashNo,
      'gcash_qr_code': gcashQrCode,
      'staff_at_this_junkshop': staffAtThisJunkshop,
      'valid_ID_pic_front': validIDPicFront,
      'valid_ID_pic_back': validIDPicBack,
      'valid_ID_pic_selfie': validIDPicSelfie,
      'ID_type': iDType,
      'ID_number': iDNumber,
      'middle_name': middleName,
      'suffix': suffix,
      'time_verified': timeVerified,
      'verification_status': verificationStatus,
      'time_requested_for_verification': timeRequestedForVerification,
      'approved_or_rejected_by': approvedOrRejectedBy,
      'eco_points': ecoPoints,
      'pendingPayables': pendingPayables,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.firstName == e2?.firstName &&
        e1?.lastName == e2?.lastName &&
        e1?.gender == e2?.gender &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.birthday == e2?.birthday &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.barangay == e2?.barangay &&
        e1?.houseNoStreet == e2?.houseNoStreet &&
        e1?.activeAccStatus == e2?.activeAccStatus &&
        e1?.username == e2?.username &&
        e1?.password == e2?.password &&
        e1?.userType == e2?.userType &&
        e1?.isDeactivated == e2?.isDeactivated &&
        e1?.office == e2?.office &&
        listEquality.equals(e1?.role, e2?.role) &&
        e1?.driversLicense == e2?.driversLicense &&
        e1?.driversLicenseUrl == e2?.driversLicenseUrl &&
        e1?.gcashNo == e2?.gcashNo &&
        e1?.gcashQrCode == e2?.gcashQrCode &&
        e1?.staffAtThisJunkshop == e2?.staffAtThisJunkshop &&
        e1?.validIDPicFront == e2?.validIDPicFront &&
        e1?.validIDPicBack == e2?.validIDPicBack &&
        e1?.validIDPicSelfie == e2?.validIDPicSelfie &&
        e1?.iDType == e2?.iDType &&
        e1?.iDNumber == e2?.iDNumber &&
        e1?.middleName == e2?.middleName &&
        e1?.suffix == e2?.suffix &&
        e1?.timeVerified == e2?.timeVerified &&
        e1?.verificationStatus == e2?.verificationStatus &&
        e1?.timeRequestedForVerification == e2?.timeRequestedForVerification &&
        e1?.approvedOrRejectedBy == e2?.approvedOrRejectedBy &&
        e1?.ecoPoints == e2?.ecoPoints &&
        e1?.pendingPayables == e2?.pendingPayables;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.firstName,
        e?.lastName,
        e?.gender,
        e?.phoneNumber,
        e?.birthday,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.barangay,
        e?.houseNoStreet,
        e?.activeAccStatus,
        e?.username,
        e?.password,
        e?.userType,
        e?.isDeactivated,
        e?.office,
        e?.role,
        e?.driversLicense,
        e?.driversLicenseUrl,
        e?.gcashNo,
        e?.gcashQrCode,
        e?.staffAtThisJunkshop,
        e?.validIDPicFront,
        e?.validIDPicBack,
        e?.validIDPicSelfie,
        e?.iDType,
        e?.iDNumber,
        e?.middleName,
        e?.suffix,
        e?.timeVerified,
        e?.verificationStatus,
        e?.timeRequestedForVerification,
        e?.approvedOrRejectedBy,
        e?.ecoPoints,
        e?.pendingPayables
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
