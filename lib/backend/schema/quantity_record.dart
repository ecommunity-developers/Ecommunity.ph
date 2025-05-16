import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuantityRecord extends FirestoreRecord {
  QuantityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "parent_index" field.
  int? _parentIndex;
  int get parentIndex => _parentIndex ?? 0;
  bool hasParentIndex() => _parentIndex != null;

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  bool hasItem() => _item != null;

  // "total_price" field.
  double? _totalPrice;
  double get totalPrice => _totalPrice ?? 0.0;
  bool hasTotalPrice() => _totalPrice != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  bool hasQuantity() => _quantity != null;

  // "quantity_type" field.
  String? _quantityType;
  String get quantityType => _quantityType ?? '';
  bool hasQuantityType() => _quantityType != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _parentIndex = castToType<int>(snapshotData['parent_index']);
    _item = snapshotData['item'] as String?;
    _totalPrice = castToType<double>(snapshotData['total_price']);
    _type = snapshotData['type'] as String?;
    _quantity = castToType<double>(snapshotData['quantity']);
    _quantityType = snapshotData['quantity_type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('quantity')
          : FirebaseFirestore.instance.collectionGroup('quantity');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('quantity').doc(id);

  static Stream<QuantityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuantityRecord.fromSnapshot(s));

  static Future<QuantityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuantityRecord.fromSnapshot(s));

  static QuantityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuantityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuantityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuantityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuantityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuantityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuantityRecordData({
  int? parentIndex,
  String? item,
  double? totalPrice,
  String? type,
  double? quantity,
  String? quantityType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'parent_index': parentIndex,
      'item': item,
      'total_price': totalPrice,
      'type': type,
      'quantity': quantity,
      'quantity_type': quantityType,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuantityRecordDocumentEquality implements Equality<QuantityRecord> {
  const QuantityRecordDocumentEquality();

  @override
  bool equals(QuantityRecord? e1, QuantityRecord? e2) {
    return e1?.parentIndex == e2?.parentIndex &&
        e1?.item == e2?.item &&
        e1?.totalPrice == e2?.totalPrice &&
        e1?.type == e2?.type &&
        e1?.quantity == e2?.quantity &&
        e1?.quantityType == e2?.quantityType;
  }

  @override
  int hash(QuantityRecord? e) => const ListEquality().hash([
        e?.parentIndex,
        e?.item,
        e?.totalPrice,
        e?.type,
        e?.quantity,
        e?.quantityType
      ]);

  @override
  bool isValidKey(Object? o) => o is QuantityRecord;
}
