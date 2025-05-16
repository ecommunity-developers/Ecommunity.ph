import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_announcements_widget.dart' show AllAnnouncementsWidget;
import 'package:flutter/material.dart';

class AllAnnouncementsModel extends FlutterFlowModel<AllAnnouncementsWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchbar widget.
  FocusNode? searchbarFocusNode;
  TextEditingController? searchbarTextController;
  String? Function(BuildContext, String?)? searchbarTextControllerValidator;
  List<BrgyAnnouncementsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchbarFocusNode?.dispose();
    searchbarTextController?.dispose();
  }
}
