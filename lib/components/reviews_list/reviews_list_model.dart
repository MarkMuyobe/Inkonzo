import '/backend/backend.dart';
import '/components/app_rating_bar/app_rating_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
