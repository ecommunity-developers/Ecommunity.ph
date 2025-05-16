import '/flutter_flow/flutter_flow_util.dart';
import 'cancel_prompt_copy_widget.dart' show CancelPromptCopyWidget;
import 'package:flutter/material.dart';

class CancelPromptCopyModel extends FlutterFlowModel<CancelPromptCopyWidget> {
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
