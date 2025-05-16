import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'blogspot_widget.dart' show BlogspotWidget;
import 'package:flutter/material.dart';

class BlogspotModel extends FlutterFlowModel<BlogspotWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController1;
  int get tabBarCurrentIndex1 =>
      tabBarController1 != null ? tabBarController1!.index : 0;
  int get tabBarPreviousIndex1 =>
      tabBarController1 != null ? tabBarController1!.previousIndex : 0;

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<BlogspotRecord> simpleSearchResults = [];
  // State field(s) for TabBar widget.
  TabController? tabBarController2;
  int get tabBarCurrentIndex2 =>
      tabBarController2 != null ? tabBarController2!.index : 0;
  int get tabBarPreviousIndex2 =>
      tabBarController2 != null ? tabBarController2!.previousIndex : 0;

  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  LikesRecord? apiResultbhjldiscover;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  LikesRecord? apiResultbhjldiscoversearchres;
  // Stores action output result for [Backend Call - Create Document] action in Icon widget.
  LikesRecord? apiResultbhj;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController1?.dispose();
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();

    tabBarController2?.dispose();
  }
}
