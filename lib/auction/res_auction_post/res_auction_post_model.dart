import '/auction/auction_items_tables/auction_items_tables_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'res_auction_post_widget.dart' show ResAuctionPostWidget;
import 'package:flutter/material.dart';

class ResAuctionPostModel extends FlutterFlowModel<ResAuctionPostWidget> {
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
