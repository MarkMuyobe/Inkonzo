import '/backend/backend.dart';
import '/components/app_rating_bar/app_rating_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'reviews_list_model.dart';
export 'reviews_list_model.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({Key? key}) : super(key: key);

  @override
  _ReviewsListWidgetState createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  late ReviewsListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsListModel());

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

    return StreamBuilder<List<ReviewsRecord>>(
      stream: queryReviewsRecord(
        queryBuilder: (reviewsRecord) =>
            reviewsRecord.orderBy('time', descending: true),
        limit: 15,
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
        List<ReviewsRecord> listViewReviewsRecordList = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: listViewReviewsRecordList.length,
          itemBuilder: (context, listViewIndex) {
            final listViewReviewsRecord =
                listViewReviewsRecordList[listViewIndex];
            return Padding(
              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
              child: Material(
                color: Colors.transparent,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.network(
                            valueOrDefault<String>(
                              listViewReviewsRecord.imageURL,
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/inkonzo-gpph9k/assets/oz616ii84cl4/gabriel_banda_12.png',
                            ),
                            width: 40.0,
                            height: 40.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                AutoSizeText(
                                  listViewReviewsRecord.user,
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                  child: VerticalDivider(
                                    thickness: 1.0,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                  ),
                                ),
                                wrapWithModel(
                                  model: _model.appRatingBarModels.getModel(
                                    listViewReviewsRecord.rating.toString(),
                                    listViewIndex,
                                  ),
                                  updateCallback: () => setState(() {}),
                                  child: AppRatingBarWidget(
                                    key: Key(
                                      'Keyiyd_${listViewReviewsRecord.rating.toString()}',
                                    ),
                                    ratingValue:
                                        listViewReviewsRecord.rating.toDouble(),
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    listViewReviewsRecord.rating.toString(),
                                    '4.2',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ],
                            ),
                            ClipRRect(
                              child: Container(
                                width: 300.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  listViewReviewsRecord.comment,
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    dateTimeFormat(
                                      'd/M H:mm',
                                      listViewReviewsRecord.time,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                    '123',
                                  ),
                                  style: FlutterFlowTheme.of(context).bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
