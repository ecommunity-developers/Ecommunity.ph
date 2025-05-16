import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'my_appointment_widget.dart' show MyAppointmentWidget;
import 'package:flutter/material.dart';

class MyAppointmentModel extends FlutterFlowModel<MyAppointmentWidget> {
  ///  Local state fields for this page.

  bool? editing = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for chosenStaff widget.
  String? chosenStaffValue;
  FormFieldController<String>? chosenStaffValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
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
