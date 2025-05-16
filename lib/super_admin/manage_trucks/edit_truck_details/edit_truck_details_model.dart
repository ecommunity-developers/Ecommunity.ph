import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_truck_details_widget.dart' show EditTruckDetailsWidget;
import 'package:flutter/material.dart';

class EditTruckDetailsModel extends FlutterFlowModel<EditTruckDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode;
  TextEditingController? plateNumberTextController;
  String? Function(BuildContext, String?)? plateNumberTextControllerValidator;
  // State field(s) for type widget.
  FocusNode? typeFocusNode;
  TextEditingController? typeTextController;
  String? Function(BuildContext, String?)? typeTextControllerValidator;
  // State field(s) for chasisNumber widget.
  FocusNode? chasisNumberFocusNode;
  TextEditingController? chasisNumberTextController;
  String? Function(BuildContext, String?)? chasisNumberTextControllerValidator;
  // State field(s) for color widget.
  FocusNode? colorFocusNode;
  TextEditingController? colorTextController;
  String? Function(BuildContext, String?)? colorTextControllerValidator;
  // State field(s) for brand widget.
  FocusNode? brandFocusNode;
  TextEditingController? brandTextController;
  String? Function(BuildContext, String?)? brandTextControllerValidator;
  // State field(s) for fuel widget.
  FocusNode? fuelFocusNode;
  TextEditingController? fuelTextController;
  String? Function(BuildContext, String?)? fuelTextControllerValidator;
  // State field(s) for Barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    plateNumberFocusNode?.dispose();
    plateNumberTextController?.dispose();

    typeFocusNode?.dispose();
    typeTextController?.dispose();

    chasisNumberFocusNode?.dispose();
    chasisNumberTextController?.dispose();

    colorFocusNode?.dispose();
    colorTextController?.dispose();

    brandFocusNode?.dispose();
    brandTextController?.dispose();

    fuelFocusNode?.dispose();
    fuelTextController?.dispose();
  }
}
