import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'res_post_auction_widget.dart' show ResPostAuctionWidget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResPostAuctionModel extends FlutterFlowModel<ResPostAuctionWidget> {
  ///  Local state fields for this page.

  List<String> images = [];
  void addToImages(String item) => images.add(item);
  void removeFromImages(String item) => images.remove(item);
  void removeAtIndexFromImages(int index) => images.removeAt(index);
  void insertAtIndexInImages(int index, String item) =>
      images.insert(index, item);
  void updateImagesAtIndex(int index, Function(String) updateFn) =>
      images[index] = updateFn(images[index]);

  List<AuctionItemsStruct> items = [];
  void addToItems(AuctionItemsStruct item) => items.add(item);
  void removeFromItems(AuctionItemsStruct item) => items.remove(item);
  void removeAtIndexFromItems(int index) => items.removeAt(index);
  void insertAtIndexInItems(int index, AuctionItemsStruct item) =>
      items.insert(index, item);
  void updateItemsAtIndex(int index, Function(AuctionItemsStruct) updateFn) =>
      items[index] = updateFn(items[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter new address before posting';
    }

    return null;
  }

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AuctionItemsStruct>();
  // State field(s) for lastItem widget.
  FocusNode? lastItemFocusNode;
  TextEditingController? lastItemTextController;
  String? Function(BuildContext, String?)? lastItemTextControllerValidator;
  // State field(s) for lastItemCount widget.
  int? lastItemCountValue;
  // State field(s) for notes widget.
  FocusNode? notesFocusNode;
  TextEditingController? notesTextController;
  String? Function(BuildContext, String?)? notesTextControllerValidator;
  String? _notesTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Add message/notes to your items.';
    }

    return null;
  }

  // State field(s) for startingBid widget.
  FocusNode? startingBidFocusNode;
  TextEditingController? startingBidTextController;
  String? Function(BuildContext, String?)? startingBidTextControllerValidator;
  String? _startingBidTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Add starting bid to your auction.';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Add minimum increment to your auction.';
    }

    return null;
  }

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? auctionCollectionItemsCount;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? junkshopOwners;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    notesTextControllerValidator = _notesTextControllerValidator;
    startingBidTextControllerValidator = _startingBidTextControllerValidator;
    textController5Validator = _textController5Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    paginatedDataTableController.dispose();
    lastItemFocusNode?.dispose();
    lastItemTextController?.dispose();

    notesFocusNode?.dispose();
    notesTextController?.dispose();

    startingBidFocusNode?.dispose();
    startingBidTextController?.dispose();

    textFieldFocusNode2?.dispose();
    textController5?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
}
