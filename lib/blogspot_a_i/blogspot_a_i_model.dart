import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'blogspot_a_i_widget.dart' show BlogspotAIWidget;
import 'package:flutter/material.dart';

class BlogspotAIModel extends FlutterFlowModel<BlogspotAIWidget> {
  ///  Local state fields for this page.

  FFUploadedFile? image;

  String? message;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? q1;
  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? q2;
  // Stores action output result for [Gemini - Generate Text] action in Container widget.
  String? q3;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // State field(s) for question widget.
  FocusNode? questionFocusNode;
  TextEditingController? questionTextController;
  String? Function(BuildContext, String?)? questionTextControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Gemini - Text From Image] action in question widget.
  String? imageAnswerAICopySubmit;
  // Stores action output result for [Gemini - Generate Text] action in question widget.
  String? answerAICopySubmit;
  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Stores action output result for [Gemini - Text From Image] action in Icon widget.
  String? imageAnswerAI;
  // Stores action output result for [Gemini - Generate Text] action in Icon widget.
  String? answerAI;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    questionFocusNode?.dispose();
    questionTextController?.dispose();
  }
}
