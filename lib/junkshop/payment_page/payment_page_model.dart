import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:flutter/material.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for refereneceNo widget.
  FocusNode? refereneceNoFocusNode;
  TextEditingController? refereneceNoTextController;
  String? Function(BuildContext, String?)? refereneceNoTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for receiptNo widget.
  FocusNode? receiptNoFocusNode;
  TextEditingController? receiptNoTextController;
  String? Function(BuildContext, String?)? receiptNoTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    refereneceNoFocusNode?.dispose();
    refereneceNoTextController?.dispose();

    receiptNoFocusNode?.dispose();
    receiptNoTextController?.dispose();
  }
}
