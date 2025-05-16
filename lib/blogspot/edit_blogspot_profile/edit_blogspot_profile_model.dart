import '/flutter_flow/flutter_flow_util.dart';
import 'edit_blogspot_profile_widget.dart' show EditBlogspotProfileWidget;
import 'package:flutter/material.dart';

class EditBlogspotProfileModel
    extends FlutterFlowModel<EditBlogspotProfileWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
