import '/flutter_flow/flutter_flow_util.dart';
import 'add_new_type_prompt_widget.dart' show AddNewTypePromptWidget;
import 'package:flutter/material.dart';

class AddNewTypePromptModel extends FlutterFlowModel<AddNewTypePromptWidget> {
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
