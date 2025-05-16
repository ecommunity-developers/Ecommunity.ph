import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'adm_eco_reports_widget.dart' show AdmEcoReportsWidget;
import 'package:flutter/material.dart';

class AdmEcoReportsModel extends FlutterFlowModel<AdmEcoReportsWidget> {
  ///  Local state fields for this page.

  String tabCurrentPage = 'Pending';

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for pen_searchbar widget.
  FocusNode? penSearchbarFocusNode;
  TextEditingController? penSearchbarTextController;
  String? Function(BuildContext, String?)? penSearchbarTextControllerValidator;
  List<IncidentReportsRecord> simpleSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    penSearchbarFocusNode?.dispose();
    penSearchbarTextController?.dispose();

    tabBarController?.dispose();
  }
}
