import '/auction/auction_items_tables/auction_items_tables_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'j_s_view_payables_completed_widget.dart'
    show JSViewPayablesCompletedWidget;
import 'package:flutter/material.dart';

class JSViewPayablesCompletedModel
    extends FlutterFlowModel<JSViewPayablesCompletedWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for auctionItemsTables component.
  late AuctionItemsTablesModel auctionItemsTablesModel;

  @override
  void initState(BuildContext context) {
    auctionItemsTablesModel =
        createModel(context, () => AuctionItemsTablesModel());
  }

  @override
  void dispose() {
    auctionItemsTablesModel.dispose();
  }
}
