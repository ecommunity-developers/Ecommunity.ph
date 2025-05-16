import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sched_viewing_widget.dart' show SchedViewingWidget;
import 'package:flutter/material.dart';

class SchedViewingModel extends FlutterFlowModel<SchedViewingWidget> {
  ///  Local state fields for this page.

  bool tooltipShowing = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<GarbageCollectionDateRecord>();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<GarbageCollectionDateRecord>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController1.dispose();
    paginatedDataTableController2.dispose();
  }
}
