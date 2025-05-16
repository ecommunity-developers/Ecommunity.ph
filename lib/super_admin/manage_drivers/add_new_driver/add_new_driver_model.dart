import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'add_new_driver_widget.dart' show AddNewDriverWidget;
import 'package:flutter/material.dart';

class AddNewDriverModel extends FlutterFlowModel<AddNewDriverWidget> {
  ///  Local state fields for this page.

  String? existingAcc = ' ';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for existingAcc widget.
  String? existingAccValue1;
  FormFieldController<String>? existingAccValueController1;
  // State field(s) for existingAcc widget.
  String? existingAccValue2;
  FormFieldController<String>? existingAccValueController2;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for role widget.
  String? roleValue;
  FormFieldController<String>? roleValueController;
  // State field(s) for firstName widget.
  FocusNode? firstNameFocusNode;
  TextEditingController? firstNameTextController;
  String? Function(BuildContext, String?)? firstNameTextControllerValidator;
  // State field(s) for lastName widget.
  FocusNode? lastNameFocusNode;
  TextEditingController? lastNameTextController;
  String? Function(BuildContext, String?)? lastNameTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for Gender widget.
  String? genderValue;
  FormFieldController<String>? genderValueController;
  // State field(s) for phoneNum widget.
  FocusNode? phoneNumFocusNode;
  TextEditingController? phoneNumTextController;
  String? Function(BuildContext, String?)? phoneNumTextControllerValidator;
  // State field(s) for houseNoStreet widget.
  FocusNode? houseNoStreetFocusNode;
  TextEditingController? houseNoStreetTextController;
  String? Function(BuildContext, String?)? houseNoStreetTextControllerValidator;
  // State field(s) for Barangay widget.
  String? barangayValue;
  FormFieldController<String>? barangayValueController;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for licenseNo widget.
  FocusNode? licenseNoFocusNode;
  TextEditingController? licenseNoTextController;
  String? Function(BuildContext, String?)? licenseNoTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstNameFocusNode?.dispose();
    firstNameTextController?.dispose();

    lastNameFocusNode?.dispose();
    lastNameTextController?.dispose();

    phoneNumFocusNode?.dispose();
    phoneNumTextController?.dispose();

    houseNoStreetFocusNode?.dispose();
    houseNoStreetTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();

    licenseNoFocusNode?.dispose();
    licenseNoTextController?.dispose();
  }
}
