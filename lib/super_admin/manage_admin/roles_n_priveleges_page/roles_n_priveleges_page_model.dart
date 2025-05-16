import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'roles_n_priveleges_page_widget.dart' show RolesNPrivelegesPageWidget;
import 'package:flutter/material.dart';

class RolesNPrivelegesPageModel
    extends FlutterFlowModel<RolesNPrivelegesPageWidget> {
  ///  Local state fields for this page.

  bool isShowFullList = true;

  int? userCount;

  String rb1 = 'Registration Date';

  String rb2 = 'Ascending Order';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CENROles widget.
  FormFieldController<List<String>>? cENROlesValueController;
  List<String>? get cENROlesValues => cENROlesValueController?.value;
  set cENROlesValues(List<String>? v) => cENROlesValueController?.value = v;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
