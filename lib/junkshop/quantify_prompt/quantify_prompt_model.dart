import '/flutter_flow/flutter_flow_util.dart';
import 'quantify_prompt_widget.dart' show QuantifyPromptWidget;
import 'package:flutter/material.dart';

class QuantifyPromptModel extends FlutterFlowModel<QuantifyPromptWidget> {
  ///  Local state fields for this component.

  double? kilogram;

  double? ewastePricePerPiece;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
