import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'request_widget.dart' show RequestWidget;
import 'package:flutter/material.dart';

class RequestModel extends FlutterFlowModel<RequestWidget> {
  ///  Local state fields for this component.

  bool accepted = false;

  bool? appointStaffState = false;

  String? staffRef;

  ///  State fields for stateful widgets in this component.

  JunkshopAppointmentsRecord? containerPreviousSnapshot;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
