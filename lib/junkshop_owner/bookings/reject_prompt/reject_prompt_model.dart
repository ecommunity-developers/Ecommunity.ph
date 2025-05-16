import '/flutter_flow/flutter_flow_util.dart';
import 'reject_prompt_widget.dart' show RejectPromptWidget;
import 'package:flutter/material.dart';

class RejectPromptModel extends FlutterFlowModel<RejectPromptWidget> {
  ///  State fields for stateful widgets in this component.

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
