import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_accepted_junk_widget.dart' show AddAcceptedJunkWidget;
import 'package:flutter/material.dart';

class AddAcceptedJunkModel extends FlutterFlowModel<AddAcceptedJunkWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Type widget.
  String? typeValue;
  FormFieldController<String>? typeValueController;
  // State field(s) for instructions widget.
  FocusNode? instructionsFocusNode1;
  TextEditingController? instructionsTextController1;
  String? Function(BuildContext, String?)? instructionsTextController1Validator;
  // State field(s) for price widget.
  FocusNode? priceFocusNode;
  TextEditingController? priceTextController;
  String? Function(BuildContext, String?)? priceTextControllerValidator;
  // State field(s) for pricigRemarks widget.
  FocusNode? pricigRemarksFocusNode;
  TextEditingController? pricigRemarksTextController;
  String? Function(BuildContext, String?)? pricigRemarksTextControllerValidator;
  // State field(s) for Quantity widget.
  String? quantityValue;
  FormFieldController<String>? quantityValueController;
  // State field(s) for instructions widget.
  FocusNode? instructionsFocusNode2;
  TextEditingController? instructionsTextController2;
  String? Function(BuildContext, String?)? instructionsTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instructionsFocusNode1?.dispose();
    instructionsTextController1?.dispose();

    priceFocusNode?.dispose();
    priceTextController?.dispose();

    pricigRemarksFocusNode?.dispose();
    pricigRemarksTextController?.dispose();

    instructionsFocusNode2?.dispose();
    instructionsTextController2?.dispose();
  }
}
