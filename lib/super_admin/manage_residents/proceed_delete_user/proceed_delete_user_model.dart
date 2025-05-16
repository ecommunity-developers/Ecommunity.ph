import '/flutter_flow/flutter_flow_util.dart';
import 'proceed_delete_user_widget.dart' show ProceedDeleteUserWidget;
import 'package:flutter/material.dart';

class ProceedDeleteUserModel extends FlutterFlowModel<ProceedDeleteUserWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
