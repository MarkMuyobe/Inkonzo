import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SkillsRecord extends FirestoreRecord {
  SkillsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  bool hasSkill() => _skill != null;

  // "charge" field.
  double? _charge;
  double get charge => _charge ?? 0.0;
  bool hasCharge() => _charge != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _skill = snapshotData['skill'] as String?;
    _charge = castToType<double>(snapshotData['charge']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('skills')
          : FirebaseFirestore.instance.collectionGroup('skills');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('skills').doc();

  static Stream<SkillsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SkillsRecord.fromSnapshot(s));

  static Future<SkillsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SkillsRecord.fromSnapshot(s));

  static SkillsRecord fromSnapshot(DocumentSnapshot snapshot) => SkillsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SkillsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SkillsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SkillsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createSkillsRecordData({
  String? skill,
  double? charge,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'skill': skill,
      'charge': charge,
    }.withoutNulls,
  );

  return firestoreData;
}
