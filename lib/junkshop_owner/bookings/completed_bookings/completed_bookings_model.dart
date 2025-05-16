import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'completed_bookings_widget.dart' show CompletedBookingsWidget;
import 'package:flutter/material.dart';

class CompletedBookingsModel extends FlutterFlowModel<CompletedBookingsWidget> {
  ///  Local state fields for this page.

  bool isSearching = false;

  String currentClicked = 'Requests';

  ///  State fields for stateful widgets in this page.

  // State field(s) for SearchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;
  List<JunkshopAppointmentsRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
