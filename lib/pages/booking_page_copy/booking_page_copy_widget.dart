import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_page_copy_model.dart';
export 'booking_page_copy_model.dart';

class BookingPageCopyWidget extends StatefulWidget {
  const BookingPageCopyWidget({
    Key? key,
    double? totalAmount,
    String? providerName,
    String? providerImage,
  })  : this.totalAmount = totalAmount ?? 0.0,
        this.providerName = providerName ?? 'Mwenzela Ndlovu',
        this.providerImage = providerImage ??
            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
        super(key: key);

  final double totalAmount;
  final String providerName;
  final String providerImage;

  @override
  _BookingPageCopyWidgetState createState() => _BookingPageCopyWidgetState();
}

class _BookingPageCopyWidgetState extends State<BookingPageCopyWidget>
    with TickerProviderStateMixin {
  late BookingPageCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'checkboxGroupOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 14.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingPageCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 24.0, 0.0),
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
                            style: FlutterFlowTheme.of(context).titleMedium,
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
                                  'Friday - May 27, 2022',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                  '9:30am',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                            'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 8.0, 0.0, 0.0),
                          child: Text(
                            'Maria P.',
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Text(
                          'Payment',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        Icons.credit_card,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Image.asset(
                      'assets/images/airtel-money.webp',
                      width: 100.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Ending in 2910',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                        child: Text(
                          'Promos',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                      child: Icon(
                        Icons.attach_money_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Add promo',
                      style: FlutterFlowTheme.of(context).bodySmall,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 8.0, 0.0),
                          child: Theme(
                            data: ThemeData(
                              checkboxTheme: CheckboxThemeData(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              unselectedWidgetColor: Color(0xFFF5F5F5),
                            ),
                            child: Checkbox(
                              value: _model.priceDetailsCheckboxValue ??= true,
                              onChanged: (newValue) async {
                                setState(() => _model
                                    .priceDetailsCheckboxValue = newValue!);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                        Text(
                          'Price Details',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ],
                    ),
                    if (valueOrDefault<bool>(
                      _model.priceDetailsCheckboxValue,
                      true,
                    ))
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hourly Rate',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'K15/hr',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    if (_model.priceDetailsCheckboxValue ?? true)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Booking Fee',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              'K4.20',
                              style: FlutterFlowTheme.of(context).bodyMedium,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).grayIcon,
                          ),
                          child: Checkbox(
                            value: _model.specificServiceCheckboxValue ??=
                                false,
                            onChanged: (newValue) async {
                              setState(() => _model
                                  .specificServiceCheckboxValue = newValue!);
                            },
                            activeColor: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                        Text(
                          'Specific services',
                          style: FlutterFlowTheme.of(context).titleMedium,
                        ),
                      ],
                    ),
                    if (_model.specificServiceCheckboxValue ?? true)
                      FlutterFlowCheckboxGroup(
                        options: ['Option 1', 'Option 2'],
                        onChanged: (val) =>
                            setState(() => _model.checkboxGroupValues = val),
                        controller: _model.checkboxGroupValueController ??=
                            FormFieldController<List<String>>(
                          [],
                        ),
                        activeColor: FlutterFlowTheme.of(context).primary,
                        checkColor: Colors.white,
                        checkboxBorderColor: Color(0xFF95A1AC),
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        initialized: _model.checkboxGroupValues != null,
                      ).animateOnPageLoad(
                          animationsMap['checkboxGroupOnPageLoadAnimation']!),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trust & Support Fee',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          Text(
                            'K4.20/hr',
                            style: FlutterFlowTheme.of(context).bodyMedium,
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
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'com.inkonzo.inkonzo',
                      style: FlutterFlowTheme.of(context).titleMedium,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Text(
                            'K',
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Text(
                            widget.totalAmount.toString(),
                            style: FlutterFlowTheme.of(context).headlineSmall,
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.9, 0.0),
                          child: Text(
                            '/hr',
                            style: FlutterFlowTheme.of(context).headlineSmall,
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
              Expanded(
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: Text(
                    'You may see a temporary hold on your payment method in the amount of your Taskers hourly rate of K15. You can cancel at any time. Tasks cancelled less than 24 hours before start time may be billed a cancellation fee of one our. Tasks have a one-hour minimum.',
                    style: FlutterFlowTheme.of(context).bodySmall,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 16.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  text: 'Confirm',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 50.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                        ),
                    elevation: 2.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
