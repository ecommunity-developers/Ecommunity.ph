import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'accepted_junk_page_widget.dart' show AcceptedJunkPageWidget;
import 'package:flutter/material.dart';

class AcceptedJunkPageModel extends FlutterFlowModel<AcceptedJunkPageWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  int? userCount;

  bool isCancelled = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for plastic widget.
  FocusNode? plasticFocusNode1;
  TextEditingController? plasticTextController1;
  String? Function(BuildContext, String?)? plasticTextController1Validator;
  // State field(s) for paper widget.
  FocusNode? paperFocusNode;
  TextEditingController? paperTextController;
  String? Function(BuildContext, String?)? paperTextControllerValidator;
  // State field(s) for glass widget.
  FocusNode? glassFocusNode;
  TextEditingController? glassTextController;
  String? Function(BuildContext, String?)? glassTextControllerValidator;
  // State field(s) for metal widget.
  FocusNode? metalFocusNode;
  TextEditingController? metalTextController;
  String? Function(BuildContext, String?)? metalTextControllerValidator;
  // State field(s) for ewaste widget.
  FocusNode? ewasteFocusNode;
  TextEditingController? ewasteTextController;
  String? Function(BuildContext, String?)? ewasteTextControllerValidator;
  // State field(s) for plastic widget.
  FocusNode? plasticFocusNode2;
  TextEditingController? plasticTextController2;
  String? Function(BuildContext, String?)? plasticTextController2Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    plasticFocusNode1?.dispose();
    plasticTextController1?.dispose();

    paperFocusNode?.dispose();
    paperTextController?.dispose();

    glassFocusNode?.dispose();
    glassTextController?.dispose();

    metalFocusNode?.dispose();
    metalTextController?.dispose();

    ewasteFocusNode?.dispose();
    ewasteTextController?.dispose();

    plasticFocusNode2?.dispose();
    plasticTextController2?.dispose();
  }
}
