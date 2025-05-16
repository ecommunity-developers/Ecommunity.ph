import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_screen_step2_widget.dart' show SignUpScreenStep2Widget;
import 'package:flutter/material.dart';

class SignUpScreenStep2Model extends FlutterFlowModel<SignUpScreenStep2Widget> {
  ///  Local state fields for this page.

  String? paswordStrength;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameTextController;
  String? Function(BuildContext, String?)? usernameTextControllerValidator;
  // State field(s) for emailAdd widget.
  FocusNode? emailAddFocusNode;
  TextEditingController? emailAddTextController;
  String? Function(BuildContext, String?)? emailAddTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordTextController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordTextControllerValidator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

  @override
  void dispose() {
    usernameFocusNode?.dispose();
    usernameTextController?.dispose();

    emailAddFocusNode?.dispose();
    emailAddTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordTextController?.dispose();
  }
}
