import '/components/app_rating_bar/app_rating_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ReviewsListModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Models for AppRatingBar dynamic component.
  late FlutterFlowDynamicModels<AppRatingBarModel> appRatingBarModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    appRatingBarModels = FlutterFlowDynamicModels(() => AppRatingBarModel());
  }

  void dispose() {
    appRatingBarModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
