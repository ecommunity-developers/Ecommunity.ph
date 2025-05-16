import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auction_items_tables_model.dart';
export 'auction_items_tables_model.dart';

class AuctionItemsTablesWidget extends StatefulWidget {
  const AuctionItemsTablesWidget({
    super.key,
    required this.itemsDataType,
  });

  final List<AuctionItemsStruct>? itemsDataType;

  @override
  State<AuctionItemsTablesWidget> createState() =>
      _AuctionItemsTablesWidgetState();
}

class _AuctionItemsTablesWidgetState extends State<AuctionItemsTablesWidget> {
  late AuctionItemsTablesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuctionItemsTablesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final items = widget.itemsDataType!.toList();

        return FlutterFlowDataTable<AuctionItemsStruct>(
          controller: _model.paginatedDataTableController,
          data: items,
          columnsBuilder: (onSortChanged) => [
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    '#',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.karla(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FontStyle.italic,
                          ),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              fixedWidth: 30.0,
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Text(
                  'Item Name',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        font: GoogleFonts.karla(
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).labelLarge.fontWeight,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            ),
            DataColumn2(
              label: DefaultTextStyle.merge(
                softWrap: true,
                child: Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Quantity',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          font: GoogleFonts.karla(
                            fontWeight: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontWeight,
                            fontStyle: FontStyle.italic,
                          ),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .labelLarge
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ),
              ),
              fixedWidth: 65.0,
            ),
          ],
          dataRowBuilder: (itemsItem, itemsIndex, selected, onSelectChanged) =>
              DataRow(
            cells: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  functions.indexPlusOne(itemsIndex).toString(),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.karla(
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primary,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Text(
                  itemsItem.itemName,
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.karla(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  itemsItem.itemQuantity.toString(),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.karla(
                          fontWeight: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                ),
              ),
            ].map((c) => DataCell(c)).toList(),
          ),
          paginated: false,
          selectable: false,
          headingRowHeight: 40.0,
          dataRowHeight: 40.0,
          columnSpacing: 10.0,
          headingRowColor: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(8.0),
          addHorizontalDivider: false,
          addTopAndBottomDivider: false,
          hideDefaultHorizontalDivider: false,
          addVerticalDivider: false,
        );
      },
    );
  }
}
