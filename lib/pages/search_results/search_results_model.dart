import '/backend/backend.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchResultsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  Completer<List<ProviderDocumentsRecord>>? algoliaRequestCompleter;
  // State field(s) for queryField widget.
  final queryFieldKey = GlobalKey();
  TextEditingController? queryFieldController;
  String? queryFieldSelectedOption;
  String? Function(BuildContext, String?)? queryFieldControllerValidator;
  // Algolia Search Results from action on queryField
  List<ProviderDocumentsRecord>? algoliaSearchResults = [];
  // Models for provider_rating dynamic component.
  late FlutterFlowDynamicModels<ProviderRatingModel> providerRatingModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    providerRatingModels =
        FlutterFlowDynamicModels(() => ProviderRatingModel());
  }

  void dispose() {
    providerRatingModels.dispose();
  }

  /// Additional helper methods are added here.

  Future waitForAlgoliaRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = algoliaRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
