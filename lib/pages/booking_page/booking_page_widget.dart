import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'booking_page_model.dart';
export 'booking_page_model.dart';

class BookingPageWidget extends StatefulWidget {
  const BookingPageWidget({
    Key? key,
    required this.providerRef,
    double? bookingFee,
  })  : this.bookingFee = bookingFee ?? 0.0,
        super(key: key);

  final DocumentReference? providerRef;
  final double bookingFee;

  @override
  _BookingPageWidgetState createState() => _BookingPageWidgetState();
}

class _BookingPageWidgetState extends State<BookingPageWidget> {
  late BookingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPageModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'BookingPage'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('BOOKING_BookingPage_ON_INIT_STATE');
      logFirebaseEvent('BookingPage_update_widget_state');
      setState(() {
        _model.totalAmount = _model.totalAmount! + widget.bookingFee;
      });
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

    return StreamBuilder<ProviderDocumentsRecord>(
      stream: ProviderDocumentsRecord.getDocument(widget.providerRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
        final bookingPageProviderDocumentsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  logFirebaseEvent('BOOKING_chevron_left_rounded_ICN_ON_TAP');
                  logFirebaseEvent('IconButton_navigate_back');
                  context.safePop();
                },
              ),
              title: Text(
                'Make Booking',
                style: FlutterFlowTheme.of(context).titleMedium,
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 24.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Wait in Line',
                                  style:
                                      FlutterFlowTheme.of(context).titleMedium,
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Icon(
                                          Icons.date_range_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'MMMMEEEEd',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Icon(
                                          Icons.access_time_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                      ),
                                      Text(
                                        dateTimeFormat(
                                          'jm',
                                          getCurrentTimestamp,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  bookingPageProviderDocumentsRecord.imageUrl,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 0.0),
                                child: Text(
                                  bookingPageProviderDocumentsRecord.name,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                'Payment',
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ),
                          ),
                          Text(
                            '(coming soon)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                          Image.asset(
                            'assets/images/airtel-money.webp',
                            width: 100.0,
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 4.0),
                              child: Text(
                                'Promos',
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ),
                          ),
                          Text(
                            '(coming soon)',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 8.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.kickstarterK,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                          Text(
                            'Add promo',
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                4.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.chevron_right_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Price Details',
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Hourly Rate',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  'K${bookingPageProviderDocumentsRecord.hourlyRate.toString()}/hr',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Trust and Support Fee',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Text(
                                  widget.bookingFee.toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          16.0, 12.0, 16.0, 12.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Specific services',
                                style: FlutterFlowTheme.of(context).titleMedium,
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: StreamBuilder<List<SkillsRecord>>(
                              stream: querySkillsRecord(
                                parent: widget.providerRef,
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
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<SkillsRecord> columnSkillsRecordList =
                                    snapshot.data!;
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: List.generate(
                                      columnSkillsRecordList.length,
                                      (columnIndex) {
                                    final columnSkillsRecord =
                                        columnSkillsRecordList[columnIndex];
                                    return Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .accent2,
                                          ),
                                          child: Checkbox(
                                            value: _model.checkboxValueMap[
                                                columnSkillsRecord] ??= false,
                                            onChanged: (newValue) async {
                                              setState(() =>
                                                  _model.checkboxValueMap[
                                                          columnSkillsRecord] =
                                                      newValue!);
                                              if (newValue!) {
                                                logFirebaseEvent(
                                                    'BOOKING_Checkbox_khu7mokr_ON_TOGGLE_ON');
                                                logFirebaseEvent(
                                                    'Checkbox_update_widget_state');
                                                setState(() {
                                                  _model.totalAmount = _model
                                                          .totalAmount! +
                                                      columnSkillsRecord.charge;
                                                });
                                                if (_model.checkboxValueMap[
                                                columnSkillsRecord]!) {
                                                  logFirebaseEvent(
                                                      'Checkbox_update_widget_state');
                                                  setState(() {
                                                    _model.addToServiceList(
                                                        columnSkillsRecord
                                                            .reference);
                                                  });
                                                }else if (!_model.checkboxValueMap[
                                                columnSkillsRecord]!) {
                                                  logFirebaseEvent(
                                                      'Checkbox_update_widget_state');
                                                  setState(() {
                                                    _model.removeFromServiceList(
                                                        columnSkillsRecord
                                                            .reference);
                                                  });
                                                }
                                              } else {
                                                logFirebaseEvent(
                                                    'BOOKING_Checkbox_khu7mokr_ON_TOGGLE_OFF');
                                                logFirebaseEvent(
                                                    'Checkbox_update_widget_state');
                                                setState(() {
                                                  _model.totalAmount =
                                                      valueOrDefault<double>(
                                                    functions.subCharge(
                                                        columnSkillsRecord
                                                            .charge,
                                                        _model.totalAmount!),
                                                    0.0,
                                                  );
                                                });
                                              }
                                            },
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        ),
                                        Expanded(
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                columnSkillsRecord.skill,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                              Text(
                                                columnSkillsRecord.charge
                                                    .toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Subtotal',
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'K',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.9, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              _model.totalAmount,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            '0.0',
                                          ).maybeHandleOverflow(maxChars: 6),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Rate',
                            style: FlutterFlowTheme.of(context).titleMedium,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0.9, 0.0),
                                child: Text(
                                  'K',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                              Text(
                                valueOrDefault<String>(
                                  formatNumber(
                                    functions.totalFee(
                                        _model.totalAmount!, widget.bookingFee),
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.periodDecimal,
                                  ),
                                  '0.0',
                                ),
                                style:
                                    FlutterFlowTheme.of(context).headlineSmall,
                              ),
                              Align(
                                alignment: AlignmentDirectional(0.9, 0.0),
                                child: Text(
                                  '/hr',
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          logFirebaseEvent(
                              'BOOKING_PAGE_PAGE_REQUEST_BTN_ON_TAP');
                          final firestoreBatch =
                              FirebaseFirestore.instance.batch();
                          try {
                            logFirebaseEvent('Button_update_app_state');
                            setState(() {
                              FFAppState().iHavePurchaseHistory = true;
                            });
                            logFirebaseEvent('Button_backend_call');

                            var dealsRecordReference =
                                DealsRecord.collection.doc();
                            firestoreBatch.set(dealsRecordReference, {
                              ...createDealsRecordData(
                                providerName:
                                    bookingPageProviderDocumentsRecord.name,
                                providerImage:
                                    bookingPageProviderDocumentsRecord.imageUrl,
                                clientName: currentUserDisplayName,
                                status: 'Requested',
                                dateCreated: getCurrentTimestamp,
                                clientRef: currentUserReference,
                                clientImage: currentUserPhoto,
                                providerDocRef:
                                    bookingPageProviderDocumentsRecord
                                        .reference,
                                amount: _model.totalAmount,
                              ),
                              'services': _model.serviceList,
                              'users': [currentUserReference],
                            });
                            _model.deal = DealsRecord.getDocumentFromData({
                              ...createDealsRecordData(
                                providerName:
                                    bookingPageProviderDocumentsRecord.name,
                                providerImage:
                                    bookingPageProviderDocumentsRecord.imageUrl,
                                clientName: currentUserDisplayName,
                                status: 'Requested',
                                dateCreated: getCurrentTimestamp,
                                clientRef: currentUserReference,
                                clientImage: currentUserPhoto,
                                providerDocRef:
                                    bookingPageProviderDocumentsRecord
                                        .reference,
                                amount: _model.totalAmount,
                              ),
                              'services': _model.serviceList,
                              'users': [currentUserReference],
                            }, dealsRecordReference);
                            logFirebaseEvent('Button_backend_call');

                            firestoreBatch.update(currentUserReference!, {
                              'deals': FieldValue.arrayUnion(
                                  [_model.deal?.reference]),
                            });
                            logFirebaseEvent(
                                'Button_trigger_push_notification');
                            triggerPushNotification(
                              notificationTitle: 'Request',
                              notificationText:
                                  'You have a new client request.',
                              notificationImageUrl: currentUserPhoto,
                              notificationSound: 'default',
                              userRefs: [
                                bookingPageProviderDocumentsRecord.usrRef!
                              ],
                              initialPageName: 'providerDashboard',
                              parameterData: {},
                            );
                            logFirebaseEvent('Button_show_snack_bar');
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Request sent. Please view the booking details on the homepage',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                                )
                            );
                          } finally {
                            await firestoreBatch.commit();
                          }

                          setState(() {});
                        },
                        text: 'Request',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          elevation: 3.0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
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
    );
  }
}
