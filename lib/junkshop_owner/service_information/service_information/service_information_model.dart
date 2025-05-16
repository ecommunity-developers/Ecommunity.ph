import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'service_information_widget.dart' show ServiceInformationWidget;
import 'package:flutter/material.dart';

class ServiceInformationModel
    extends FlutterFlowModel<ServiceInformationWidget> {
  ///  Local state fields for this page.

  bool? editInstructions = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
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
