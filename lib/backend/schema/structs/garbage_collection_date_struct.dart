// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class GarbageCollectionDateStruct extends FFFirebaseStruct {
  GarbageCollectionDateStruct({
    String? baranggay,
    String? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _baranggay = baranggay,
        _date = date,
        super(firestoreUtilData);

  // "baranggay" field.
  String? _baranggay;
  String get baranggay => _baranggay ?? '';
  set baranggay(String? val) => _baranggay = val;

  bool hasBaranggay() => _baranggay != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  static GarbageCollectionDateStruct fromMap(Map<String, dynamic> data) =>
      GarbageCollectionDateStruct(
        baranggay: data['baranggay'] as String?,
        date: data['date'] as String?,
      );

  static GarbageCollectionDateStruct? maybeFromMap(dynamic data) => data is Map
      ? GarbageCollectionDateStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'baranggay': _baranggay,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'baranggay': serializeParam(
          _baranggay,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.String,
        ),
      }.withoutNulls;

  static GarbageCollectionDateStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GarbageCollectionDateStruct(
        baranggay: deserializeParam(
          data['baranggay'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'GarbageCollectionDateStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GarbageCollectionDateStruct &&
        baranggay == other.baranggay &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([baranggay, date]);
}

GarbageCollectionDateStruct createGarbageCollectionDateStruct({
  String? baranggay,
  String? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GarbageCollectionDateStruct(
      baranggay: baranggay,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GarbageCollectionDateStruct? updateGarbageCollectionDateStruct(
  GarbageCollectionDateStruct? garbageCollectionDate, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    garbageCollectionDate
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGarbageCollectionDateStructData(
  Map<String, dynamic> firestoreData,
  GarbageCollectionDateStruct? garbageCollectionDate,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (garbageCollectionDate == null) {
    return;
  }
  if (garbageCollectionDate.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      garbageCollectionDate.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final garbageCollectionDateData = getGarbageCollectionDateFirestoreData(
      garbageCollectionDate, forFieldValue);
  final nestedData =
      garbageCollectionDateData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      garbageCollectionDate.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGarbageCollectionDateFirestoreData(
  GarbageCollectionDateStruct? garbageCollectionDate, [
  bool forFieldValue = false,
]) {
  if (garbageCollectionDate == null) {
    return {};
  }
  final firestoreData = mapToFirestore(garbageCollectionDate.toMap());

  // Add any Firestore field values
  garbageCollectionDate.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGarbageCollectionDateListFirestoreData(
  List<GarbageCollectionDateStruct>? garbageCollectionDates,
) =>
    garbageCollectionDates
        ?.map((e) => getGarbageCollectionDateFirestoreData(e, true))
        .toList() ??
    [];
