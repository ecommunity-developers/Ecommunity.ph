import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceInformationRecord extends FirestoreRecord {
  ServiceInformationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "pricing_remarks" field.
  String? _pricingRemarks;
  String get pricingRemarks => _pricingRemarks ?? '';
  bool hasPricingRemarks() => _pricingRemarks != null;

  // "quantity" field.
  String? _quantity;
  String get quantity => _quantity ?? '';
  bool hasQuantity() => _quantity != null;

  // "instruction" field.
  String? _instruction;
  String get instruction => _instruction ?? '';
  bool hasInstruction() => _instruction != null;

  // "owner_ID" field.
  String? _ownerID;
  String get ownerID => _ownerID ?? '';
  bool hasOwnerID() => _ownerID != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _type = snapshotData['type'] as String?;
    _category = snapshotData['category'] as String?;
    _price = snapshotData['price'] as String?;
    _pricingRemarks = snapshotData['pricing_remarks'] as String?;
    _quantity = snapshotData['quantity'] as String?;
    _instruction = snapshotData['instruction'] as String?;
    _ownerID = snapshotData['owner_ID'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('service_information')
          : FirebaseFirestore.instance.collectionGroup('service_information');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('service_information').doc(id);

  static Stream<ServiceInformationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceInformationRecord.fromSnapshot(s));

  static Future<ServiceInformationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServiceInformationRecord.fromSnapshot(s));

  static ServiceInformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceInformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceInformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceInformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceInformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceInformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceInformationRecordData({
  DateTime? createdTime,
  String? type,
  String? category,
  String? price,
  String? pricingRemarks,
  String? quantity,
  String? instruction,
  String? ownerID,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'type': type,
      'category': category,
      'price': price,
      'pricing_remarks': pricingRemarks,
      'quantity': quantity,
      'instruction': instruction,
      'owner_ID': ownerID,
      'isDeleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceInformationRecordDocumentEquality
    implements Equality<ServiceInformationRecord> {
  const ServiceInformationRecordDocumentEquality();

  @override
  bool equals(ServiceInformationRecord? e1, ServiceInformationRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.type == e2?.type &&
        e1?.category == e2?.category &&
        e1?.price == e2?.price &&
        e1?.pricingRemarks == e2?.pricingRemarks &&
        e1?.quantity == e2?.quantity &&
        e1?.instruction == e2?.instruction &&
        e1?.ownerID == e2?.ownerID &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(ServiceInformationRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.type,
        e?.category,
        e?.price,
        e?.pricingRemarks,
        e?.quantity,
        e?.instruction,
        e?.ownerID,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceInformationRecord;
}
