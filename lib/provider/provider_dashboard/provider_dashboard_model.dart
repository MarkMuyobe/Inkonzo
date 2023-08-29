import '/backend/backend.dart';
import '/components/rating2/rating2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class ProviderDashboardModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<DocumentReference> users = [];
  void addToUsers(DocumentReference item) => users.add(item);
  void removeFromUsers(DocumentReference item) => users.remove(item);
  void removeAtIndexFromUsers(int index) => users.removeAt(index);
  void updateUsersAtIndex(int index, Function(DocumentReference) updateFn) =>
      users[index] = updateFn(users[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in providerDashboard widget.
  UsersRecord? userDoc;
  // Models for rating2 dynamic component.
  late FlutterFlowDynamicModels<Rating2Model> rating2Models;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    rating2Models = FlutterFlowDynamicModels(() => Rating2Model());
  }

  void dispose() {
    unfocusNode.dispose();
    rating2Models.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
