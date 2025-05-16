import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/blogspot/edit_blogspot_profile/edit_blogspot_profile_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'blogspot_model.dart';
export 'blogspot_model.dart';

class BlogspotWidget extends StatefulWidget {
  const BlogspotWidget({super.key});

  static String routeName = 'blogspot';
  static String routePath = '/blogspot';

  @override
  State<BlogspotWidget> createState() => _BlogspotWidgetState();
}

class _BlogspotWidgetState extends State<BlogspotWidget>
    with TickerProviderStateMixin {
  late BlogspotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BlogspotModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.deleteDocumentsWithTodayDateDeleted();
    });

    _model.tabBarController1 = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.searchFieldTextController ??= TextEditingController();
    _model.searchFieldFocusNode ??= FocusNode();

    _model.tabBarController2 = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BlogspotRecord>>(
      stream: queryBlogspotRecord(
        queryBuilder: (blogspotRecord) =>
            blogspotRecord.orderBy('date_posted', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitFoldingCube(
                  color: FlutterFlowTheme.of(context).secondary,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<BlogspotRecord> blogspotBlogspotRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed(BlogspotAIWidget.routeName);
              },
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              elevation: 12.0,
              child: Container(
                width: 30.0,
                height: 30.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/ecommunity-awspik.appspot.com/o/gemini_icon.png?alt=media&token=ff49e268-c53b-4cb7-a7f9-292db2068729',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      'assets/images/logo_4_(transparent)_1long_logo.png',
                      width: 140.0,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        ProfilePageWidget.routeName,
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                            duration: Duration(milliseconds: 300),
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.menu,
                      color: Color(0xFF698F3F),
                      size: 24.0,
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
              child: Builder(
                builder: (context) {
                  if (valueOrDefault(currentUserDocument?.userType, '') ==
                      'Super Admin') {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 20.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            child: FlutterFlowExpandedImageView(
                                              image: Image.network(
                                                FFAppState().CenroProfilePic,
                                                fit: BoxFit.contain,
                                              ),
                                              allowRotation: false,
                                              tag: FFAppState().CenroProfilePic,
                                              useHeroAnimation: true,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Hero(
                                        tag: FFAppState().CenroProfilePic,
                                        transitionOnUserGestures: true,
                                        child: Container(
                                          width: 100.0,
                                          height: 100.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            FFAppState().CenroProfilePic,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        FFAppState().CenroDisplayName,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.karla(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          formatNumber(
                                            blogspotBlogspotRecordList
                                                .where((e) =>
                                                    (e.isArchived != true) &&
                                                    (e.isDeleted != true))
                                                .toList()
                                                .length,
                                            formatType: FormatType.decimal,
                                            decimalType: DecimalType.automatic,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.karla(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                        Text(
                                          '   posts   ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.karla(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        StreamBuilder<List<LikesRecord>>(
                                          stream: queryLikesRecord(
                                            queryBuilder: (likesRecord) =>
                                                likesRecord.whereIn(
                                                    'post_reference',
                                                    blogspotBlogspotRecordList
                                                        .where((e) =>
                                                            (e.isDeleted !=
                                                                true) &&
                                                            (e.datePosted !=
                                                                null))
                                                        .toList()
                                                        .map((e) => e.reference)
                                                        .toList()),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitFoldingCube(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<LikesRecord>
                                                textLikesRecordList =
                                                snapshot.data!;

                                            return Text(
                                              formatNumber(
                                                textLikesRecordList.length,
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.automatic,
                                              ),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                            );
                                          },
                                        ),
                                        Text(
                                          'total likes',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.karla(
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Builder(
                                  builder: (context) => Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () {
                                                  FocusScope.of(dialogContext)
                                                      .unfocus();
                                                  FocusManager
                                                      .instance.primaryFocus
                                                      ?.unfocus();
                                                },
                                                child:
                                                    EditBlogspotProfileWidget(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      text: 'Edit Profile',
                                      icon: FaIcon(
                                        FontAwesomeIcons.solidEdit,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 15.0,
                                      ),
                                      options: FFButtonOptions(
                                        height: 35.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFFEEEEEE),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.karla(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                        CreatPostPageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    text: 'Create New Post',
                                    icon: Icon(
                                      Icons.add_circle_rounded,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 18.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 35.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15.0, 0.0, 15.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFCEDFD2),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1.0,
                          thickness: 1.5,
                          color: Color(0xFFEEEEEE),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor: Color(0xFF00BF40),
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.karla(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 17.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                  indicatorColor: Color(0xFF00BF40),
                                  indicatorWeight: 3.0,
                                  tabs: [
                                    Tab(
                                      text: 'Posts',
                                    ),
                                    Tab(
                                      text: 'Archives',
                                    ),
                                    Tab(
                                      text: 'Trash',
                                    ),
                                  ],
                                  controller: _model.tabBarController1,
                                  onTap: (i) async {
                                    [
                                      () async {},
                                      () async {},
                                      () async {}
                                    ][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController1,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final posts =
                                              blogspotBlogspotRecordList
                                                  .where((e) =>
                                                      (e.isArchived != true) &&
                                                      (e.isDeleted != true))
                                                  .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: posts.length,
                                            itemBuilder: (context, postsIndex) {
                                              final postsItem =
                                                  posts[postsIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ViewPostWidget.routeName,
                                                    queryParameters: {
                                                      'postRef': serializeParam(
                                                        postsItem.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    postsItem.photoUrl,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.33,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final archives =
                                              blogspotBlogspotRecordList
                                                  .where((e) =>
                                                      e.isArchived == true)
                                                  .toList()
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.dateArchived!,
                                                      desc: false)
                                                  .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: archives.length,
                                            itemBuilder:
                                                (context, archivesIndex) {
                                              final archivesItem =
                                                  archives[archivesIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ViewPostWidget.routeName,
                                                    queryParameters: {
                                                      'postRef': serializeParam(
                                                        archivesItem.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    archivesItem.photoUrl,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.33,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Builder(
                                        builder: (context) {
                                          final trash =
                                              blogspotBlogspotRecordList
                                                  .where((e) =>
                                                      e.isDeleted == true)
                                                  .toList()
                                                  .sortedList(
                                                      keyOf: (e) =>
                                                          e.dateDeleted!,
                                                      desc: false)
                                                  .toList();

                                          return GridView.builder(
                                            padding: EdgeInsets.zero,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              crossAxisSpacing: 5.0,
                                              mainAxisSpacing: 5.0,
                                              childAspectRatio: 1.0,
                                            ),
                                            scrollDirection: Axis.vertical,
                                            itemCount: trash.length,
                                            itemBuilder: (context, trashIndex) {
                                              final trashItem =
                                                  trash[trashIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    ViewPostWidget.routeName,
                                                    queryParameters: {
                                                      'postRef': serializeParam(
                                                        trashItem.reference,
                                                        ParamType
                                                            .DocumentReference,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .rightToLeft,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    trashItem.photoUrl,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.33,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
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
                  } else {
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 10.0, 10.0, 0.0),
                          child: TextFormField(
                            controller: _model.searchFieldTextController,
                            focusNode: _model.searchFieldFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.searchFieldTextController',
                              Duration(milliseconds: 300),
                              () async {
                                safeSetState(() {
                                  _model.simpleSearchResults = TextSearch(
                                    blogspotBlogspotRecordList
                                        .where((e) =>
                                            (e.isArchived != true) &&
                                            (e.isDeleted != true))
                                        .toList()
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [
                                            record.titleOfThePost,
                                            record.description
                                          ]),
                                        )
                                        .toList(),
                                  )
                                      .search(
                                          _model.searchFieldTextController.text)
                                      .map((r) => r.object)
                                      .toList();
                                  ;
                                });
                                if (_model.searchFieldTextController.text !=
                                        '') {
                                  _model.isSearching = true;
                                  safeSetState(() {});
                                } else {
                                  _model.isSearching = false;
                                  safeSetState(() {});
                                }
                              },
                            ),
                            autofocus: false,
                            textInputAction: TextInputAction.search,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontStyle,
                                  ),
                              hintText: 'Search',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    font: GoogleFonts.karla(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .fontWeight,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    fontSize: 17.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .fontWeight,
                                    fontStyle: FontStyle.italic,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).secondary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 22.0,
                              ),
                              suffixIcon: _model.searchFieldTextController!.text
                                      .isNotEmpty
                                  ? InkWell(
                                      onTap: () async {
                                        _model.searchFieldTextController
                                            ?.clear();
                                        safeSetState(() {
                                          _model.simpleSearchResults =
                                              TextSearch(
                                            blogspotBlogspotRecordList
                                                .where((e) =>
                                                    (e.isArchived != true) &&
                                                    (e.isDeleted != true))
                                                .toList()
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    record.titleOfThePost,
                                                    record.description
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                                  .search(_model
                                                      .searchFieldTextController
                                                      .text)
                                                  .map((r) => r.object)
                                                  .toList();
                                          ;
                                        });
                                        if (_model.searchFieldTextController
                                                    .text !=
                                                '') {
                                          _model.isSearching = true;
                                          safeSetState(() {});
                                        } else {
                                          _model.isSearching = false;
                                          safeSetState(() {});
                                        }

                                        safeSetState(() {});
                                      },
                                      child: Icon(
                                        Icons.clear,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 18.0,
                                      ),
                                    )
                                  : null,
                            ),
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
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            validator: _model.searchFieldTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment(0.0, 0),
                                child: TabBar(
                                  labelColor: Color(0xFF00BF40),
                                  unselectedLabelColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryText,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        font: GoogleFonts.karla(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleMedium
                                                  .fontStyle,
                                        ),
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                  unselectedLabelStyle:
                                      FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            font: GoogleFonts.karla(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleMedium
                                                    .fontStyle,
                                          ),
                                  indicatorColor: Color(0xFF00BF40),
                                  padding: EdgeInsets.all(4.0),
                                  tabs: [
                                    Tab(
                                      text: 'Discover',
                                    ),
                                    Tab(
                                      text: 'Liked Posts',
                                    ),
                                  ],
                                  controller: _model.tabBarController2,
                                  onTap: (i) async {
                                    [() async {}, () async {}][i]();
                                  },
                                ),
                              ),
                              Expanded(
                                child: TabBarView(
                                  controller: _model.tabBarController2,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBED5C3),
                                      ),
                                      child: Builder(
                                        builder: (context) {
                                          if (_model.isSearching == true) {
                                            return Builder(
                                              builder: (context) {
                                                final allPosts = _model
                                                    .simpleSearchResults
                                                    .toList();

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        allPosts.length,
                                                        (allPostsIndex) {
                                                      final allPostsItem =
                                                          allPosts[
                                                              allPostsIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    10.0,
                                                                    10.0,
                                                                    10.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 5.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
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
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          FFAppState()
                                                                              .CenroProfilePic,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFAppState().CenroDisplayName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.karla(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '${dateTimeFormat("yMMMd", allPostsItem.datePosted)} ${dateTimeFormat("jm", allPostsItem.datePosted)}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.karla(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                allPostsItem.photoUrl,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: allPostsItem.photoUrl,
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag: allPostsItem
                                                                            .photoUrl,
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              Image.network(
                                                                            allPostsItem.photoUrl,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                300.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              LikesRecord>>(
                                                                        stream:
                                                                            queryLikesRecord(
                                                                          parent:
                                                                              allPostsItem.reference,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitFoldingCube(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LikesRecord>
                                                                              textLikesRecordList =
                                                                              snapshot.data!;

                                                                          return SelectionArea(
                                                                              child: Text(
                                                                            () {
                                                                              if (textLikesRecordList.length <= 0) {
                                                                                return 'Be the first one to like.';
                                                                              } else if (textLikesRecordList.length == 1) {
                                                                                return '${formatNumber(
                                                                                  textLikesRecordList.length,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} like';
                                                                              } else {
                                                                                return '${formatNumber(
                                                                                  textLikesRecordList.length,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} likes';
                                                                              }
                                                                            }(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.karla(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ));
                                                                        },
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              LikesRecord>>(
                                                                        stream:
                                                                            queryLikesRecord(
                                                                          parent:
                                                                              allPostsItem.reference,
                                                                          queryBuilder: (likesRecord) =>
                                                                              likesRecord.where(
                                                                            'liked_by',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitFoldingCube(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LikesRecord>
                                                                              conditionalBuilderLikesRecordList =
                                                                              snapshot.data!;
                                                                          final conditionalBuilderLikesRecord = conditionalBuilderLikesRecordList.isNotEmpty
                                                                              ? conditionalBuilderLikesRecordList.first
                                                                              : null;

                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await conditionalBuilderLikesRecord!.reference.delete();
                                                                            },
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if ((conditionalBuilderLikesRecord != null) == true) {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await conditionalBuilderLikesRecord!.reference.delete();
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.solidHeart,
                                                                                      color: Color(0xFFF9595F),
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      var likesRecordReference = LikesRecord.createDoc(
                                                                                        allPostsItem.reference,
                                                                                        id: currentUserReference!.id,
                                                                                      );
                                                                                      await likesRecordReference.set({
                                                                                        ...createLikesRecordData(
                                                                                          likedBy: currentUserReference,
                                                                                          postReference: allPostsItem.reference,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'time_liked': FieldValue.serverTimestamp(),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      _model.apiResultbhjldiscover = LikesRecord.getDocumentFromData({
                                                                                        ...createLikesRecordData(
                                                                                          likedBy: currentUserReference,
                                                                                          postReference: allPostsItem.reference,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'time_liked': DateTime.now(),
                                                                                          },
                                                                                        ),
                                                                                      }, likesRecordReference);

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.heart,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    allPostsItem
                                                                        .titleOfThePost,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  )),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    allPostsItem
                                                                        .description,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            return Builder(
                                              builder: (context) {
                                                final allPosts =
                                                    blogspotBlogspotRecordList
                                                        .where((e) =>
                                                            (e.isArchived !=
                                                                true) &&
                                                            (e.isDeleted !=
                                                                true))
                                                        .toList();

                                                return SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                            allPosts.length,
                                                            (allPostsIndex) {
                                                      final allPostsItem =
                                                          allPosts[
                                                              allPostsIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 5.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0),
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
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        clipBehavior:
                                                                            Clip.antiAlias,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          FFAppState()
                                                                              .CenroProfilePic,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text(
                                                                              FFAppState().CenroDisplayName,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.karla(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    fontSize: 18.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '${dateTimeFormat("yMMMd", allPostsItem.datePosted)} ${dateTimeFormat("jm", allPostsItem.datePosted)}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.karla(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            10.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          PageTransition(
                                                                            type:
                                                                                PageTransitionType.fade,
                                                                            child:
                                                                                FlutterFlowExpandedImageView(
                                                                              image: Image.network(
                                                                                allPostsItem.photoUrl,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                              allowRotation: false,
                                                                              tag: allPostsItem.photoUrl,
                                                                              useHeroAnimation: true,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      child:
                                                                          Hero(
                                                                        tag: allPostsItem
                                                                            .photoUrl,
                                                                        transitionOnUserGestures:
                                                                            true,
                                                                        child:
                                                                            ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          child:
                                                                              Image.network(
                                                                            allPostsItem.photoUrl,
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                300.0,
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      StreamBuilder<
                                                                          List<
                                                                              LikesRecord>>(
                                                                        stream:
                                                                            queryLikesRecord(
                                                                          parent:
                                                                              allPostsItem.reference,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitFoldingCube(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LikesRecord>
                                                                              textLikesRecordList =
                                                                              snapshot.data!;

                                                                          return SelectionArea(
                                                                              child: Text(
                                                                            () {
                                                                              if (textLikesRecordList.length <= 0) {
                                                                                return 'Be the first one to like.';
                                                                              } else if (textLikesRecordList.length == 1) {
                                                                                return '${formatNumber(
                                                                                  textLikesRecordList.length,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} like';
                                                                              } else {
                                                                                return '${formatNumber(
                                                                                  textLikesRecordList.length,
                                                                                  formatType: FormatType.decimal,
                                                                                  decimalType: DecimalType.automatic,
                                                                                )} likes';
                                                                              }
                                                                            }(),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.karla(
                                                                                    fontWeight: FontWeight.normal,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  fontSize: 15.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ));
                                                                        },
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              LikesRecord>>(
                                                                        stream:
                                                                            queryLikesRecord(
                                                                          parent:
                                                                              allPostsItem.reference,
                                                                          queryBuilder: (likesRecord) =>
                                                                              likesRecord.where(
                                                                            'liked_by',
                                                                            isEqualTo:
                                                                                currentUserReference,
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitFoldingCube(
                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<LikesRecord>
                                                                              conditionalBuilderLikesRecordList =
                                                                              snapshot.data!;
                                                                          final conditionalBuilderLikesRecord = conditionalBuilderLikesRecordList.isNotEmpty
                                                                              ? conditionalBuilderLikesRecordList.first
                                                                              : null;

                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              await conditionalBuilderLikesRecord!.reference.delete();
                                                                            },
                                                                            child:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                if ((conditionalBuilderLikesRecord != null) == true) {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await conditionalBuilderLikesRecord!.reference.delete();
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.solidHeart,
                                                                                      color: Color(0xFFF9595F),
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  );
                                                                                } else {
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      var likesRecordReference = LikesRecord.createDoc(
                                                                                        allPostsItem.reference,
                                                                                        id: currentUserReference!.id,
                                                                                      );
                                                                                      await likesRecordReference.set({
                                                                                        ...createLikesRecordData(
                                                                                          likedBy: currentUserReference,
                                                                                          postReference: allPostsItem.reference,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'time_liked': FieldValue.serverTimestamp(),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      _model.apiResultbhjldiscoversearchres = LikesRecord.getDocumentFromData({
                                                                                        ...createLikesRecordData(
                                                                                          likedBy: currentUserReference,
                                                                                          postReference: allPostsItem.reference,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'time_liked': DateTime.now(),
                                                                                          },
                                                                                        ),
                                                                                      }, likesRecordReference);

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: FaIcon(
                                                                                      FontAwesomeIcons.heart,
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  );
                                                                                }
                                                                              },
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    allPostsItem
                                                                        .titleOfThePost,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          fontSize:
                                                                              18.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  )),
                                                                  SelectionArea(
                                                                      child:
                                                                          Text(
                                                                    allPostsItem
                                                                        .description,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.karla(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  )),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    })
                                                        .divide(SizedBox(
                                                            height: 10.0))
                                                        .addToStart(SizedBox(
                                                            height: 10.0))
                                                        .addToEnd(SizedBox(
                                                            height: 50.0)),
                                                  ),
                                                );
                                              },
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFBED5C3),
                                      ),
                                      child: StreamBuilder<List<LikesRecord>>(
                                        stream: queryLikesRecord(
                                          queryBuilder: (likesRecord) =>
                                              likesRecord
                                                  .whereIn(
                                                      'post_reference',
                                                      blogspotBlogspotRecordList
                                                          .where((e) =>
                                                              (e.isArchived !=
                                                                  true) &&
                                                              (e.isDeleted !=
                                                                  true) &&
                                                              ((e != null) ==
                                                                  true))
                                                          .toList()
                                                          .map((e) =>
                                                              e.reference)
                                                          .toList())
                                                  .where(
                                                    'liked_by',
                                                    isEqualTo:
                                                        currentUserReference,
                                                  )
                                                  .orderBy('time_liked',
                                                      descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitFoldingCube(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LikesRecord>
                                              columnLikesRecordList =
                                              snapshot.data!;

                                          return SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: List
                                                      .generate(
                                                          columnLikesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                final columnLikesRecord =
                                                    columnLikesRecordList[
                                                        columnIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 10.0, 0.0),
                                                  child: StreamBuilder<
                                                      BlogspotRecord>(
                                                    stream: BlogspotRecord
                                                        .getDocument(
                                                            columnLikesRecord
                                                                .postReference!),
                                                    builder:
                                                        (context, snapshot) {
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

                                                      final containerBlogspotRecord =
                                                          snapshot.data!;

                                                      return Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 5.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
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
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .network(
                                                                        FFAppState()
                                                                            .CenroProfilePic,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            FFAppState().CenroDisplayName,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.karla(
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            '${dateTimeFormat("yMMMd", containerBlogspotRecord.datePosted)} ${dateTimeFormat("jm", containerBlogspotRecord.datePosted)}',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.karla(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      await Navigator
                                                                          .push(
                                                                        context,
                                                                        PageTransition(
                                                                          type:
                                                                              PageTransitionType.fade,
                                                                          child:
                                                                              FlutterFlowExpandedImageView(
                                                                            image:
                                                                                Image.network(
                                                                              containerBlogspotRecord.photoUrl,
                                                                              fit: BoxFit.contain,
                                                                            ),
                                                                            allowRotation:
                                                                                false,
                                                                            tag:
                                                                                containerBlogspotRecord.photoUrl,
                                                                            useHeroAnimation:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child: Hero(
                                                                      tag: containerBlogspotRecord
                                                                          .photoUrl,
                                                                      transitionOnUserGestures:
                                                                          true,
                                                                      child:
                                                                          ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child: Image
                                                                            .network(
                                                                          containerBlogspotRecord
                                                                              .photoUrl,
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              300.0,
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        List<
                                                                            LikesRecord>>(
                                                                      stream:
                                                                          queryLikesRecord(
                                                                        parent:
                                                                            containerBlogspotRecord.reference,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitFoldingCube(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<LikesRecord>
                                                                            textLikesRecordList =
                                                                            snapshot.data!;

                                                                        return SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          () {
                                                                            if (textLikesRecordList.length <=
                                                                                0) {
                                                                              return 'Be the first one to like.';
                                                                            } else if (textLikesRecordList.length ==
                                                                                1) {
                                                                              return '${formatNumber(
                                                                                textLikesRecordList.length,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              )} like';
                                                                            } else {
                                                                              return '${formatNumber(
                                                                                textLikesRecordList.length,
                                                                                formatType: FormatType.decimal,
                                                                                decimalType: DecimalType.automatic,
                                                                              )} likes';
                                                                            }
                                                                          }(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.karla(
                                                                                  fontWeight: FontWeight.normal,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ));
                                                                      },
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            LikesRecord>>(
                                                                      stream:
                                                                          queryLikesRecord(
                                                                        parent:
                                                                            containerBlogspotRecord.reference,
                                                                        queryBuilder:
                                                                            (likesRecord) =>
                                                                                likesRecord.where(
                                                                          'liked_by',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitFoldingCube(
                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<LikesRecord>
                                                                            conditionalBuilderLikesRecordList =
                                                                            snapshot.data!;
                                                                        final conditionalBuilderLikesRecord = conditionalBuilderLikesRecordList.isNotEmpty
                                                                            ? conditionalBuilderLikesRecordList.first
                                                                            : null;

                                                                        return InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
                                                                            await conditionalBuilderLikesRecord!.reference.delete();
                                                                          },
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if ((conditionalBuilderLikesRecord != null) == true) {
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await conditionalBuilderLikesRecord!.reference.delete();
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.solidHeart,
                                                                                    color: Color(0xFFF9595F),
                                                                                    size: 30.0,
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    var likesRecordReference = LikesRecord.createDoc(
                                                                                      containerBlogspotRecord.reference,
                                                                                      id: currentUserReference!.id,
                                                                                    );
                                                                                    await likesRecordReference.set({
                                                                                      ...createLikesRecordData(
                                                                                        likedBy: currentUserReference,
                                                                                        postReference: containerBlogspotRecord.reference,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'time_liked': FieldValue.serverTimestamp(),
                                                                                        },
                                                                                      ),
                                                                                    });
                                                                                    _model.apiResultbhj = LikesRecord.getDocumentFromData({
                                                                                      ...createLikesRecordData(
                                                                                        likedBy: currentUserReference,
                                                                                        postReference: containerBlogspotRecord.reference,
                                                                                      ),
                                                                                      ...mapToFirestore(
                                                                                        {
                                                                                          'time_liked': DateTime.now(),
                                                                                        },
                                                                                      ),
                                                                                    }, likesRecordReference);

                                                                                    safeSetState(() {});
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.heart,
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
                                                                SelectionArea(
                                                                    child: Text(
                                                                  containerBlogspotRecord
                                                                      .titleOfThePost,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .karla(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                        fontSize:
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                )),
                                                                SelectionArea(
                                                                    child: Text(
                                                                  containerBlogspotRecord
                                                                      .description,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .karla(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              })
                                                  .divide(
                                                      SizedBox(height: 10.0))
                                                  .addToStart(
                                                      SizedBox(height: 10.0))
                                                  .addToEnd(
                                                      SizedBox(height: 50.0)),
                                            ),
                                          );
                                        },
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
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
