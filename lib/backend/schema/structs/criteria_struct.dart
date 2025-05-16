// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CriteriaStruct extends FFFirebaseStruct {
  CriteriaStruct({
    String? criteria,
    String? description,
    int? points,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _criteria = criteria,
        _description = description,
        _points = points,
        super(firestoreUtilData);

  // "criteria" field.
  String? _criteria;
  String get criteria => _criteria ?? '';
  set criteria(String? val) => _criteria = val;

  bool hasCriteria() => _criteria != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "points" field.
  int? _points;
  int get points => _points ?? 0;
  set points(int? val) => _points = val;

  void incrementPoints(int amount) => points = points + amount;

  bool hasPoints() => _points != null;

  static CriteriaStruct fromMap(Map<String, dynamic> data) => CriteriaStruct(
        criteria: data['criteria'] as String?,
        description: data['description'] as String?,
        points: castToType<int>(data['points']),
      );

  static CriteriaStruct? maybeFromMap(dynamic data) =>
      data is Map ? CriteriaStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'criteria': _criteria,
        'description': _description,
        'points': _points,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'criteria': serializeParam(
          _criteria,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'points': serializeParam(
          _points,
          ParamType.int,
        ),
      }.withoutNulls;

  static CriteriaStruct fromSerializableMap(Map<String, dynamic> data) =>
      CriteriaStruct(
        criteria: deserializeParam(
          data['criteria'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        points: deserializeParam(
          data['points'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CriteriaStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CriteriaStruct &&
        criteria == other.criteria &&
        description == other.description &&
        points == other.points;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([criteria, description, points]);
}

CriteriaStruct createCriteriaStruct({
  String? criteria,
  String? description,
  int? points,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CriteriaStruct(
      criteria: criteria,
      description: description,
      points: points,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CriteriaStruct? updateCriteriaStruct(
  CriteriaStruct? criteriaStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    criteriaStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCriteriaStructData(
  Map<String, dynamic> firestoreData,
  CriteriaStruct? criteriaStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (criteriaStruct == null) {
    return;
  }
  if (criteriaStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && criteriaStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final criteriaStructData =
      getCriteriaFirestoreData(criteriaStruct, forFieldValue);
  final nestedData =
      criteriaStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = criteriaStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCriteriaFirestoreData(
  CriteriaStruct? criteriaStruct, [
  bool forFieldValue = false,
]) {
  if (criteriaStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(criteriaStruct.toMap());

  // Add any Firestore field values
  criteriaStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCriteriaListFirestoreData(
  List<CriteriaStruct>? criteriaStructs,
) =>
    criteriaStructs?.map((e) => getCriteriaFirestoreData(e, true)).toList() ??
    [];
