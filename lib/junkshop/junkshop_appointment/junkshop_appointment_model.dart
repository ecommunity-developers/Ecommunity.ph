import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'junkshop_appointment_widget.dart' show JunkshopAppointmentWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JunkshopAppointmentModel
    extends FlutterFlowModel<JunkshopAppointmentWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for MOP widget.
  FormFieldController<String>? mopValueController;
  // State field(s) for plasticBool widget.
  bool? plasticBoolValue;
  // State field(s) for plastic widget.
  List<String>? plasticValue;
  FormFieldController<List<String>>? plasticValueController;
  // State field(s) for glassBool widget.
  bool? glassBoolValue;
  // State field(s) for glass widget.
  List<String>? glassValue;
  FormFieldController<List<String>>? glassValueController;
  // State field(s) for paperBool widget.
  bool? paperBoolValue;
  // State field(s) for paper widget.
  List<String>? paperValue;
  FormFieldController<List<String>>? paperValueController;
  // State field(s) for metalBool widget.
  bool? metalBoolValue;
  // State field(s) for metal widget.
  List<String>? metalValue;
  FormFieldController<List<String>>? metalValueController;
  // State field(s) for eWasteBool widget.
  bool? eWasteBoolValue;
  // State field(s) for ewaste widget.
  List<String>? ewasteValue;
  FormFieldController<List<String>>? ewasteValueController;
  // State field(s) for othersBool widget.
  bool? othersBoolValue;
  // State field(s) for others widget.
  List<String>? othersValue;
  FormFieldController<List<String>>? othersValueController;
  // State field(s) for modeOfCollection widget.
  FormFieldController<String>? modeOfCollectionValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get mopValue => mopValueController?.value;
  String? get modeOfCollectionValue => modeOfCollectionValueController?.value;
}
