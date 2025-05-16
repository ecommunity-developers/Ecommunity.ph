import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'junkshops_widget.dart' show JunkshopsWidget;
import 'package:flutter/material.dart';

class JunkshopsModel extends FlutterFlowModel<JunkshopsWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  String rb1 = 'Registration Date';

  String rb2 = 'Ascending Order';

  bool sortByNearest = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode1;
  TextEditingController? searchFieldTextController1;
  String? Function(BuildContext, String?)? searchFieldTextController1Validator;
  List<JunkshopRecord> simpleSearchResults1 = [];
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode2;
  TextEditingController? searchFieldTextController2;
  String? Function(BuildContext, String?)? searchFieldTextController2Validator;
  List<JunkshopAppointmentsRecord> simpleSearchResults2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    searchFieldFocusNode1?.dispose();
    searchFieldTextController1?.dispose();

    searchFieldFocusNode2?.dispose();
    searchFieldTextController2?.dispose();
  }
}
