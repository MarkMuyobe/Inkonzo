import '/backend/backend.dart';
import '/components/empty_list/empty_list_widget.dart';
import '/components/provider_rating/provider_rating_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchPage2Model extends FlutterFlowModel {
  ///  Local state fields for this page.

  LatLng? locale;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Query widget.
  TextEditingController? queryController;
  String? Function(BuildContext, String?)? queryControllerValidator;
  // Algolia Search Results from action on Query
  List<ProviderDocumentsRecord>? algoliaSearchResults = [];

  List<ProviderDocumentsRecord>? sortedProviderByLocations = [];

  List<ProviderDocumentsRecord>? sortedProviderByDate = [];

  List<ProviderDocumentsRecord>? filterByAvailability = [];
  // State field(s) for ChoiceChipsSet widget.
  String? choiceChipsSetValue;
  FormFieldController<List<String>>? choiceChipsSetValueController;
  // Models for provider_rating dynamic component.
  late FlutterFlowDynamicModels<ProviderRatingModel> providerRatingModels1;
  // Model for provider_rating component.
  late ProviderRatingModel providerRatingModel2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    providerRatingModels1 =
        FlutterFlowDynamicModels(() => ProviderRatingModel());
    providerRatingModel2 = createModel(context, () => ProviderRatingModel());
  }

  void dispose() {
    unfocusNode.dispose();
    queryController?.dispose();
    providerRatingModels1.dispose();
    providerRatingModel2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
