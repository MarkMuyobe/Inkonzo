import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class CreateDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for HeaderTextField widget.
  TextEditingController? headerTextFieldController;
  String? Function(BuildContext, String?)? headerTextFieldControllerValidator;
  // State field(s) for BodyTextField widget.
  TextEditingController? bodyTextFieldController;
  String? Function(BuildContext, String?)? bodyTextFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    headerTextFieldController?.dispose();
    bodyTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
