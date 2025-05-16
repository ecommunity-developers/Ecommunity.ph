import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'j_s_find_post_widget.dart' show JSFindPostWidget;
import 'package:flutter/material.dart';

class JSFindPostModel extends FlutterFlowModel<JSFindPostWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<AuctionRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
