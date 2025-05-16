import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'manage_admin_page_widget.dart' show ManageAdminPageWidget;
import 'package:flutter/material.dart';

class ManageAdminPageModel extends FlutterFlowModel<ManageAdminPageWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  String rb1 = 'Registration Date';

  String rb2 = 'Ascending Order';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<UserRecord> simpleSearchResults = [];
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
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    tabBarController?.dispose();
  }
}
