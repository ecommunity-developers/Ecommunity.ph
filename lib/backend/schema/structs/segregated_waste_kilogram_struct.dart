// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SegregatedWasteKilogramStruct extends FFFirebaseStruct {
  SegregatedWasteKilogramStruct({
    DateTime? createdTime,
    double? kilogram,
    String? wasteType,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _createdTime = createdTime,
        _kilogram = kilogram,
        _wasteType = wasteType,
        super(firestoreUtilData);

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;

  bool hasCreatedTime() => _createdTime != null;

  // "kilogram" field.
  double? _kilogram;
  double get kilogram => _kilogram ?? 0.0;
  set kilogram(double? val) => _kilogram = val;

  void incrementKilogram(double amount) => kilogram = kilogram + amount;

  bool hasKilogram() => _kilogram != null;

  // "waste_type" field.
  String? _wasteType;
  String get wasteType => _wasteType ?? '';
  set wasteType(String? val) => _wasteType = val;

  bool hasWasteType() => _wasteType != null;

  static SegregatedWasteKilogramStruct fromMap(Map<String, dynamic> data) =>
      SegregatedWasteKilogramStruct(
        createdTime: data['created_time'] as DateTime?,
        kilogram: castToType<double>(data['kilogram']),
        wasteType: data['waste_type'] as String?,
      );

  static SegregatedWasteKilogramStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? SegregatedWasteKilogramStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'created_time': _createdTime,
        'kilogram': _kilogram,
        'waste_type': _wasteType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'kilogram': serializeParam(
          _kilogram,
          ParamType.double,
        ),
        'waste_type': serializeParam(
          _wasteType,
          ParamType.String,
        ),
      }.withoutNulls;

  static SegregatedWasteKilogramStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SegregatedWasteKilogramStruct(
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        kilogram: deserializeParam(
          data['kilogram'],
          ParamType.double,
          false,
        ),
        wasteType: deserializeParam(
          data['waste_type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SegregatedWasteKilogramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SegregatedWasteKilogramStruct &&
        createdTime == other.createdTime &&
        kilogram == other.kilogram &&
        wasteType == other.wasteType;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([createdTime, kilogram, wasteType]);
}

SegregatedWasteKilogramStruct createSegregatedWasteKilogramStruct({
  DateTime? createdTime,
  double? kilogram,
  String? wasteType,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SegregatedWasteKilogramStruct(
      createdTime: createdTime,
      kilogram: kilogram,
      wasteType: wasteType,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SegregatedWasteKilogramStruct? updateSegregatedWasteKilogramStruct(
  SegregatedWasteKilogramStruct? segregatedWasteKilogram, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    segregatedWasteKilogram
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSegregatedWasteKilogramStructData(
  Map<String, dynamic> firestoreData,
  SegregatedWasteKilogramStruct? segregatedWasteKilogram,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (segregatedWasteKilogram == null) {
    return;
  }
  if (segregatedWasteKilogram.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      segregatedWasteKilogram.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final segregatedWasteKilogramData = getSegregatedWasteKilogramFirestoreData(
      segregatedWasteKilogram, forFieldValue);
  final nestedData =
      segregatedWasteKilogramData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      segregatedWasteKilogram.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSegregatedWasteKilogramFirestoreData(
  SegregatedWasteKilogramStruct? segregatedWasteKilogram, [
  bool forFieldValue = false,
]) {
  if (segregatedWasteKilogram == null) {
    return {};
  }
  final firestoreData = mapToFirestore(segregatedWasteKilogram.toMap());

  // Add any Firestore field values
  segregatedWasteKilogram.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSegregatedWasteKilogramListFirestoreData(
  List<SegregatedWasteKilogramStruct>? segregatedWasteKilograms,
) =>
    segregatedWasteKilograms
        ?.map((e) => getSegregatedWasteKilogramFirestoreData(e, true))
        .toList() ??
    [];
