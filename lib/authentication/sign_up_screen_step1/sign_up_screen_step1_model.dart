import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'sign_up_screen_step1_widget.dart' show SignUpScreenStep1Widget;
import 'package:flutter/material.dart';

class SignUpScreenStep1Model extends FlutterFlowModel<SignUpScreenStep1Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  }
}
