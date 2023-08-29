import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ServiceEntryModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Service widget.
  TextEditingController? serviceController;
  String? Function(BuildContext, String?)? serviceControllerValidator;
  // State field(s) for Charge widget.
  TextEditingController? chargeController;
  String? Function(BuildContext, String?)? chargeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    serviceController?.dispose();
    chargeController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
