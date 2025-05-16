// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class BidsDetailsStruct extends FFFirebaseStruct {
  BidsDetailsStruct({
    double? bid,
    DateTime? timeBidded,
    String? junkshopName,
    DocumentReference? junkshopOwnerReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bid = bid,
        _timeBidded = timeBidded,
        _junkshopName = junkshopName,
        _junkshopOwnerReference = junkshopOwnerReference,
        super(firestoreUtilData);

  // "bid" field.
  double? _bid;
  double get bid => _bid ?? 0.0;
  set bid(double? val) => _bid = val;

  void incrementBid(double amount) => bid = bid + amount;

  bool hasBid() => _bid != null;

  // "time_bidded" field.
  DateTime? _timeBidded;
  DateTime? get timeBidded => _timeBidded;
  set timeBidded(DateTime? val) => _timeBidded = val;

  bool hasTimeBidded() => _timeBidded != null;

  // "junkshop_name" field.
  String? _junkshopName;
  String get junkshopName => _junkshopName ?? '';
  set junkshopName(String? val) => _junkshopName = val;

  bool hasJunkshopName() => _junkshopName != null;

  // "junkshop_owner_reference" field.
  DocumentReference? _junkshopOwnerReference;
  DocumentReference? get junkshopOwnerReference => _junkshopOwnerReference;
  set junkshopOwnerReference(DocumentReference? val) =>
      _junkshopOwnerReference = val;

  bool hasJunkshopOwnerReference() => _junkshopOwnerReference != null;

  static BidsDetailsStruct fromMap(Map<String, dynamic> data) =>
      BidsDetailsStruct(
        bid: castToType<double>(data['bid']),
        timeBidded: data['time_bidded'] as DateTime?,
        junkshopName: data['junkshop_name'] as String?,
        junkshopOwnerReference:
            data['junkshop_owner_reference'] as DocumentReference?,
      );

  static BidsDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? BidsDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'bid': _bid,
        'time_bidded': _timeBidded,
        'junkshop_name': _junkshopName,
        'junkshop_owner_reference': _junkshopOwnerReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bid': serializeParam(
          _bid,
          ParamType.double,
        ),
        'time_bidded': serializeParam(
          _timeBidded,
          ParamType.DateTime,
        ),
        'junkshop_name': serializeParam(
          _junkshopName,
          ParamType.String,
        ),
        'junkshop_owner_reference': serializeParam(
          _junkshopOwnerReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static BidsDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      BidsDetailsStruct(
        bid: deserializeParam(
          data['bid'],
          ParamType.double,
          false,
        ),
        timeBidded: deserializeParam(
          data['time_bidded'],
          ParamType.DateTime,
          false,
        ),
        junkshopName: deserializeParam(
          data['junkshop_name'],
          ParamType.String,
          false,
        ),
        junkshopOwnerReference: deserializeParam(
          data['junkshop_owner_reference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['user'],
        ),
      );

  @override
  String toString() => 'BidsDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BidsDetailsStruct &&
        bid == other.bid &&
        timeBidded == other.timeBidded &&
        junkshopName == other.junkshopName &&
        junkshopOwnerReference == other.junkshopOwnerReference;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([bid, timeBidded, junkshopName, junkshopOwnerReference]);
}

BidsDetailsStruct createBidsDetailsStruct({
  double? bid,
  DateTime? timeBidded,
  String? junkshopName,
  DocumentReference? junkshopOwnerReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BidsDetailsStruct(
      bid: bid,
      timeBidded: timeBidded,
      junkshopName: junkshopName,
      junkshopOwnerReference: junkshopOwnerReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BidsDetailsStruct? updateBidsDetailsStruct(
  BidsDetailsStruct? bidsDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bidsDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBidsDetailsStructData(
  Map<String, dynamic> firestoreData,
  BidsDetailsStruct? bidsDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bidsDetails == null) {
    return;
  }
  if (bidsDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && bidsDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bidsDetailsData =
      getBidsDetailsFirestoreData(bidsDetails, forFieldValue);
  final nestedData =
      bidsDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = bidsDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBidsDetailsFirestoreData(
  BidsDetailsStruct? bidsDetails, [
  bool forFieldValue = false,
]) {
  if (bidsDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bidsDetails.toMap());

  // Add any Firestore field values
  bidsDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBidsDetailsListFirestoreData(
  List<BidsDetailsStruct>? bidsDetailss,
) =>
    bidsDetailss?.map((e) => getBidsDetailsFirestoreData(e, true)).toList() ??
    [];
