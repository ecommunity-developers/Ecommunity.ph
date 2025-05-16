// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AuctionItemsStruct extends FFFirebaseStruct {
  AuctionItemsStruct({
    String? itemName,
    int? itemQuantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _itemName = itemName,
        _itemQuantity = itemQuantity,
        super(firestoreUtilData);

  // "itemName" field.
  String? _itemName;
  String get itemName => _itemName ?? '';
  set itemName(String? val) => _itemName = val;

  bool hasItemName() => _itemName != null;

  // "itemQuantity" field.
  int? _itemQuantity;
  int get itemQuantity => _itemQuantity ?? 0;
  set itemQuantity(int? val) => _itemQuantity = val;

  void incrementItemQuantity(int amount) =>
      itemQuantity = itemQuantity + amount;

  bool hasItemQuantity() => _itemQuantity != null;

  static AuctionItemsStruct fromMap(Map<String, dynamic> data) =>
      AuctionItemsStruct(
        itemName: data['itemName'] as String?,
        itemQuantity: castToType<int>(data['itemQuantity']),
      );

  static AuctionItemsStruct? maybeFromMap(dynamic data) => data is Map
      ? AuctionItemsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'itemName': _itemName,
        'itemQuantity': _itemQuantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'itemName': serializeParam(
          _itemName,
          ParamType.String,
        ),
        'itemQuantity': serializeParam(
          _itemQuantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static AuctionItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuctionItemsStruct(
        itemName: deserializeParam(
          data['itemName'],
          ParamType.String,
          false,
        ),
        itemQuantity: deserializeParam(
          data['itemQuantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'AuctionItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuctionItemsStruct &&
        itemName == other.itemName &&
        itemQuantity == other.itemQuantity;
  }

  @override
  int get hashCode => const ListEquality().hash([itemName, itemQuantity]);
}

AuctionItemsStruct createAuctionItemsStruct({
  String? itemName,
  int? itemQuantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AuctionItemsStruct(
      itemName: itemName,
      itemQuantity: itemQuantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AuctionItemsStruct? updateAuctionItemsStruct(
  AuctionItemsStruct? auctionItems, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    auctionItems
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAuctionItemsStructData(
  Map<String, dynamic> firestoreData,
  AuctionItemsStruct? auctionItems,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (auctionItems == null) {
    return;
  }
  if (auctionItems.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && auctionItems.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final auctionItemsData =
      getAuctionItemsFirestoreData(auctionItems, forFieldValue);
  final nestedData =
      auctionItemsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = auctionItems.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAuctionItemsFirestoreData(
  AuctionItemsStruct? auctionItems, [
  bool forFieldValue = false,
]) {
  if (auctionItems == null) {
    return {};
  }
  final firestoreData = mapToFirestore(auctionItems.toMap());

  // Add any Firestore field values
  auctionItems.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAuctionItemsListFirestoreData(
  List<AuctionItemsStruct>? auctionItemss,
) =>
    auctionItemss?.map((e) => getAuctionItemsFirestoreData(e, true)).toList() ??
    [];
