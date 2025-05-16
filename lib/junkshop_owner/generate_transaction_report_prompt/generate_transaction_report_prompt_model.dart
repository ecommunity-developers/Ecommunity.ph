import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'generate_transaction_report_prompt_widget.dart'
    show GenerateTransactionReportPromptWidget;
import 'package:flutter/material.dart';

class GenerateTransactionReportPromptModel
    extends FlutterFlowModel<GenerateTransactionReportPromptWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  DateTime? datePicked1;
  DateTime? datePicked2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
