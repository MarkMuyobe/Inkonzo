import '/backend/backend.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool algoliaRequestCompleted = false;
  String? algoliaRequestLastUniqueKey;
  // State field(s) for queryField widget.
  final queryFieldKey = GlobalKey();
  TextEditingController? queryFieldController;
  String? queryFieldSelectedOption;
  String? Function(BuildContext, String?)? queryFieldControllerValidator;
  // Algolia Search Results from action on queryField
  List<ProviderDocumentsRecord>? algoliaSearchResults = [];
  // State field(s) for ChoiceChipsSet widget.
  String? choiceChipsSetValue;
  FormFieldController<List<String>>? choiceChipsSetValueController;
  // Models for provider_rating dynamic component.
  late FlutterFlowDynamicModels<ProviderRatingModel> providerRatingModels1;
  // Models for provider_rating dynamic component.
  late FlutterFlowDynamicModels<ProviderRatingModel> providerRatingModels2;
  // Models for provider_rating dynamic component.
  late FlutterFlowDynamicModels<ProviderRatingModel> providerRatingModels3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    providerRatingModels1 =
        FlutterFlowDynamicModels(() => ProviderRatingModel());
    providerRatingModels2 =
        FlutterFlowDynamicModels(() => ProviderRatingModel());
    providerRatingModels3 =
        FlutterFlowDynamicModels(() => ProviderRatingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    providerRatingModels1.dispose();
    providerRatingModels2.dispose();
    providerRatingModels3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
