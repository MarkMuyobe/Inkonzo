import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  double? totalAmount = 0.0;

  List<DocumentReference> serviceList = [];
  void addToServiceList(DocumentReference item) => serviceList.add(item);
  void removeFromServiceList(DocumentReference item) =>
      serviceList.remove(item);
  void removeAtIndexFromServiceList(int index) => serviceList.removeAt(index);
  void updateServiceListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      serviceList[index] = updateFn(serviceList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Checkbox widget.

  Map<SkillsRecord, bool> checkboxValueMap = {};
  List<SkillsRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DealsRecord? deal;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
