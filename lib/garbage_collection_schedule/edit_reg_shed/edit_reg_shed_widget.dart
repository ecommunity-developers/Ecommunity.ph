import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'edit_reg_shed_model.dart';
export 'edit_reg_shed_model.dart';

class EditRegShedWidget extends StatefulWidget {
  const EditRegShedWidget({super.key});

  static String routeName = 'editRegShed';
  static String routePath = '/editRegShed';

  @override
  State<EditRegShedWidget> createState() => _EditRegShedWidgetState();
}

class _EditRegShedWidgetState extends State<EditRegShedWidget> {
  late EditRegShedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditRegShedModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/logo_4_(transparent)_1long_logo.png',
                  width: 140.0,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 5.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Text(
                            'Add Regular Schedule',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.karla(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF3D4F43),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Barangay:    ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context).primary,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(),
                              child: AuthUserStreamWidget(
                                builder: (context) => StreamBuilder<
                                    List<GarbageCollectionDateRecord>>(
                                  stream: queryGarbageCollectionDateRecord(),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50.0,
                                          height: 50.0,
                                          child: SpinKitFoldingCube(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<GarbageCollectionDateRecord>
                                        dropDownGarbageCollectionDateRecordList =
                                        snapshot.data!;

                                    return FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(
                                        _model.dropDownValue ??= valueOrDefault(
                                                    currentUserDocument
                                                        ?.userType,
                                                    '') ==
                                                'Brgy. Admin'
                                            ? valueOrDefault(
                                                currentUserDocument?.barangay,
                                                '')
                                            : null,
                                      ),
                                      options:
                                          dropDownGarbageCollectionDateRecordList
                                              .map((e) => e.barangay)
                                              .toList(),
                                      onChanged: (val) async {
                                        safeSetState(
                                            () => _model.dropDownValue = val);
                                        _model.barangay = _model.dropDownValue;
                                        safeSetState(() {});
                                        _model.monIsTapped = false;
                                        _model.tueIsTapped = false;
                                        _model.wedIsTapped = false;
                                        _model.thuIsTapped = false;
                                        _model.friIsTapped = false;
                                        _model.satIsTapped = false;
                                        _model.sunIsTapped = false;
                                        safeSetState(() {});
                                        await Future.wait([
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Monday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.monIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Tuesday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.tueIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Wednesday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.wedIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Thursday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.thuIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Friday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.friIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Saturday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.satIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (dropDownGarbageCollectionDateRecordList
                                                    .where((e) =>
                                                        (e.reference.id ==
                                                            _model
                                                                .dropDownValue) &&
                                                        (e.day.contains(
                                                                'Sunday') ==
                                                            true))
                                                    .toList()
                                                    .length ==
                                                1) {
                                              _model.sunIsTapped = true;
                                              safeSetState(() {});
                                            }
                                          }),
                                        ]);
                                      },
                                      width: 200.0,
                                      height: 40.0,
                                      searchHintTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      searchTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                      hintText: 'Please select...',
                                      searchHintText: 'Search for an item...',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      disabled: valueOrDefault(
                                              currentUserDocument?.userType,
                                              '') ==
                                          'Brgy. Admin',
                                      isOverButton: false,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if ((valueOrDefault(currentUserDocument?.userType, '') ==
                                  'Super Admin') &&
                              (_model.dropDownValue == null ||
                                  _model.dropDownValue == '')
                          ? false
                          : true)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => StreamBuilder<
                                List<GarbageCollectionDateRecord>>(
                              stream: queryGarbageCollectionDateRecord(
                                queryBuilder: (garbageCollectionDateRecord) =>
                                    garbageCollectionDateRecord.where(
                                  'barangay',
                                  isEqualTo: _model.dropDownValue,
                                ),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitFoldingCube(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<GarbageCollectionDateRecord>
                                    columnGarbageCollectionDateRecordList =
                                    snapshot.data!;
                                final columnGarbageCollectionDateRecord =
                                    columnGarbageCollectionDateRecordList
                                            .isNotEmpty
                                        ? columnGarbageCollectionDateRecordList
                                            .first
                                        : null;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 8.0),
                                        child: Text(
                                          'Choose the day/s, time, driver, collector, and truck: ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.karla(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle: FontStyle.italic,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.monIsTapped =
                                                    !_model.monIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.monIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'MON',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .monIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    parent: functions
                                                        .garbageCollectionDateDocRef(
                                                            _model
                                                                .dropDownValue),
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Monday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot1 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot1)) {
                                                            () async {
                                                              // setting up all the active dropdown
                                                              safeSetState(() {
                                                                _model
                                                                    .monValueController
                                                                    ?.reset();
                                                                _model
                                                                    .mon2ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .mon4ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .mon3ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Monday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.monValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.mon2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.mon3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.mon4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot1 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .monIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked1Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked1Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked1 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked1Time.hour,
                                                                                _datePicked1Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked1 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked1 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked1 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked1)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked2Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked2Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked2Time.hour,
                                                                                _datePicked2Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked2 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked2 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked2 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked2)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        monWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .monValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.monValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: monWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.monValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.monIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        mon2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .mon2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.mon2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: mon2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.mon2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.monIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        mon3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .mon3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.mon3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: mon3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.monIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.mon3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      mon4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .mon4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.mon4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: mon4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.mon4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.monIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.monIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.tueIsTapped =
                                                    !_model.tueIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.tueIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'TUE',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .tueIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    parent:
                                                        columnGarbageCollectionDateRecord
                                                            ?.reference,
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Tuesday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot2 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot2)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .tueValueController
                                                                    ?.reset();
                                                                _model
                                                                    .tue3ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .tue4ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .tue2ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Tuesday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.tueValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.tue2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.tue3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.tue4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot2 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .tueIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked3Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked3Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked3 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked3Time.hour,
                                                                                _datePicked3Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked3 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked3 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked3 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked3)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked4Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked4Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked4 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked4Time.hour,
                                                                                _datePicked4Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked4 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked4 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked4 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked4)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        tueWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .tueValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.tueValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: tueWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.tueValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.tueIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        tue2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .tue2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.tue2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: tue2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.tue2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.tueIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        tue3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .tue3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.tue3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: tue3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.tueIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.tue3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      tue4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .tue4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.tue4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: tue4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.tue4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.tueIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.tueIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.wedIsTapped =
                                                    !_model.wedIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.wedIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'WED',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .wedIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'barangay',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Wednesday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot3 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot3)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .wedValueController
                                                                    ?.reset();
                                                                _model
                                                                    .wed3ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .wed4ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .wed2ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Wednesday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.wedValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.wed2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.wed3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.wed4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot3 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .wedIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked5Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked5Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked5 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked5Time.hour,
                                                                                _datePicked5Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked5 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked5 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked5 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked5)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked6Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked6Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked6 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked6Time.hour,
                                                                                _datePicked6Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked6 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked6 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked6 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked6)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        wedWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .wedValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.wedValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: wedWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.wedValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.wedIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        wed2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .wed2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.wed2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: wed2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.wed2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.wedIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        wed3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .wed3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.wed3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: wed3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.wedIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.wed3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      wed4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .wed4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.wed4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: wed4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.wed4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.wedIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.wedIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.thuIsTapped =
                                                    !_model.thuIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.thuIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'THU',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .thuIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'barangay',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Thursday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot4 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot4)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .thuValueController
                                                                    ?.reset();
                                                                _model
                                                                    .thu2ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .thu3ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .thu4ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Thursday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.thuValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.thu2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.thu3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.thu4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot4 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .thuIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked7Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked7Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked7 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked7Time.hour,
                                                                                _datePicked7Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked7 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked7 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked7 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked7)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked8Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked8Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked8 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked8Time.hour,
                                                                                _datePicked8Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked8 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked8 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked8 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked8)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        thuWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .thuValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.thuValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: thuWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.thuValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.thuIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        thu2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .thu2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.thu2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: thu2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.thu2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.thuIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        thu3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .thu3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.thu3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: thu3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.thuIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.thu3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      thu4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .thu4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.thu4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: thu4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.thu4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.thuIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.thuIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.friIsTapped =
                                                    !_model.friIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.friIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'FRI',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .friIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'barangay',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Friday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot5 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot5)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .friValueController
                                                                    ?.reset();
                                                                _model
                                                                    .fri2ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .fri4ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .fri3ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Friday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.friValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.fri2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.fri3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.fri4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot5 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .friIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked9Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked9Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked9 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked9Time.hour,
                                                                                _datePicked9Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked9 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked9 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked9 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked9)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked10Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked10Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked10 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked10Time.hour,
                                                                                _datePicked10Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked10 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked10 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked10 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked10)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        friWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .friValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.friValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: friWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.friValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.friIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        fri2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .fri2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.fri2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: fri2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.fri2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.friIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        fri3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .fri3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.fri3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: fri3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.friIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.fri3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      fri4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .fri4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.fri4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: fri4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.fri4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.friIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.friIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.satIsTapped =
                                                    !_model.satIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.satIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'SAT',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .satIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'barangay',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Saturday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot6 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot6)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .satValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sat2ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sat3ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sat4ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Saturday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.satValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sat2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sat3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sat4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot6 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .satIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked11Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked11Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked11 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked11Time.hour,
                                                                                _datePicked11Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked11 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked11 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked11 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked11)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked12Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked12Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked12 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked12Time.hour,
                                                                                _datePicked12Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked12 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked12 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked12 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked12)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        satWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .satValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.satValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: satWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.satValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.satIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        sat2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .sat2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.sat2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: sat2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sat2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.satIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        sat3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .sat3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.sat3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: sat3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.satIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sat3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      sat4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .sat4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.sat4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: sat4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.sat4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.satIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.satIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 8.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                _model.sunIsTapped =
                                                    !_model.sunIsTapped;
                                                safeSetState(() {});
                                              },
                                              child: Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration: BoxDecoration(
                                                  color: _model.sunIsTapped
                                                      ? Color(0xFF00BF40)
                                                      : Color(0xFFD9D9D9),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Text(
                                                  'SUN',
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.karla(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: _model
                                                                .sunIsTapped
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                StreamBuilder<
                                                    List<
                                                        CollectionDetailsRecord>>(
                                                  stream:
                                                      queryCollectionDetailsRecord(
                                                    queryBuilder:
                                                        (collectionDetailsRecord) =>
                                                            collectionDetailsRecord
                                                                .where(
                                                                  'barangay',
                                                                  isEqualTo: _model
                                                                      .dropDownValue,
                                                                )
                                                                .where(
                                                                  'day',
                                                                  isEqualTo:
                                                                      'Sunday',
                                                                )
                                                                .orderBy(
                                                                    'time_created',
                                                                    descending:
                                                                        true),
                                                    singleRecord: true,
                                                  )..listen((snapshot) {
                                                          List<CollectionDetailsRecord>
                                                              containerCollectionDetailsRecordList =
                                                              snapshot;
                                                          final containerCollectionDetailsRecord =
                                                              containerCollectionDetailsRecordList
                                                                      .isNotEmpty
                                                                  ? containerCollectionDetailsRecordList
                                                                      .first
                                                                  : null;
                                                          if (_model.containerPreviousSnapshot7 !=
                                                                  null &&
                                                              !const ListEquality(
                                                                      CollectionDetailsRecordDocumentEquality())
                                                                  .equals(
                                                                      containerCollectionDetailsRecordList,
                                                                      _model
                                                                          .containerPreviousSnapshot7)) {
                                                            () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .sunValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sun2ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sun3ValueController
                                                                    ?.reset();
                                                                _model
                                                                    .sun4ValueController
                                                                    ?.reset();
                                                              });
                                                              if (columnGarbageCollectionDateRecord
                                                                      ?.day
                                                                      .contains(
                                                                          'Sunday') ==
                                                                  true) {
                                                                safeSetState(
                                                                    () {
                                                                  _model.sunValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .wasteType;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sun2ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truckDriver;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sun3ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .collectors;
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model.sun4ValueController
                                                                          ?.value =
                                                                      containerCollectionDetailsRecord!
                                                                          .truck;
                                                                });
                                                              }

                                                              safeSetState(
                                                                  () {});
                                                            }();
                                                          }
                                                          _model.containerPreviousSnapshot7 =
                                                              snapshot;
                                                        }),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child:
                                                              SpinKitFoldingCube(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<CollectionDetailsRecord>
                                                        containerCollectionDetailsRecordList =
                                                        snapshot.data!;
                                                    final containerCollectionDetailsRecord =
                                                        containerCollectionDetailsRecordList
                                                                .isNotEmpty
                                                            ? containerCollectionDetailsRecordList
                                                                .first
                                                            : null;

                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        border: Border.all(
                                                          color: _model
                                                                  .sunIsTapped
                                                              ? Color(
                                                                  0xFF00BF40)
                                                              : Color(
                                                                  0xFFD9D9D9),
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          15.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    'Time: ',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked13Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked13Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked13 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked13Time.hour,
                                                                                _datePicked13Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked13 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked13 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked13 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked13)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'to',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          final _datePicked14Time =
                                                                              await showTimePicker(
                                                                            context:
                                                                                context,
                                                                            initialTime:
                                                                                TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                            builder:
                                                                                (context, child) {
                                                                              return wrapInMaterialTimePickerTheme(
                                                                                context,
                                                                                child!,
                                                                                headerBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                headerForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                      font: GoogleFonts.karla(
                                                                                        fontWeight: FontWeight.w600,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                      ),
                                                                                      fontSize: 32.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                    ),
                                                                                pickerBackgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                pickerForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                selectedDateTimeBackgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                selectedDateTimeForegroundColor: FlutterFlowTheme.of(context).info,
                                                                                actionButtonForegroundColor: FlutterFlowTheme.of(context).primaryText,
                                                                                iconSize: 24.0,
                                                                              );
                                                                            },
                                                                          );
                                                                          if (_datePicked14Time !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked14 = DateTime(
                                                                                getCurrentTimestamp.year,
                                                                                getCurrentTimestamp.month,
                                                                                getCurrentTimestamp.day,
                                                                                _datePicked14Time.hour,
                                                                                _datePicked14Time.minute,
                                                                              );
                                                                            });
                                                                          } else if (_model.datePicked14 !=
                                                                              null) {
                                                                            safeSetState(() {
                                                                              _model.datePicked14 = getCurrentTimestamp;
                                                                            });
                                                                          }
                                                                        },
                                                                        text: _model.datePicked14 !=
                                                                                null
                                                                            ? dateTimeFormat("jm",
                                                                                _model.datePicked14)
                                                                            : 'Set',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          height:
                                                                              25.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                              ),
                                                                          elevation:
                                                                              3.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        WasteTypeRecord>>(
                                                                  stream:
                                                                      queryWasteTypeRecord(),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<WasteTypeRecord>
                                                                        sunWasteTypeRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .sunValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.sunValue ??=
                                                                            containerCollectionDetailsRecord?.wasteType,
                                                                      ),
                                                                      options: sunWasteTypeRecordList
                                                                          .map((e) =>
                                                                              e.typeName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sunValue = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Type',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.sunIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Driver',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        sun2UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      controller: _model
                                                                              .sun2ValueController ??=
                                                                          FormFieldController<
                                                                              String>(
                                                                        _model.sun2Value ??=
                                                                            containerCollectionDetailsRecord?.truckDriver,
                                                                      ),
                                                                      options: sun2UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      onChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sun2Value = val),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Driver',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.sunIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          false,
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        UserRecord>>(
                                                                  stream:
                                                                      queryUserRecord(
                                                                    queryBuilder:
                                                                        (userRecord) =>
                                                                            userRecord.where(
                                                                      'user_type',
                                                                      isEqualTo:
                                                                          'Collector',
                                                                    ),
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitFoldingCube(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<UserRecord>
                                                                        sun3UserRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return FlutterFlowDropDown<
                                                                        String>(
                                                                      multiSelectController: _model
                                                                          .sun3ValueController ??= FormListFieldController<
                                                                              String>(
                                                                          _model.sun3Value ??=
                                                                              List<String>.from(
                                                                        containerCollectionDetailsRecord?.collectors ??
                                                                            [],
                                                                      )),
                                                                      options: sun3UserRecordList
                                                                          .map((e) =>
                                                                              e.firstName)
                                                                          .toList(),
                                                                      height:
                                                                          40.0,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.karla(
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                      hintText:
                                                                          'Choose Collector',
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .keyboard_arrow_down_rounded,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryBackground,
                                                                      elevation:
                                                                          2.0,
                                                                      borderColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .alternate,
                                                                      borderWidth:
                                                                          2.0,
                                                                      borderRadius:
                                                                          8.0,
                                                                      margin: EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          4.0,
                                                                          16.0,
                                                                          4.0),
                                                                      hidesUnderline:
                                                                          true,
                                                                      disabled:
                                                                          _model.sunIsTapped ==
                                                                              false,
                                                                      isOverButton:
                                                                          false,
                                                                      isSearchable:
                                                                          false,
                                                                      isMultiSelect:
                                                                          true,
                                                                      onMultiSelectChanged:
                                                                          (val) =>
                                                                              safeSetState(() => _model.sun3Value = val),
                                                                    );
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TrucksRecord>>(
                                                                stream:
                                                                    queryTrucksRecord(),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitFoldingCube(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TrucksRecord>
                                                                      sun4TrucksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return FlutterFlowDropDown<
                                                                      String>(
                                                                    controller: _model
                                                                            .sun4ValueController ??=
                                                                        FormFieldController<
                                                                            String>(
                                                                      _model.sun4Value ??=
                                                                          containerCollectionDetailsRecord
                                                                              ?.truck,
                                                                    ),
                                                                    options: sun4TrucksRecordList
                                                                        .where((e) =>
                                                                            e.barangay ==
                                                                            _model
                                                                                .barangay)
                                                                        .toList()
                                                                        .map((e) =>
                                                                            e.plateNumber)
                                                                        .toList(),
                                                                    onChanged: (val) =>
                                                                        safeSetState(() =>
                                                                            _model.sun4Value =
                                                                                val),
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Choose Truck',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        2.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            4.0,
                                                                            16.0,
                                                                            4.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    disabled:
                                                                        _model.sunIsTapped ==
                                                                            false,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                if (_model.sunIsTapped == false)
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Please choose a day first',
                                                            style: TextStyle(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .error,
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 248.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x568EAA92),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(
                                          'Are you sure you want to discard this?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Yes, Discard'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              context.safePop();
                            }
                          },
                          text: 'CANCEL',
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  font: GoogleFonts.karla(
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.normal,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).secondaryText,
                              width: 0.3,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: StreamBuilder<List<GarbageCollectionDateRecord>>(
                          stream: queryGarbageCollectionDateRecord(
                            queryBuilder: (garbageCollectionDateRecord) =>
                                garbageCollectionDateRecord.where(
                              'barangay',
                              isEqualTo: _model.dropDownValue,
                            ),
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitFoldingCube(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<GarbageCollectionDateRecord>
                                buttonGarbageCollectionDateRecordList =
                                snapshot.data!;
                            final buttonGarbageCollectionDateRecord =
                                buttonGarbageCollectionDateRecordList.isNotEmpty
                                    ? buttonGarbageCollectionDateRecordList
                                        .first
                                    : null;

                            return FFButtonWidget(
                              onPressed: () async {
                                if (_model.dropDownValue != null &&
                                    _model.dropDownValue != '') {
                                  if (functions.allTappedShouldHaveAValue(
                                      _model.monIsTapped,
                                      _model.tueIsTapped,
                                      _model.wedIsTapped,
                                      _model.thuIsTapped,
                                      _model.friIsTapped,
                                      _model.satIsTapped,
                                      _model.sunIsTapped,
                                      _model.monValue,
                                      _model.mon2Value,
                                      _model.mon3Value?.toList(),
                                      _model.mon4Value,
                                      _model.tueValue,
                                      _model.tue2Value,
                                      _model.tue3Value?.toList(),
                                      _model.tue4Value,
                                      _model.wedValue,
                                      _model.wed2Value,
                                      _model.wed3Value?.toList(),
                                      _model.wed4Value,
                                      _model.thuValue,
                                      _model.thu2Value,
                                      _model.thu3Value?.toList(),
                                      _model.thu4Value,
                                      _model.friValue,
                                      _model.fri2Value,
                                      _model.fri3Value?.toList(),
                                      _model.fri4Value,
                                      _model.satValue,
                                      _model.sat2Value,
                                      _model.sat3Value?.toList(),
                                      _model.sat4Value,
                                      _model.sunValue,
                                      _model.sun2Value,
                                      _model.sun3Value?.toList(),
                                      _model.sun4Value,
                                      _model.datePicked1,
                                      _model.datePicked2,
                                      _model.datePicked3,
                                      _model.datePicked4,
                                      _model.datePicked5,
                                      _model.datePicked6,
                                      _model.datePicked7,
                                      _model.datePicked8,
                                      _model.datePicked9,
                                      _model.datePicked10,
                                      _model.datePicked11,
                                      _model.datePicked12,
                                      _model.datePicked13,
                                      _model.datePicked14)!) {
                                    if ((_model.monIsTapped == false) &&
                                        (_model.tueIsTapped == false) &&
                                        (_model.wedIsTapped == false) &&
                                        (_model.thuIsTapped == false) &&
                                        (_model.friIsTapped == false) &&
                                        (_model.satIsTapped == false) &&
                                        (_model.sunIsTapped == false)) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Please choose at least one day',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                    } else {
                                      var confirmDialogResponse =
                                          await showDialog<bool>(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    content: Text(
                                                        'Are you sure you want to update ${_model.dropDownValue}\'s waste collection schedule?'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                false),
                                                        child: Text('Cancel'),
                                                      ),
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                alertDialogContext,
                                                                true),
                                                        child: Text('Confirm'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await Future.wait([
                                          Future(() async {
                                            if (_model.monIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Monday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart: _model.datePicked1,
                                                  timeEnd: _model.datePicked2,
                                                  wasteType: _model.monValue,
                                                  truckDriver: _model.mon2Value,
                                                  truck: _model.mon4Value,
                                                  day: 'Monday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.mon3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Monday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.tueIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Tuesday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart: _model.datePicked3,
                                                  timeEnd: _model.datePicked4,
                                                  wasteType: _model.tueValue,
                                                  truckDriver: _model.tue2Value,
                                                  truck: _model.tue4Value,
                                                  day: 'Tuesday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.tue3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Tuesday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.wedIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Wednesday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart: _model.datePicked5,
                                                  timeEnd: _model.datePicked6,
                                                  wasteType: _model.wedValue,
                                                  truckDriver: _model.wed2Value,
                                                  truck: _model.wed4Value,
                                                  day: 'Wednesday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.wed3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Wednesday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.thuIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Thursday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart: _model.datePicked7,
                                                  timeEnd: _model.datePicked8,
                                                  wasteType: _model.thuValue,
                                                  truckDriver: _model.thu2Value,
                                                  truck: _model.thu4Value,
                                                  day: 'Thursday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.thu3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Thursday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.friIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Friday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart: _model.datePicked9,
                                                  timeEnd: _model.datePicked10,
                                                  wasteType: _model.friValue,
                                                  truckDriver: _model.fri2Value,
                                                  truck: _model.fri4Value,
                                                  day: 'Friday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.fri3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Friday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.satIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Saturday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart:
                                                      _model.datePicked11,
                                                  timeEnd: _model.datePicked12,
                                                  wasteType: _model.satValue,
                                                  truckDriver: _model.sat2Value,
                                                  truck: _model.sat4Value,
                                                  day: 'Saturday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.sat3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Saturday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                          Future(() async {
                                            if (_model.sunIsTapped == true) {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayUnion(
                                                            ['Sunday']),
                                                  },
                                                ),
                                              });

                                              await CollectionDetailsRecord
                                                      .createDoc(
                                                          buttonGarbageCollectionDateRecord
                                                              .reference)
                                                  .set({
                                                ...createCollectionDetailsRecordData(
                                                  timeStart:
                                                      _model.datePicked13,
                                                  timeEnd: _model.datePicked14,
                                                  wasteType: _model.sunValue,
                                                  truckDriver: _model.sun2Value,
                                                  truck: _model.sun4Value,
                                                  day: 'Sunday',
                                                  addedBy:
                                                      '${valueOrDefault(currentUserDocument?.userType, '')} - ${valueOrDefault(currentUserDocument?.firstName, '')} ${valueOrDefault(currentUserDocument?.lastName, '')}',
                                                  barangay:
                                                      _model.dropDownValue,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'collectors':
                                                        _model.sun3Value,
                                                    'time_created': FieldValue
                                                        .serverTimestamp(),
                                                  },
                                                ),
                                              });
                                            } else {
                                              await buttonGarbageCollectionDateRecord!
                                                  .reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'day':
                                                        FieldValue.arrayRemove(
                                                            ['Sunday']),
                                                  },
                                                ),
                                              });
                                            }
                                          }),
                                        ]);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              '${_model.dropDownValue}\'s collection schedule has been updated.',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                            ),
                                            duration:
                                                Duration(milliseconds: 2000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                        context.safePop();
                                      }
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please put values on your chosen day.',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context).error,
                                      ),
                                    );
                                  }
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Choose a baranggay',
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                        ),
                                      ),
                                      duration: Duration(milliseconds: 2000),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                  );
                                }
                              },
                              text: 'UPDATE',
                              options: FFButtonOptions(
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: Color(0xFF00BF40),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      font: GoogleFonts.karla(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
