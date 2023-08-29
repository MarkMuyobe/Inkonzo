import '/backend/backend.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';

class SearchPageCopydModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  LatLng? here;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Query widget.
  TextEditingController? queryController;
  String? Function(BuildContext, String?)? queryControllerValidator;
  // Algolia Search Results from action on Query
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
    queryController?.dispose();
    providerRatingModels1.dispose();
    providerRatingModels2.dispose();
    providerRatingModels3.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
