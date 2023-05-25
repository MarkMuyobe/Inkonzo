import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/availability_false/availability_false_widget.dart';
import '/components/availability_true/availability_true_widget.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/components/rating2_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProviderDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // Model for availability_false component.
  late AvailabilityFalseModel availabilityFalseModel;
  // Model for availability_true component.
  late AvailabilityTrueModel availabilityTrueModel;
  // Models for rating2 dynamic component.
  late FlutterFlowDynamicModels<Rating2Model> rating2Models;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    availabilityFalseModel =
        createModel(context, () => AvailabilityFalseModel());
    availabilityTrueModel = createModel(context, () => AvailabilityTrueModel());
    rating2Models = FlutterFlowDynamicModels(() => Rating2Model());
  }

  void dispose() {
    availabilityFalseModel.dispose();
    availabilityTrueModel.dispose();
    rating2Models.dispose();
  }

  /// Additional helper methods are added here.

}
