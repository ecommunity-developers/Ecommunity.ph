import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'collection_records_widget.dart' show CollectionRecordsWidget;
import 'package:flutter/material.dart';

class CollectionRecordsModel extends FlutterFlowModel<CollectionRecordsWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
