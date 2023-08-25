import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'search_page2_model.dart';
export 'search_page2_model.dart';

class SearchPage2Widget extends StatefulWidget {
  const SearchPage2Widget({
    Key? key,
    this.initialQuery,
  }) : super(key: key);

  final String? initialQuery;

  @override
  _SearchPage2WidgetState createState() => _SearchPage2WidgetState();
}

class _SearchPage2WidgetState extends State<SearchPage2Widget> {
  late SearchPage2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late LatLng?  currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPage2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'searchPage2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SEARCH_PAGE2_searchPage2_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(37.4298229, -122.1735655));
      logFirebaseEvent('searchPage2_update_widget_state');
      setState(() {
        _model.locale = currentUserLocationValue;
      });
    });

    _model.queryController ??= TextEditingController(text: widget.initialQuery);
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Container(
                            height: 50.0,
                            constraints: BoxConstraints(
                              minWidth: 300.0,
                              maxWidth: 1000.0,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(24.0),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.search,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.queryController,
                                      onFieldSubmitted: (_) async {
                                        logFirebaseEvent(
                                            'SEARCH_PAGE2_Query_ON_TEXTFIELD_SUBMIT');
                                        currentUserLocationValue =
                                            await getCurrentUserLocation(
                                                defaultLocation:
                                                    LatLng(0.0, 0.0));
                                        logFirebaseEvent(
                                            'Query_update_app_state');
                                        setState(() {
                                          FFAppState().searchActive = true;
                                        });
                                        logFirebaseEvent(
                                            'Query_algolia_search');
                                        setState(() =>
                                            _model.algoliaSearchResults = null);
                                        await ProviderDocumentsRecord.search(
                                          term: _model.queryController.text,
                                          location: getCurrentUserLocation(
                                              defaultLocation: LatLng(
                                                  37.4298229, -122.1735655)),
                                          useCache: true,
                                        )
                                            .then((r) =>
                                                _model.algoliaSearchResults = r)
                                            .onError((_, __) => _model
                                                .algoliaSearchResults = [])
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium,
                                        hintText:
                                            'Search Business, Name, Service...',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .titleMedium,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .titleMedium,
                                      validator: _model.queryControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.send,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    logFirebaseEvent(
                                        'SEARCH_PAGE2_PAGE_send_ICN_ON_TAP');
                                    logFirebaseEvent(
                                        'IconButton_update_app_state');
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'SEARCH_PAGE2_PAGE_BackButton_ON_TAP');
                                  logFirebaseEvent('BackButton_navigate_back');
                                  context.safePop();
                                },
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  shape: const CircleBorder(),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      shape: BoxShape.circle,
                                    ),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'SEARCH_PAGE2_PAGE_Icon_b4znljs8_ON_TAP');
                                        logFirebaseEvent('Icon_navigate_back');
                                        context.safePop();
                                      },
                                      child: Icon(
                                        Icons.arrow_back_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: FlutterFlowChoiceChips(
                                      options: [
                                        ChipData('all'),
                                        ChipData('closest'),
                                        ChipData('available'),
                                        ChipData('new')
                                      ],
                                      onChanged: (val) async {
                                        setState(() => _model
                                            .choiceChipsSetValue = val?.first);
                                        logFirebaseEvent(
                                            'SEARCH_PAGE2_ChoiceChipsSet_ON_FORM_WIDG');
                                        logFirebaseEvent(
                                            'ChoiceChipsSet_update_app_state');
                                        setState(() {});
                                      },
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                        ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        iconSize: 18.0,
                                        elevation: 4.0,
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        iconSize: 18.0,
                                        elevation: 0.0,
                                        borderRadius: BorderRadius.circular(16.0),
                                      ),
                                      chipSpacing: 16.0,
                                      rowSpacing: 16.0,
                                      multiselect: false,
                                      initialized:
                                      _model.choiceChipsSetValue != null,
                                      alignment: WrapAlignment.center,
                                      controller:
                                      _model.choiceChipsSetValueController ??=
                                          FormFieldController<List<String>>(
                                            ['all'],
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<List<ProviderDocumentsRecord>>(
                  future: ProviderDocumentsRecord.search(
                    term: _model.queryController.text,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final List<ProviderDocumentsRecord>
                        containerProviderDocumentsRecordList = snapshot.data!;

                    final userLocation = _model.locale ?? LatLng(0.0, 0.0);

                    // Filter the list to keep only items where availability is true
                    _model.filterByAvailability = containerProviderDocumentsRecordList
                        .where((item) => item.availability == true)
                        .toList();
                    // Sort the list so that they are in order of the users location
                    _model.sortedProviderByLocations = functions.sortByDistance(
                        containerProviderDocumentsRecordList,
                        userLocation);

                    _model.sortedProviderByDate = functions.sortByDateJoined(
                        containerProviderDocumentsRecordList);

                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (_model.choiceChipsSetValue == 'all')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.algoliaSearchResults == null) {
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
                                  final allItems =
                                      _model.algoliaSearchResults?.toList() ??
                                          [];
                                  if (allItems.isEmpty) {
                                    return EmptyListWidget();
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(allItems.length,
                                        (allItemsIndex) {
                                      final allItemsItem =
                                          allItems[allItemsIndex];
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'SEARCH_PAGE2_PAGE_Store_ListView_ON_TAP');
                                            logFirebaseEvent(
                                                'Store_ListView_navigate_to');

                                            context.pushNamed(
                                              'ProviderDetail',
                                              queryParameters: {
                                                'userRef': serializeParam(
                                                  allItemsItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 3.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                            ),
                                            child: Container(
                                              width: double.infinity,
                                              height: 90.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    8.0,
                                                                    8.0,
                                                                    8.0,
                                                                    8.0),
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      36.0),
                                                          child: Image.network(
                                                            valueOrDefault<
                                                                String>(
                                                              allItemsItem
                                                                  .imageUrl,
                                                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/inkonzo-gpph9k/assets/lyrt34b9827m/depositphotos_137014128-stock-illustration-user-profile-icon.webp',
                                                            ),
                                                            width: 74.0,
                                                            height: 74.0,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Flexible(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  1.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    allItemsItem
                                                                        .name,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall,
                                                                  ),
                                                                  if (allItemsItem
                                                                      .verified)
                                                                    Icon(
                                                                      Icons
                                                                          .verified,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          15.0,
                                                                    ),
                                                                ],
                                                              ),
                                                              Text(
                                                                '${valueOrDefault<String>(
                                                                  formatNumber(
                                                                    functions.calculateDistance(
                                                                      _model.locale!,
                                                                      allItemsItem.workLocation!,
                                                                    ),
                                                                    formatType: FormatType.decimal,
                                                                    decimalType: DecimalType.periodDecimal,
                                                                  ),
                                                                  '0.0',
                                                                )} Km Away'.maybeHandleOverflow(maxChars: 4),
                                                                style: FlutterFlowTheme.of(context).bodyMedium,
                                                              ),

                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                allItemsItem
                                                                    .proffession,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall,
                                                              ),
                                                            ],
                                                          ),
                                                          Flexible(
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    wrapWithModel(
                                                                      model: _model
                                                                          .providerRatingModels1
                                                                          .getModel(
                                                                        allItemsItem
                                                                            .rating
                                                                            .toString(),
                                                                        allItemsIndex,
                                                                      ),
                                                                      updateCallback:
                                                                          () =>
                                                                              setState(() {}),
                                                                      child:
                                                                          ProviderRatingWidget(
                                                                        key:
                                                                            Key(
                                                                          'Keyood_${allItemsItem.rating.toString()}',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        allItemsItem
                                                                            .rating
                                                                            .toString(),
                                                                        '3',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        if (!allItemsItem
                                                                            .availability)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFFF80000),
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                'Unvailable',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFFF80000),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        if (allItemsItem
                                                                            .availability)
                                                                          Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFF00FB0F),
                                                                                width: 2.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                'Available',
                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF00FB0F),
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
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
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      8.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .chevron_right_outlined,
                                                            color: Color(
                                                                0xFF95A1AC),
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
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
                          if (_model.choiceChipsSetValue == 'available')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.filterByAvailability == null) {
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
                                  final allItems =
                                      _model.filterByAvailability?.toList() ??
                                          [];
                                  if (allItems.isEmpty) {
                                    return EmptyListWidget();
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(allItems.length,
                                            (allItemsIndex) {
                                          final allItemsItem =
                                          allItems[allItemsIndex];
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SEARCH_PAGE2_PAGE_Store_ListView_ON_TAP');
                                                logFirebaseEvent(
                                                    'Store_ListView_navigate_to');

                                                context.pushNamed(
                                                  'ProviderDetail',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      allItemsItem.reference,
                                                      ParamType.DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(24.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 90.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(24.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                8.0,
                                                                8.0,
                                                                8.0,
                                                                8.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  36.0),
                                                              child: Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  allItemsItem
                                                                      .imageUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/inkonzo-gpph9k/assets/lyrt34b9827m/depositphotos_137014128-stock-illustration-user-profile-icon.webp',
                                                                ),
                                                                width: 74.0,
                                                                height: 74.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              8.0,
                                                              1.0,
                                                              0.0,
                                                              0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        allItemsItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(
                                                                            context)
                                                                            .titleSmall,
                                                                      ),
                                                                      if (allItemsItem
                                                                          .verified)
                                                                        Icon(
                                                                          Icons
                                                                              .verified,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primary,
                                                                          size:
                                                                          15.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          functions.calculateDistance(
                                                                              _model
                                                                                  .locale!,
                                                                              allItemsItem
                                                                                  .workLocation!),
                                                                          formatType:
                                                                          FormatType
                                                                              .decimal,
                                                                          decimalType:
                                                                          DecimalType
                                                                              .periodDecimal,
                                                                        ),
                                                                        '0.0',
                                                                      )}Km Away',
                                                                      '0.0',
                                                                    ).maybeHandleOverflow(
                                                                        maxChars:
                                                                        4),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Text(
                                                                    allItemsItem
                                                                        .proffession,
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodySmall,
                                                                  ),
                                                                ],
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .providerRatingModels1
                                                                              .getModel(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            allItemsIndex,
                                                                          ),
                                                                          updateCallback:
                                                                              () =>
                                                                              setState(() {}),
                                                                          child:
                                                                          ProviderRatingWidget(
                                                                            key:
                                                                            Key(
                                                                              'Keyood_${allItemsItem.rating.toString()}',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            '3',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily:
                                                                            'Poppins',
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                            FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                        Axis.horizontal,
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                          children: [
                                                                            if (!allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFF80000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Unvailable',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFFF80000),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFF00FB0F),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Available',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF00FB0F),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
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
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .chevron_right_outlined,
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                          if (_model.choiceChipsSetValue == 'closest')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.sortedProviderByLocations == null ) {
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

                                  final allItems =
                                      _model.sortedProviderByLocations?.toList() ??
                                          [];
                                  if (allItems.isEmpty) {
                                    return EmptyListWidget();
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(allItems.length,
                                            (allItemsIndex) {
                                          final allItemsItem =
                                          allItems[allItemsIndex];
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SEARCH_PAGE2_PAGE_Store_ListView_ON_TAP');
                                                logFirebaseEvent(
                                                    'Store_ListView_navigate_to');

                                                context.pushNamed(
                                                  'ProviderDetail',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      allItemsItem.reference,
                                                      ParamType.DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(24.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 90.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(24.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                8.0,
                                                                8.0,
                                                                8.0,
                                                                8.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  36.0),
                                                              child: Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  allItemsItem
                                                                      .imageUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/inkonzo-gpph9k/assets/lyrt34b9827m/depositphotos_137014128-stock-illustration-user-profile-icon.webp',
                                                                ),
                                                                width: 74.0,
                                                                height: 74.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              8.0,
                                                              1.0,
                                                              0.0,
                                                              0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        allItemsItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(
                                                                            context)
                                                                            .titleSmall,
                                                                      ),
                                                                      if (allItemsItem
                                                                          .verified)
                                                                        Icon(
                                                                          Icons
                                                                              .verified,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primary,
                                                                          size:
                                                                          15.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          functions.calculateDistance(
                                                                              _model
                                                                                  .locale!,
                                                                              allItemsItem
                                                                                  .workLocation!),
                                                                          formatType: FormatType.decimal,
                                                                          decimalType: DecimalType.periodDecimal,
                                                                        ),
                                                                        '0.0',
                                                                      )}Km Away',
                                                                      '0.0',
                                                                    ).maybeHandleOverflow(
                                                                        maxChars:
                                                                        4),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Text(
                                                                    allItemsItem
                                                                        .proffession,
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodySmall,
                                                                  ),
                                                                ],
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .providerRatingModels1
                                                                              .getModel(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            allItemsIndex,
                                                                          ),
                                                                          updateCallback:
                                                                              () =>
                                                                              setState(() {}),
                                                                          child:
                                                                          ProviderRatingWidget(
                                                                            key:
                                                                            Key(
                                                                              'Keyood_${allItemsItem.rating.toString()}',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            '3',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily:
                                                                            'Poppins',
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                            FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                        Axis.horizontal,
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                          children: [
                                                                            if (!allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFF80000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Unvailable',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFFF80000),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFF00FB0F),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Available',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF00FB0F),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
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
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .chevron_right_outlined,
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                          if (_model.choiceChipsSetValue == 'new')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  if (_model.sortedProviderByDate == null ) {
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

                                  final allItems =
                                      _model.sortedProviderByDate?.toList() ??
                                          [];
                                  if (allItems.isEmpty) {
                                    return EmptyListWidget();
                                  }
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: List.generate(allItems.length,
                                            (allItemsIndex) {
                                          final allItemsItem =
                                          allItems[allItemsIndex];
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                8.0, 8.0, 8.0, 8.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor: Colors.transparent,
                                              onTap: () async {
                                                logFirebaseEvent(
                                                    'SEARCH_PAGE2_PAGE_Store_ListView_ON_TAP');
                                                logFirebaseEvent(
                                                    'Store_ListView_navigate_to');

                                                context.pushNamed(
                                                  'ProviderDetail',
                                                  queryParameters: {
                                                    'userRef': serializeParam(
                                                      allItemsItem.reference,
                                                      ParamType.DocumentReference,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              child: Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(24.0),
                                                ),
                                                child: Container(
                                                  width: double.infinity,
                                                  height: 90.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                    BorderRadius.circular(24.0),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                8.0,
                                                                8.0,
                                                                8.0,
                                                                8.0),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                  36.0),
                                                              child: Image.network(
                                                                valueOrDefault<
                                                                    String>(
                                                                  allItemsItem
                                                                      .imageUrl,
                                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/inkonzo-gpph9k/assets/lyrt34b9827m/depositphotos_137014128-stock-illustration-user-profile-icon.webp',
                                                                ),
                                                                width: 74.0,
                                                                height: 74.0,
                                                                fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Flexible(
                                                        child: Padding(
                                                          padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                              8.0,
                                                              1.0,
                                                              0.0,
                                                              0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                            MainAxisSize.max,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                    children: [
                                                                      Text(
                                                                        allItemsItem
                                                                            .name,
                                                                        style: FlutterFlowTheme.of(
                                                                            context)
                                                                            .titleSmall,
                                                                      ),
                                                                      if (allItemsItem
                                                                          .verified)
                                                                        Icon(
                                                                          Icons
                                                                              .verified,
                                                                          color: FlutterFlowTheme.of(
                                                                              context)
                                                                              .primary,
                                                                          size:
                                                                          15.0,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      '${valueOrDefault<String>(
                                                                        formatNumber(
                                                                          functions.calculateDistance(
                                                                              _model
                                                                                  .locale!,
                                                                              allItemsItem
                                                                                  .workLocation!),
                                                                          formatType: FormatType.decimal,
                                                                          decimalType: DecimalType.periodDecimal,
                                                                        ),
                                                                        '0.0',
                                                                      )}Km Away',
                                                                      '0.0',
                                                                    ).maybeHandleOverflow(
                                                                        maxChars:
                                                                        4),
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                                children: [
                                                                  Text(
                                                                    allItemsItem
                                                                        .proffession,
                                                                    style: FlutterFlowTheme.of(
                                                                        context)
                                                                        .bodySmall,
                                                                  ),
                                                                ],
                                                              ),
                                                              Flexible(
                                                                child: Row(
                                                                  mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                      children: [
                                                                        wrapWithModel(
                                                                          model: _model
                                                                              .providerRatingModels1
                                                                              .getModel(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            allItemsIndex,
                                                                          ),
                                                                          updateCallback:
                                                                              () =>
                                                                              setState(() {}),
                                                                          child:
                                                                          ProviderRatingWidget(
                                                                            key:
                                                                            Key(
                                                                              'Keyood_${allItemsItem.rating.toString()}',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            allItemsItem
                                                                                .rating
                                                                                .toString(),
                                                                            '3',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(
                                                                              context)
                                                                              .bodyMedium
                                                                              .override(
                                                                            fontFamily:
                                                                            'Poppins',
                                                                            color:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                            fontWeight:
                                                                            FontWeight.w500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                      SingleChildScrollView(
                                                                        scrollDirection:
                                                                        Axis.horizontal,
                                                                        child: Row(
                                                                          mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                          children: [
                                                                            if (!allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFF80000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Unvailable',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFFF80000),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            if (allItemsItem
                                                                                .availability)
                                                                              Container(
                                                                                decoration:
                                                                                BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFF00FB0F),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                ),
                                                                                child:
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                  child: Text(
                                                                                    'Available',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                      fontFamily: 'Poppins',
                                                                                      color: Color(0xFF00FB0F),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                          ],
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
                                                      Column(
                                                        mainAxisSize:
                                                        MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .chevron_right_outlined,
                                                                color: Color(
                                                                    0xFF95A1AC),
                                                                size: 24.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
