import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ProviderRegisterModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  //State field(s) for name widget.
  TextEditingController? proffessionController;
  String? Function(BuildContext,String?)? proffessionControllerValidator;
  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for yearsWorked widget.
  TextEditingController? yearsWorkedController;
  String? Function(BuildContext, String?)? yearsWorkedControllerValidator;
  // State field(s) for ID widget.
  TextEditingController? idController;
  String? Function(BuildContext, String?)? idControllerValidator;
  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProviderDocumentsRecord? newProvider;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    nameController?.dispose();
    descriptionController?.dispose();
    yearsWorkedController?.dispose();
    idController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
