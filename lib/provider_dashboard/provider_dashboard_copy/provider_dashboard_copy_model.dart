import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rating2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProviderDashboardCopyModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Models for rating2 dynamic component.
  late FlutterFlowDynamicModels<Rating2Model> rating2Models;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rating2Models = FlutterFlowDynamicModels(() => Rating2Model());
  }

  void dispose() {
    rating2Models.dispose();
  }

  /// Additional helper methods are added here.

}
