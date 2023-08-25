import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/rating2/rating2_widget.dart';
import '/components/service_entry/service_entry_widget.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'provider_dashboard_model.dart';
export 'provider_dashboard_model.dart';

class ProviderDashboardWidget extends StatefulWidget {
  const ProviderDashboardWidget({Key? key}) : super(key: key);

  @override
  _ProviderDashboardWidgetState createState() =>
      _ProviderDashboardWidgetState();
}

class _ProviderDashboardWidgetState extends State<ProviderDashboardWidget> {
  late ProviderDashboardModel _model;
  bool _isLoading = true;



  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProviderDashboardModel());
    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'providerDashboard'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('PROVIDER_DASHBOARD_providerDashboard_ON_');
      logFirebaseEvent('providerDashboard_firestore_query');

      _model.userDoc = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) =>
            usersRecord.where('uid', isEqualTo: currentUserUid),
        singleRecord: true,
      ).then((s) => s.firstOrNull);

    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    Stream<ProviderDocumentsRecord> provider = ProviderDocumentsRecord.getDocument(
        currentUserDocument!.providerReference!);
    print('Loaded provider Document: $provider');
    print('Current user document: ${currentUserDocument!.providerReference!}');

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<ProviderDocumentsRecord>(
        stream: provider,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            print('Snapshot connection state: ${snapshot.connectionState}');
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          print('Data from the snapshot => ${snapshot.data}');
          final providerDashboardProviderDocumentsRecord = snapshot.data!;
          return GestureDetector(
            onTap: () =>
                FocusScope.of(context).requestFocus(_model.unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              appBar: AppBar(
                backgroundColor:
                FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    logFirebaseEvent(
                        'PROVIDER_DASHBOARD_arrow_back_rounded_IC');
                    logFirebaseEvent('IconButton_navigate_back');
                    context.pop();
                  },
                ),
                title: Text(
                  'Service Provider',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 22.0,
                  ),
                ),
                actions: [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 8.0, 0.0, 0.0),
                            child: Text(
                              'Welcome, $currentUserDisplayName!',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(24.0),
                              bottomRight: Radius.circular(8.0),
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(36.0),
                            ),
                          ),
                          child: Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 500.0,
                            ),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  FlutterFlowTheme.of(context).tertiary,
                                  FlutterFlowTheme.of(context).primary
                                ],
                                stops: [0.0, 0.5],
                                begin: AlignmentDirectional(0.0, -1.0),
                                end: AlignmentDirectional(0, 1.0),
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(24.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(36.0),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 250.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              8.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Profile',
                                            style: FlutterFlowTheme.of(context)
                                                .headlineSmall
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 16.0, 0.0),
                                        child: Container(
                                          width: 50.0,
                                          height: 50.0,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            valueOrDefault<String>(
                                              currentUserPhoto,
                                              'https://picsum.photos/seed/916/600',
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    providerDashboardProviderDocumentsRecord
                                        .rating
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.white,
                                    ),
                                  ),
                                  RatingBarIndicator(
                                    itemBuilder: (context, index) => Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                    ),
                                    direction: Axis.horizontal,
                                    rating:
                                    providerDashboardProviderDocumentsRecord
                                        .rating
                                        .toDouble(),
                                    unratedColor: Color(0xFF7E7E7E),
                                    itemCount: 5,
                                    itemSize: 40.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 8.0, 8.0, 8.0),
                                    child: Text(
                                      'Average rating by ${providerDashboardProviderDocumentsRecord.totalClients.toString()} users',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 24.0, 8.0, 0.0),
                                    child: Text(
                                      'Clients List',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      'See all',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .info,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              //List of Clients and Requests
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(),
                                  child: StreamBuilder<List<DealsRecord>>(
                                    stream: queryDealsRecord(
                                      limit: 7,
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      List<DealsRecord> columnDealsRecordList =
                                      snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: List.generate(
                                            columnDealsRecordList.length,
                                                (columnIndex) {
                                              final columnDealsRecord =
                                              columnDealsRecordList[
                                              columnIndex];
                                              return Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Material(
                                                  borderRadius: BorderRadius.circular(16.0),
                                                  elevation: 2.0,
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                      FlutterFlowTheme.of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                      BorderRadius.circular(16.0),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          //Engagement Status Here: [Requested,Active,Cancelled,Completed]
                                                          Row(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize.max,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                        children: [
                                                                          if (columnDealsRecord
                                                                              .status ==
                                                                              'Requested')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child: Text(
                                                                                'Request',
                                                                                style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .bodyLarge
                                                                                    .override(
                                                                                  fontFamily:
                                                                                  'Poppins',
                                                                                  color:
                                                                                  FlutterFlowTheme.of(context).info,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (columnDealsRecord
                                                                              .status ==
                                                                              'Active')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child: Text(
                                                                                'Active',
                                                                                style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .bodyLarge
                                                                                    .override(
                                                                                  fontFamily:
                                                                                  'Poppins',
                                                                                  color:
                                                                                  FlutterFlowTheme.of(context).success,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (columnDealsRecord
                                                                              .status ==
                                                                              'Cancelled')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child: Text(
                                                                                'Canceled',
                                                                                style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .bodyLarge
                                                                                    .override(
                                                                                  fontFamily:
                                                                                  'Poppins',
                                                                                  color:
                                                                                  FlutterFlowTheme.of(context).error,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          if (columnDealsRecord
                                                                              .status ==
                                                                              'Complete')
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional
                                                                                  .fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child: Text(
                                                                                'Complete',
                                                                                style: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .bodyLarge
                                                                                    .override(
                                                                                  fontFamily:
                                                                                  'Poppins',
                                                                                  color:
                                                                                  FlutterFlowTheme.of(context).warning,
                                                                                  fontWeight:
                                                                                  FontWeight.bold,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize.min,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                        EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            24.0,
                                                                            0.0),
                                                                        child: Text(
                                                                          columnDealsRecord
                                                                              .clientName,
                                                                          style: FlutterFlowTheme.of(
                                                                              context)
                                                                              .titleLarge,
                                                                        ),
                                                                      ),

                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize.min,
                                                                    children: [
                                                                      Text(
                                                                        'K${columnDealsRecord.amount.toString()}',
                                                                        style: FlutterFlowTheme
                                                                            .of(context)
                                                                            .titleLarge,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      dateTimeFormat(
                                                                        'M/d H:mm',
                                                                        columnDealsRecord
                                                                            .dateCreated,
                                                                        locale: FFLocalizations
                                                                            .of(context)
                                                                            .languageCode,
                                                                      ),
                                                                      '6/19 15:57',
                                                                    ),
                                                                    style: FlutterFlowTheme
                                                                        .of(context)
                                                                        .bodyMedium,
                                                                  ),
                                                                  Container(
                                                                    height: 100.0,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Builder(
                                                                      builder: (context) {
                                                                        final services =
                                                                        columnDealsRecord
                                                                            .services
                                                                            .toList();
                                                                        return Column(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          children: List.generate(
                                                                              services
                                                                                  .length,
                                                                                  (servicesIndex) {
                                                                                final servicesItem =
                                                                                services[
                                                                                servicesIndex];
                                                                                return Row(
                                                                                  mainAxisSize:
                                                                                  MainAxisSize
                                                                                      .max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                                          8.0,
                                                                                          8.0,
                                                                                          8.0,
                                                                                          0.0),
                                                                                      child:
                                                                                      Text(
                                                                                        valueOrDefault<
                                                                                            String>(
                                                                                          servicesItem.id,
                                                                                          'N/A',
                                                                                        ),
                                                                                        style:
                                                                                        FlutterFlowTheme.of(context).titleMedium,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              }),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                                child: Container(
                                                                  width: 60.0,
                                                                  height: 60.0,
                                                                  clipBehavior:
                                                                  Clip.antiAlias,
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    shape:
                                                                    BoxShape.circle,
                                                                  ),
                                                                  child: Image.network(
                                                                    columnDealsRecord
                                                                        .clientImage,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          if (columnDealsRecord.status ==
                                                              'Active')
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 8.0,
                                                                  0.0, 8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed: () async {
                                                                      logFirebaseEvent(
                                                                          'PROVIDER_DASHBOARD_MESSAGE_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context.pushNamed(
                                                                        'chat_page',
                                                                        queryParameters: {
                                                                          'chatUser':
                                                                          serializeParam(
                                                                            _model
                                                                                .userDoc,
                                                                            ParamType
                                                                                .Document,
                                                                          ),
                                                                          'chatRef':
                                                                          serializeParam(
                                                                            columnDealsRecord
                                                                                .chatRef,
                                                                            ParamType
                                                                                .DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <String,
                                                                            dynamic>{
                                                                          'chatUser': _model
                                                                              .userDoc,
                                                                        },
                                                                      );
                                                                    },
                                                                    text: 'Message',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      width: 130.0,
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: Colors.white,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .primary,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed: () async {
                                                                      logFirebaseEvent(
                                                                          'PROVIDER_DASHBOARD_COMPLETED_BTN_ON_TAP');
                                                                      final firestoreBatch =
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .batch();
                                                                      try {
                                                                        logFirebaseEvent(
                                                                            'Button_alert_dialog');
                                                                        var confirmDialogResponse =
                                                                            await showDialog<
                                                                                bool>(
                                                                              context:
                                                                              context,
                                                                              builder:
                                                                                  (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title:
                                                                                  Text('Complete?'),
                                                                                  content:
                                                                                  Text('Are you sure you are done with this project?'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Cancel'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Yes I\'m sure'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                                false;
                                                                        if (confirmDialogResponse) {
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          firestoreBatch
                                                                              .update(
                                                                              columnDealsRecord
                                                                                  .reference,
                                                                              createDealsRecordData(
                                                                                status:
                                                                                'Complete',
                                                                              ));
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          firestoreBatch
                                                                              .update(
                                                                              providerDashboardProviderDocumentsRecord
                                                                                  .reference,
                                                                              createProviderDocumentsRecordData(
                                                                                availability:
                                                                                true,
                                                                              ));
                                                                          logFirebaseEvent(
                                                                              'Button_backend_call');

                                                                          firestoreBatch.update(
                                                                              columnDealsRecord
                                                                                  .clientRef!,
                                                                              {
                                                                                'reviewPending':
                                                                                FieldValue
                                                                                    .arrayUnion([
                                                                                  providerDashboardProviderDocumentsRecord
                                                                                      .reference
                                                                                ]),
                                                                              });
                                                                          logFirebaseEvent(
                                                                              'Button_trigger_push_notification');
                                                                          triggerPushNotification(
                                                                            notificationTitle:
                                                                            'Completed!',
                                                                            notificationText:
                                                                            '${columnDealsRecord.providerName}has completed the task. Please log in and give review.',
                                                                            notificationImageUrl:
                                                                            columnDealsRecord
                                                                                .providerImage,
                                                                            notificationSound:
                                                                            'default',
                                                                            userRefs: [
                                                                              columnDealsRecord
                                                                                  .clientRef!
                                                                            ],
                                                                            initialPageName:
                                                                            'trackingDetail',
                                                                            parameterData: {
                                                                              'dealDoc':
                                                                              columnDealsRecord,
                                                                            },
                                                                          );
                                                                        }
                                                                      } finally {
                                                                        await firestoreBatch
                                                                            .commit();
                                                                      }
                                                                    },
                                                                    text: 'Completed',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      width: 130.0,
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .info,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    splashColor: Colors
                                                                        .transparent,
                                                                    focusColor: Colors
                                                                        .transparent,
                                                                    hoverColor: Colors
                                                                        .transparent,
                                                                    highlightColor: Colors
                                                                        .transparent,
                                                                    onTap: () async {
                                                                      logFirebaseEvent(
                                                                          'PROVIDER_DASHBOARD_Text_fyjbagul_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Text_alert_dialog');
                                                                      var confirmDialogResponse =
                                                                          await showDialog<
                                                                              bool>(
                                                                            context:
                                                                            context,
                                                                            builder:
                                                                                (alertDialogContext) {
                                                                              return AlertDialog(
                                                                                title:
                                                                                Text(' Are you sure?'),
                                                                                content:
                                                                                Text('Are you sure you wish to cancel this arrangement?'),
                                                                                actions: [
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                    child: Text('No'),
                                                                                  ),
                                                                                  TextButton(
                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                    child: Text('Yes'),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ) ??
                                                                              false;
                                                                      if (confirmDialogResponse) {
                                                                        logFirebaseEvent(
                                                                            'Text_backend_call');

                                                                        await columnDealsRecord
                                                                            .reference
                                                                            .update(
                                                                            createDealsRecordData(
                                                                              status:
                                                                              'Cancelled',
                                                                              timeOfClosure:
                                                                              getCurrentTimestamp,
                                                                              cancelledBy:
                                                                              'Service Provider',
                                                                            ));
                                                                        logFirebaseEvent(
                                                                            'Text_show_snack_bar');
                                                                        ScaffoldMessenger
                                                                            .of(context)
                                                                            .showSnackBar(
                                                                          SnackBar(
                                                                            content: Text(
                                                                              'Cancelled!',
                                                                              style:
                                                                              TextStyle(
                                                                                color: FlutterFlowTheme.of(
                                                                                    context)
                                                                                    .primaryText,
                                                                              ),
                                                                            ),
                                                                            duration: Duration(
                                                                                milliseconds:
                                                                                4000),
                                                                            backgroundColor:
                                                                            FlutterFlowTheme.of(
                                                                                context)
                                                                                .secondary,
                                                                          ),
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Text_trigger_push_notification');
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                          'Deal has been canceled',
                                                                          notificationText:
                                                                          '${columnDealsRecord.providerName}Has canceled the deal.',
                                                                          notificationImageUrl:
                                                                          columnDealsRecord
                                                                              .providerImage,
                                                                          notificationSound:
                                                                          'default',
                                                                          userRefs: [
                                                                            columnDealsRecord
                                                                                .clientRef!
                                                                          ],
                                                                          initialPageName:
                                                                          'trackingDetail',
                                                                          parameterData: {
                                                                            'dealDoc':
                                                                            columnDealsRecord,
                                                                          },
                                                                        );
                                                                      }
                                                                    },
                                                                    child: Text(
                                                                      'Cancel deal',
                                                                      style: FlutterFlowTheme
                                                                          .of(context)
                                                                          .bodyMedium
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: FlutterFlowTheme.of(
                                                                            context)
                                                                            .tertiary,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (columnDealsRecord.status ==
                                                              'Requested')
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 8.0,
                                                                  0.0, 8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed: () async {
                                                                      logFirebaseEvent(
                                                                          'PROVIDER_DASHBOARD_ACCEPT_BTN_ON_TAP');
                                                                      final firestoreBatch =
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .batch();
                                                                      try {
                                                                        logFirebaseEvent(
                                                                            'Button_update_widget_state');
                                                                        _model.users = [];
                                                                        logFirebaseEvent(
                                                                            'Button_update_widget_state');
                                                                        _model.addToUsers(
                                                                            columnDealsRecord
                                                                                .clientRef!);
                                                                        logFirebaseEvent(
                                                                            'Button_update_widget_state');
                                                                        setState(() {
                                                                          _model.addToUsers(
                                                                              currentUserReference!);
                                                                        });
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        firestoreBatch.set(
                                                                            ChatsRecord
                                                                                .collection
                                                                                .doc(),
                                                                            {
                                                                              ...createChatsRecordData(
                                                                                userA: columnDealsRecord
                                                                                    .clientRef,
                                                                                userB:
                                                                                currentUserReference,
                                                                              ),
                                                                              'users': _model
                                                                                  .users,
                                                                            });
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        firestoreBatch
                                                                            .update(
                                                                            columnDealsRecord
                                                                                .reference,
                                                                            createDealsRecordData(
                                                                              status:
                                                                              'Active',
                                                                              timeOfResponse:
                                                                              getCurrentTimestamp,
                                                                            ));
                                                                        logFirebaseEvent(
                                                                            'Button_backend_call');

                                                                        firestoreBatch.update(
                                                                            providerDashboardProviderDocumentsRecord
                                                                                .reference,
                                                                            {
                                                                              ...createProviderDocumentsRecordData(
                                                                                availability:
                                                                                false,
                                                                              ),
                                                                              'totalClients':
                                                                              FieldValue
                                                                                  .increment(1),
                                                                              'dealsList':
                                                                              FieldValue
                                                                                  .arrayUnion([
                                                                                columnDealsRecord
                                                                                    .reference
                                                                              ]),
                                                                            });
                                                                      } finally {
                                                                        await firestoreBatch
                                                                            .commit();
                                                                      }
                                                                    },
                                                                    text: 'Accept',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .success,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed: () async {
                                                                      logFirebaseEvent(
                                                                          'PROVIDER_DASHBOARD_REJECT_BTN_ON_TAP');
                                                                      logFirebaseEvent(
                                                                          'Button_backend_call');

                                                                      await columnDealsRecord
                                                                          .reference
                                                                          .update(
                                                                          createDealsRecordData(
                                                                            status:
                                                                            'Cancelled',
                                                                            timeOfClosure:
                                                                            getCurrentTimestamp,
                                                                            timeOfResponse:
                                                                            getCurrentTimestamp,
                                                                            cancelledBy:
                                                                            'Rejected by provider',
                                                                          ));
                                                                    },
                                                                    text: 'Reject',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      width: 130.0,
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .primary,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (columnDealsRecord.status ==
                                                              'Complete')
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 8.0,
                                                                  0.0, 8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed: () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: 'Completed!!!',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .warning,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          if (valueOrDefault<bool>(
                                                            columnDealsRecord.status ==
                                                                'Cancelled',
                                                            true,
                                                          ))
                                                            Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0.0, 8.0,
                                                                  0.0, 8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                MainAxisSize.max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                                children: [
                                                                  FFButtonWidget(
                                                                    onPressed: () {
                                                                      print(
                                                                          'Button pressed ...');
                                                                    },
                                                                    text: 'Cancelled!!!',
                                                                    options:
                                                                    FFButtonOptions(
                                                                      height: 40.0,
                                                                      padding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0),
                                                                      iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      color: FlutterFlowTheme
                                                                          .of(context)
                                                                          .primary,
                                                                      textStyle:
                                                                      FlutterFlowTheme.of(
                                                                          context)
                                                                          .titleSmall
                                                                          .override(
                                                                        fontFamily:
                                                                        'Poppins',
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide:
                                                                      BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                          8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
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
                        padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(4.0),
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(36.0),
                                  ),
                                ),
                                child: Container(
                                  width: 150.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        FlutterFlowTheme.of(context).tertiary,
                                        FlutterFlowTheme.of(context).primary
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(0.0, -1.0),
                                      end: AlignmentDirectional(0, 1.0),
                                    ),
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(4.0),
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(36.0),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Text(
                                          'K ${valueOrDefault<String>(
                                            providerDashboardProviderDocumentsRecord
                                                .totalEarnings
                                                .toString(),
                                            '0.0',
                                          )}',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Total amount earned on app',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFFF9FDFF),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 8.0, 8.0, 8.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0),
                                    bottomRight: Radius.circular(4.0),
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(36.0),
                                  ),
                                ),
                                child: Container(
                                  width: 150.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12.0),
                                      bottomRight: Radius.circular(4.0),
                                      topLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(36.0),
                                    ),
                                    border: Border.all(
                                      color:
                                      FlutterFlowTheme.of(context).primary,
                                      width: 3.0,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          '${valueOrDefault<String>(
                                            providerDashboardProviderDocumentsRecord
                                                .totalClients
                                                .toString(),
                                            '0',
                                          )}.',
                                          style: FlutterFlowTheme.of(context)
                                              .displaySmall
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Total clients served',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //About Section
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            primary: false,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 8.0, 8.0, 8.0),
                                  child: Text(
                                    'About',
                                    style: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                ClipRRect(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                              Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'PROVIDER_DASHBOARD_PAGE_addCard_ON_TAP');
                                                logFirebaseEvent(
                                                    'addCard_navigate_to');

                                                context
                                                    .pushNamed('CreateDetail');
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 2.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      24.0),
                                                ),
                                                child: Container(
                                                  width: 250.0,
                                                  height: 250.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: Image.network(
                                                        '',
                                                      ).image,
                                                    ),
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .tertiary,
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary
                                                      ],
                                                      stops: [0.0, 1.0],
                                                      begin:
                                                      AlignmentDirectional(
                                                          0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        24.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                    MainAxisSize.max,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      Icon(
                                                        Icons.add_circle,
                                                        color: Colors.white,
                                                        size: 100.0,
                                                      ),
                                                      Text(
                                                        'Add',
                                                        style: FlutterFlowTheme
                                                            .of(context)
                                                            .headlineSmall
                                                            .override(
                                                          fontFamily:
                                                          'Poppins',
                                                          color:
                                                          Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          StreamBuilder<
                                              List<AboutSectionRecord>>(
                                            stream: queryAboutSectionRecord(
                                              parent: currentUserDocument
                                                  ?.providerReference,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                    CircularProgressIndicator(
                                                      valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                        FlutterFlowTheme.of(
                                                            context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<AboutSectionRecord>
                                              aboutPreviousJobsAboutSectionRecordList =
                                              snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    aboutPreviousJobsAboutSectionRecordList
                                                        .length,
                                                        (aboutPreviousJobsIndex) {
                                                      final aboutPreviousJobsAboutSectionRecord =
                                                      aboutPreviousJobsAboutSectionRecordList[
                                                      aboutPreviousJobsIndex];
                                                      return Padding(
                                                        padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 8.0,
                                                            8.0, 8.0),
                                                        child: InkWell(
                                                          splashColor:
                                                          Colors.transparent,
                                                          focusColor:
                                                          Colors.transparent,
                                                          hoverColor:
                                                          Colors.transparent,
                                                          highlightColor:
                                                          Colors.transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'PROVIDER_DASHBOARD_PAGE_aboutCard_ON_TAP');
                                                            logFirebaseEvent(
                                                                'aboutCard_navigate_to');

                                                            context.pushNamed(
                                                              'readDetail',
                                                              queryParameters: {
                                                                'provDoc':
                                                                serializeParam(
                                                                  aboutPreviousJobsAboutSectionRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'provDoc':
                                                                aboutPreviousJobsAboutSectionRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Material(
                                                            color:
                                                            Colors.transparent,
                                                            elevation: 2.0,
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  24.0),
                                                            ),
                                                            child: Container(
                                                              width: 250.0,
                                                              height: 250.0,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: FlutterFlowTheme
                                                                    .of(context)
                                                                    .secondaryBackground,
                                                                image:
                                                                DecorationImage(
                                                                  fit: BoxFit.cover,
                                                                  image:
                                                                  Image.network(
                                                                    'https://picsum.photos/seed/226/600',
                                                                  ).image,
                                                                ),
                                                                borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                    24.0),
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent(
                                                                                'PROVIDER_DASHBOARD_Container_gbeaeh5e_ON');
                                                                            logFirebaseEvent(
                                                                                'Container_navigate_to');

                                                                            context
                                                                                .pushNamed(
                                                                              'UpdateDetail',
                                                                              queryParameters:
                                                                              {
                                                                                'image':
                                                                                serializeParam(
                                                                                  aboutPreviousJobsAboutSectionRecord.image,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'header':
                                                                                serializeParam(
                                                                                  aboutPreviousJobsAboutSectionRecord.header,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'body':
                                                                                serializeParam(
                                                                                  aboutPreviousJobsAboutSectionRecord.body,
                                                                                  ParamType.String,
                                                                                ),
                                                                                'aboutReference':
                                                                                serializeParam(
                                                                                  aboutPreviousJobsAboutSectionRecord.reference,
                                                                                  ParamType.DocumentReference,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            55.0,
                                                                            height:
                                                                            55.0,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color:
                                                                              Color(0x7F000000),
                                                                              borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child:
                                                                              FaIcon(
                                                                                FontAwesomeIcons.pen,
                                                                                color:
                                                                                Colors.white,
                                                                                size:
                                                                                30.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional
                                                                            .fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            8.0),
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
                                                                            logFirebaseEvent(
                                                                                'PROVIDER_DASHBOARD_Container_3b3wkzgp_ON');
                                                                            logFirebaseEvent(
                                                                                'Container_backend_call');
                                                                            await aboutPreviousJobsAboutSectionRecord
                                                                                .reference
                                                                                .delete();
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            55.0,
                                                                            height:
                                                                            55.0,
                                                                            decoration:
                                                                            BoxDecoration(
                                                                              color:
                                                                              Color(0x7F000000),
                                                                              borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0,
                                                                                  8.0),
                                                                              child:
                                                                              Icon(
                                                                                Icons.delete_outline_outlined,
                                                                                color:
                                                                                Colors.white,
                                                                                size:
                                                                                40.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    width: 250.0,
                                                                    height: 100.0,
                                                                    decoration:
                                                                    BoxDecoration(
                                                                      color: Color(
                                                                          0x4A212324),
                                                                      borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                        bottomLeft:
                                                                        Radius.circular(
                                                                            24.0),
                                                                        bottomRight:
                                                                        Radius.circular(
                                                                            24.0),
                                                                        topLeft: Radius
                                                                            .circular(
                                                                            0.0),
                                                                        topRight: Radius
                                                                            .circular(
                                                                            0.0),
                                                                      ),
                                                                    ),
                                                                    child: Column(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                          Text(
                                                                            aboutPreviousJobsAboutSectionRecord
                                                                                .header
                                                                                .maybeHandleOverflow(
                                                                              maxChars:
                                                                              12,
                                                                              replacement:
                                                                              '…',
                                                                            ),
                                                                            maxLines:
                                                                            1,
                                                                            style: FlutterFlowTheme.of(context)
                                                                                .titleMedium
                                                                                .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                          Container(
                                                                            width:
                                                                            234.0,
                                                                            height:
                                                                            30.0,
                                                                            decoration:
                                                                            BoxDecoration(),
                                                                            child:
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(
                                                                                  8.0,
                                                                                  0.0,
                                                                                  0.0,
                                                                                  0.0),
                                                                              child:
                                                                              Text(
                                                                                aboutPreviousJobsAboutSectionRecord.body,
                                                                                maxLines:
                                                                                2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Poppins',
                                                                                  color: Colors.white,
                                                                                  fontSize: 14.0,
                                                                                  fontWeight: FontWeight.w500,
                                                                                  lineHeight: 1.0,
                                                                                ),
                                                                              ),
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
                                                        ),
                                                      );
                                                    }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Services',
                          style:
                          FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //Services list
                      Padding(
                        padding:
                        EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 500.0,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Text(
                                                'Add Service',
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.add_circle_outline,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          logFirebaseEvent(
                                              'PROVIDER_DASHBOARD_add_circle_outline_IC');
                                          logFirebaseEvent(
                                              'IconButton_bottom_sheet');
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return GestureDetector(
                                                onTap: () =>
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                        _model.unfocusNode),
                                                child: Padding(
                                                  padding:
                                                  MediaQuery.viewInsetsOf(
                                                      context),
                                                  child: ServiceEntryWidget(
                                                    provRef:
                                                    providerDashboardProviderDocumentsRecord
                                                        .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              StreamBuilder<List<SkillsRecord>>(
                                stream: querySkillsRecord(
                                  parent:
                                  providerDashboardProviderDocumentsRecord
                                      .reference,
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<SkillsRecord> servicesSkillsRecordList =
                                  snapshot.data!;
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: List.generate(
                                        servicesSkillsRecordList.length,
                                            (servicesIndex) {
                                          final servicesSkillsRecord =
                                          servicesSkillsRecordList[
                                          servicesIndex];
                                          return Material(
                                            color: Colors.transparent,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                      MainAxisSize.max,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              8.0,
                                                              8.0,
                                                              8.0,
                                                              8.0),
                                                          child: Text(
                                                            servicesSkillsRecord
                                                                .skill,
                                                            style:
                                                            FlutterFlowTheme.of(
                                                                context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                        Text(
                                                          'K${servicesSkillsRecord.charge.toString()}',
                                                          style:
                                                          FlutterFlowTheme.of(
                                                              context)
                                                              .bodyMedium,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  FlutterFlowIconButton(
                                                    borderColor: Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    icon: Icon(
                                                      Icons.clear,
                                                      color: FlutterFlowTheme.of(
                                                          context)
                                                          .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      logFirebaseEvent(
                                                          'PROVIDER_DASHBOARD_PAGE_clear_ICN_ON_TAP');
                                                      logFirebaseEvent(
                                                          'IconButton_backend_call');
                                                      await servicesSkillsRecord
                                                          .reference
                                                          .delete();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
