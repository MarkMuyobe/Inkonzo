import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ProviderReviewModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
