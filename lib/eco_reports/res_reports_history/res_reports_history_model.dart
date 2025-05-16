import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'res_reports_history_widget.dart' show ResReportsHistoryWidget;
import 'package:flutter/material.dart';

class ResReportsHistoryModel extends FlutterFlowModel<ResReportsHistoryWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchbar widget.
  FocusNode? searchbarFocusNode;
  TextEditingController? searchbarTextController;
  String? Function(BuildContext, String?)? searchbarTextControllerValidator;
  List<IncidentReportsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchbarFocusNode?.dispose();
    searchbarTextController?.dispose();
  }
}
