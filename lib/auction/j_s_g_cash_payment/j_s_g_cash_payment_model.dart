import '/flutter_flow/flutter_flow_util.dart';
import 'j_s_g_cash_payment_widget.dart' show JSGCashPaymentWidget;
import 'package:flutter/material.dart';

class JSGCashPaymentModel extends FlutterFlowModel<JSGCashPaymentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for refNum widget.
  FocusNode? refNumFocusNode;
  TextEditingController? refNumTextController;
  String? Function(BuildContext, String?)? refNumTextControllerValidator;
  String? _refNumTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Reference Number is required.';
    }

    return null;
  }

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'OR No. is required.';
    }

    return null;
  }

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {
    refNumTextControllerValidator = _refNumTextControllerValidator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    refNumFocusNode?.dispose();
    refNumTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
