import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'manage_verification_widget.dart' show ManageVerificationWidget;
import 'package:flutter/material.dart';

class ManageVerificationModel
    extends FlutterFlowModel<ManageVerificationWidget> {
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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
