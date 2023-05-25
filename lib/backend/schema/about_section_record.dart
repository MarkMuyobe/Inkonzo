import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AboutSectionRecord extends FirestoreRecord {
  AboutSectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  bool hasHeader() => _header != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _body = snapshotData['body'] as String?;
    _header = snapshotData['header'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('aboutSection')
          : FirebaseFirestore.instance.collectionGroup('aboutSection');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('aboutSection').doc();

  static Stream<AboutSectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AboutSectionRecord.fromSnapshot(s));

  static Future<AboutSectionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AboutSectionRecord.fromSnapshot(s));

  static AboutSectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AboutSectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AboutSectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AboutSectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AboutSectionRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createAboutSectionRecordData({
  String? image,
  String? body,
  String? header,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'body': body,
      'header': header,
    }.withoutNulls,
  );

  return firestoreData;
}
