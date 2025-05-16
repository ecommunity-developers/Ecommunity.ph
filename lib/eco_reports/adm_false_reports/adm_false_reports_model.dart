import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adm_false_reports_widget.dart' show AdmFalseReportsWidget;
import 'package:flutter/material.dart';

class AdmFalseReportsModel extends FlutterFlowModel<AdmFalseReportsWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for res_searchbar widget.
  FocusNode? resSearchbarFocusNode;
  TextEditingController? resSearchbarTextController;
  String? Function(BuildContext, String?)? resSearchbarTextControllerValidator;
  List<IncidentReportsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    resSearchbarFocusNode?.dispose();
    resSearchbarTextController?.dispose();
  }
}
