import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'update_junkshop_info_widget.dart' show UpdateJunkshopInfoWidget;
import 'package:flutter/material.dart';

class UpdateJunkshopInfoModel
    extends FlutterFlowModel<UpdateJunkshopInfoWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode1;
  TextEditingController? plateNumberTextController1;
  String? Function(BuildContext, String?)? plateNumberTextController1Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode2;
  TextEditingController? plateNumberTextController2;
  String? Function(BuildContext, String?)? plateNumberTextController2Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode3;
  TextEditingController? plateNumberTextController3;
  String? Function(BuildContext, String?)? plateNumberTextController3Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode4;
  TextEditingController? plateNumberTextController4;
  String? Function(BuildContext, String?)? plateNumberTextController4Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode5;
  TextEditingController? plateNumberTextController5;
  String? Function(BuildContext, String?)? plateNumberTextController5Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode6;
  TextEditingController? plateNumberTextController6;
  String? Function(BuildContext, String?)? plateNumberTextController6Validator;
  // State field(s) for plateNumber widget.
  FocusNode? plateNumberFocusNode7;
  TextEditingController? plateNumberTextController7;
  String? Function(BuildContext, String?)? plateNumberTextController7Validator;
  // State field(s) for Barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    plateNumberFocusNode1?.dispose();
    plateNumberTextController1?.dispose();

    plateNumberFocusNode2?.dispose();
    plateNumberTextController2?.dispose();

    plateNumberFocusNode3?.dispose();
    plateNumberTextController3?.dispose();

    plateNumberFocusNode4?.dispose();
    plateNumberTextController4?.dispose();

    plateNumberFocusNode5?.dispose();
    plateNumberTextController5?.dispose();

    plateNumberFocusNode6?.dispose();
    plateNumberTextController6?.dispose();

    plateNumberFocusNode7?.dispose();
    plateNumberTextController7?.dispose();
  }
}
