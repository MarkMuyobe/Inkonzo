import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/reviews_list/reviews_list_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for queryField widget.
  final queryFieldKey = GlobalKey();
  TextEditingController? queryFieldController;
  String? queryFieldSelectedOption;
  String? Function(BuildContext, String?)? queryFieldControllerValidator;
  // Model for reviews_list component.
  late ReviewsListModel reviewsListModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    reviewsListModel = createModel(context, () => ReviewsListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    reviewsListModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

}
