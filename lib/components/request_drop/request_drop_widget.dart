import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'request_drop_model.dart';
export 'request_drop_model.dart';

class RequestDropWidget extends StatefulWidget {
  const RequestDropWidget({
    Key? key,
    required this.provDoc,
    required this.provRef,
  }) : super(key: key);

  final ProviderDocumentsRecord? provDoc;
  final DocumentReference? provRef;

  @override
  _RequestDropWidgetState createState() => _RequestDropWidgetState();
}

class _RequestDropWidgetState extends State<RequestDropWidget> {
  late RequestDropModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RequestDropModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.902,
        height: 400.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: Text(
                      'Charges(/hr)',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'K450/hr',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'From',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('REQUEST_DROP_COMP_From_ON_TAP');
                        logFirebaseEvent('From_date_time_picker');

                        final _datePicked1Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                        if (_datePicked1Time != null) {
                          setState(() {
                            _model.datePicked1 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked1Time.hour,
                              _datePicked1Time.minute,
                            );
                          });
                        }
                      },
                      text: valueOrDefault<String>(
                        dateTimeFormat(
                          'Hm',
                          _model.datePicked1,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        '15:30',
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: Text(
                      'to',
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        logFirebaseEvent('REQUEST_DROP_COMP_To_ON_TAP');
                        logFirebaseEvent('To_date_time_picker');

                        final _datePicked2Time = await showTimePicker(
                          context: context,
                          initialTime:
                              TimeOfDay.fromDateTime(getCurrentTimestamp),
                        );
                        if (_datePicked2Time != null) {
                          setState(() {
                            _model.datePicked2 = DateTime(
                              getCurrentTimestamp.year,
                              getCurrentTimestamp.month,
                              getCurrentTimestamp.day,
                              _datePicked2Time.hour,
                              _datePicked2Time.minute,
                            );
                          });
                        }
                      },
                      text: valueOrDefault<String>(
                        dateTimeFormat(
                          'Hm',
                          _model.datePicked2,
                          locale: FFLocalizations.of(context).languageCode,
                        ),
                        '15:30',
                      ),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Booking Fee:',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                    child: FFButtonWidget(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      text: 'K450',
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        textStyle: FlutterFlowTheme.of(context)
                            .titleSmall
                            .override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent('REQUEST_DROP_COMP_REQUEST_BTN_ON_TAP');
                      final firestoreBatch = FirebaseFirestore.instance.batch();
                      try {
                        logFirebaseEvent('Button_update_app_state');
                        setState(() {
                          FFAppState().iHavePurchaseHistory = true;
                        });
                        logFirebaseEvent('Button_backend_call');

                        var dealsRecordReference = DealsRecord.collection.doc();
                        firestoreBatch.set(dealsRecordReference, {
                          ...createDealsRecordData(
                            providerName: valueOrDefault<String>(
                              widget.provDoc?.name,
                              'N/A',
                            ),
                            providerImage: widget.provDoc?.imageUrl,
                            clientName: currentUserDisplayName,
                            status: 'Cancelled',
                            dateCreated: getCurrentTimestamp,
                            clientRef: currentUserReference,
                            startTime: _model.datePicked1,
                            endTime: _model.datePicked2,
                            clientImage: currentUserPhoto,
                            providerDocRef: widget.provRef,
                          ),
                          'users': [currentUserReference],
                        });
                        _model.deal = DealsRecord.getDocumentFromData({
                          ...createDealsRecordData(
                            providerName: valueOrDefault<String>(
                              widget.provDoc?.name,
                              'N/A',
                            ),
                            providerImage: widget.provDoc?.imageUrl,
                            clientName: currentUserDisplayName,
                            status: 'Cancelled',
                            dateCreated: getCurrentTimestamp,
                            clientRef: currentUserReference,
                            startTime: _model.datePicked1,
                            endTime: _model.datePicked2,
                            clientImage: currentUserPhoto,
                            providerDocRef: widget.provRef,
                          ),
                          'users': [currentUserReference],
                        }, dealsRecordReference);
                        logFirebaseEvent('Button_backend_call');

                        firestoreBatch.update(currentUserReference!, {
                          'deals':
                              FieldValue.arrayUnion([_model.deal?.reference]),
                        });
                        logFirebaseEvent('Button_bottom_sheet');
                        Navigator.pop(context);
                      } finally {
                        await firestoreBatch.commit();
                      }

                      setState(() {});
                    },
                    text: 'Request',
                    options: FFButtonOptions(
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
