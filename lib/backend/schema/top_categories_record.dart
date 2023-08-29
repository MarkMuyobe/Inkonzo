import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class TopCategoriesRecord extends FirestoreRecord {
  TopCategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categories" field.
  List<String>? _categories;
  List<String> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  void _initializeFields() {
    _categories = getDataList(snapshotData['categories']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('topCategories');

  static Stream<TopCategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TopCategoriesRecord.fromSnapshot(s));

  static Future<TopCategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TopCategoriesRecord.fromSnapshot(s));

  static TopCategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TopCategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TopCategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TopCategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TopCategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TopCategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTopCategoriesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class TopCategoriesRecordDocumentEquality
    implements Equality<TopCategoriesRecord> {
  const TopCategoriesRecordDocumentEquality();

  @override
  bool equals(TopCategoriesRecord? e1, TopCategoriesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.categories, e2?.categories);
  }

  @override
  int hash(TopCategoriesRecord? e) =>
      const ListEquality().hash([e?.categories]);

  @override
  bool isValidKey(Object? o) => o is TopCategoriesRecord;
}
