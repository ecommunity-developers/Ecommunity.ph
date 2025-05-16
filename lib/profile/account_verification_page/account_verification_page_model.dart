import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'account_verification_page_widget.dart'
    show AccountVerificationPageWidget;
import 'package:flutter/material.dart';

class AccountVerificationPageModel
    extends FlutterFlowModel<AccountVerificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode1;
  TextEditingController? firstNameTextController1;
  String? Function(BuildContext, String?)? firstNameTextController1Validator;
  // State field(s) for middleName widget.
  FocusNode? middleNameFocusNode;
  TextEditingController? middleNameTextController;
  String? Function(BuildContext, String?)? middleNameTextControllerValidator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode2;
  TextEditingController? firstNameTextController2;
  String? Function(BuildContext, String?)? firstNameTextController2Validator;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode3;
  TextEditingController? firstNameTextController3;
  String? Function(BuildContext, String?)? firstNameTextController3Validator;
  DateTime? datePicked;
  // State field(s) for gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for streetHouseNo widget.
  FocusNode? streetHouseNoFocusNode;
  TextEditingController? streetHouseNoTextController;
  String? Function(BuildContext, String?)? streetHouseNoTextControllerValidator;
  // State field(s) for Barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;
  // State field(s) for id_type widget.
  String? idTypeValue;
  FormFieldController<String>? idTypeValueController;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode4;
  TextEditingController? firstNameTextController4;
  String? Function(BuildContext, String?)? firstNameTextController4Validator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode1?.dispose();
    firstNameTextController1?.dispose();

    middleNameFocusNode?.dispose();
    middleNameTextController?.dispose();

    firstNameFocusNode2?.dispose();
    firstNameTextController2?.dispose();

    firstNameFocusNode3?.dispose();
    firstNameTextController3?.dispose();

    streetHouseNoFocusNode?.dispose();
    streetHouseNoTextController?.dispose();

    firstNameFocusNode4?.dispose();
    firstNameTextController4?.dispose();
  }
}
