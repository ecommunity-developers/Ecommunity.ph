import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'collection_history_widget.dart' show CollectionHistoryWidget;
import 'package:flutter/material.dart';

class CollectionHistoryModel extends FlutterFlowModel<CollectionHistoryWidget> {
  ///  Local state fields for this page.

  bool? isSearching;

  ///  State fields for stateful widgets in this page.

  // State field(s) for searchbar widget.
  FocusNode? searchbarFocusNode;
  TextEditingController? searchbarTextController;
  String? Function(BuildContext, String?)? searchbarTextControllerValidator;
  List<DriverCollectionHistoryRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchbarFocusNode?.dispose();
    searchbarTextController?.dispose();
  }
}
