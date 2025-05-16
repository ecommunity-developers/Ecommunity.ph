import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'auction_items_tables_widget.dart' show AuctionItemsTablesWidget;
import 'package:flutter/material.dart';

class AuctionItemsTablesModel
    extends FlutterFlowModel<AuctionItemsTablesWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<AuctionItemsStruct>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
