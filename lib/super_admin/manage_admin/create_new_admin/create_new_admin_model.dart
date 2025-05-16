import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_new_admin_widget.dart' show CreateNewAdminWidget;
import 'package:flutter/material.dart';

class CreateNewAdminModel extends FlutterFlowModel<CreateNewAdminWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  int? userCount;

  String rb1 = 'Registration Date';

  String rb2 = 'Ascending Order';

  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Office widget.
  String? officeValue;
  FormFieldController<String>? officeValueController;
  // State field(s) for CENROles widget.
  FormFieldController<List<String>>? cENROlesValueController;
  List<String>? get cENROlesValues => cENROlesValueController?.value;
  set cENROlesValues(List<String>? v) => cENROlesValueController?.value = v;

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

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
    confirmPasswordVisibility = false;
  }

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
