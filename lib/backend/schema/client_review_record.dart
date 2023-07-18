import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientReviewRecord extends FirestoreRecord {
  ClientReviewRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "timeStamp" field.
  DateTime? _timeStamp;
  DateTime? get timeStamp => _timeStamp;
  bool hasTimeStamp() => _timeStamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _clientName = snapshotData['clientName'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _comment = snapshotData['comment'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _timeStamp = snapshotData['timeStamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('clientReview')
          : FirebaseFirestore.instance.collectionGroup('clientReview');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('clientReview').doc();

  static Stream<ClientReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientReviewRecord.fromSnapshot(s));

  static Future<ClientReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientReviewRecord.fromSnapshot(s));

  static ClientReviewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientReviewRecordData({
  String? clientName,
  int? rating,
  String? comment,
  String? imageUrl,
  DocumentReference? clientRef,
  DateTime? timeStamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clientName': clientName,
      'rating': rating,
      'comment': comment,
      'imageUrl': imageUrl,
      'clientRef': clientRef,
      'timeStamp': timeStamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientReviewRecordDocumentEquality
    implements Equality<ClientReviewRecord> {
  const ClientReviewRecordDocumentEquality();

  @override
  bool equals(ClientReviewRecord? e1, ClientReviewRecord? e2) {
    return e1?.clientName == e2?.clientName &&
        e1?.rating == e2?.rating &&
        e1?.comment == e2?.comment &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.clientRef == e2?.clientRef &&
        e1?.timeStamp == e2?.timeStamp;
  }

  @override
  int hash(ClientReviewRecord? e) => const ListEquality().hash([
        e?.clientName,
        e?.rating,
        e?.comment,
        e?.imageUrl,
        e?.clientRef,
        e?.timeStamp
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientReviewRecord;
}
