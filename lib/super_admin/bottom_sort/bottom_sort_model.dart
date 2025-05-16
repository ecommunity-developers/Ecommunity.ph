import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'bottom_sort_widget.dart' show BottomSortWidget;
import 'package:flutter/material.dart';

class BottomSortModel extends FlutterFlowModel<BottomSortWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for RadioButton2 widget.
  FormFieldController<String>? radioButton2ValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
  String? get radioButton2Value => radioButton2ValueController?.value;
}
