import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_schedule_details_widget.dart' show EditScheduleDetailsWidget;
import 'package:flutter/material.dart';

class EditScheduleDetailsModel
    extends FlutterFlowModel<EditScheduleDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Day widget.
  String? dayValue;
  FormFieldController<String>? dayValueController;
  // State field(s) for Barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;
  // State field(s) for waste widget.
  String? wasteValue;
  FormFieldController<String>? wasteValueController;
  // State field(s) for driver widget.
  String? driverValue;
  FormFieldController<String>? driverValueController;
  // State field(s) for collector widget.
  List<String>? collectorValue;
  FormFieldController<List<String>>? collectorValueController;
  // State field(s) for truck widget.
  String? truckValue;
  FormFieldController<String>? truckValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
