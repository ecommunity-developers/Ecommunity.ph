import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'j_s_transactions_widget.dart' show JSTransactionsWidget;
import 'package:flutter/material.dart';

class JSTransactionsModel extends FlutterFlowModel<JSTransactionsWidget> {
  ///  Local state fields for this page.

  bool payables = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
  }
}
