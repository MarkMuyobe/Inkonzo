import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/app_review/app_review_widget.dart';
import '/components/reviews_list/reviews_list_widget.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/permissions_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageLandingModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Query widget.
  TextEditingController? queryController;
  String? Function(BuildContext, String?)? queryControllerValidator;
  // Model for reviews_list component.
  late ReviewsListModel reviewsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    reviewsListModel = createModel(context, () => ReviewsListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    queryController?.dispose();
    reviewsListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
