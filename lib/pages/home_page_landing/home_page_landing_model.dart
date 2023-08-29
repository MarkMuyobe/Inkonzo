import '/components/reviews_list/reviews_list_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

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
