import '/flutter_flow/flutter_flow_util.dart';
import 'pdf_widget.dart' show PdfWidget;
import 'package:flutter/material.dart';

class PdfModel extends FlutterFlowModel<PdfWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
