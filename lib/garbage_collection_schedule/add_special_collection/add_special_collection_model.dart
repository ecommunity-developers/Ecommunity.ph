import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_special_collection_widget.dart' show AddSpecialCollectionWidget;
import 'package:flutter/material.dart';

class AddSpecialCollectionModel
    extends FlutterFlowModel<AddSpecialCollectionWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  // State field(s) for brgy widget.
  String? brgyValue;
  FormFieldController<String>? brgyValueController;
  // State field(s) for mon widget.
  String? monValue;
  FormFieldController<String>? monValueController;
  // State field(s) for driver widget.
  String? driverValue;
  FormFieldController<String>? driverValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  GarbageCollectionDateRecord? garbageCollectionDate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
