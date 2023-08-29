import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class DealsRecord extends FirestoreRecord {
  DealsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "clientName" field.
  String? _clientName;
  String get clientName => _clientName ?? '';
  bool hasClientName() => _clientName != null;

  // "providerName" field.
  String? _providerName;
  String get providerName => _providerName ?? '';
  bool hasProviderName() => _providerName != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "clientRef" field.
  DocumentReference? _clientRef;
  DocumentReference? get clientRef => _clientRef;
  bool hasClientRef() => _clientRef != null;

  // "providerRef" field.
  DocumentReference? _providerRef;
  DocumentReference? get providerRef => _providerRef;
  bool hasProviderRef() => _providerRef != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "timeOfResponse" field.
  DateTime? _timeOfResponse;
  DateTime? get timeOfResponse => _timeOfResponse;
  bool hasTimeOfResponse() => _timeOfResponse != null;

  // "providerImage" field.
  String? _providerImage;
  String get providerImage => _providerImage ?? '';
  bool hasProviderImage() => _providerImage != null;

  // "clientImage" field.
  String? _clientImage;
  String get clientImage => _clientImage ?? '';
  bool hasClientImage() => _clientImage != null;

  // "timeOfClosure" field.
  DateTime? _timeOfClosure;
  DateTime? get timeOfClosure => _timeOfClosure;
  bool hasTimeOfClosure() => _timeOfClosure != null;

  // "cancelledBy" field.
  String? _cancelledBy;
  String get cancelledBy => _cancelledBy ?? '';
  bool hasCancelledBy() => _cancelledBy != null;

  // "providerDocRef" field.
  DocumentReference? _providerDocRef;
  DocumentReference? get providerDocRef => _providerDocRef;
  bool hasProviderDocRef() => _providerDocRef != null;

  // "reviewedByClient" field.
  bool? _reviewedByClient;
  bool get reviewedByClient => _reviewedByClient ?? false;
  bool hasReviewedByClient() => _reviewedByClient != null;

  // "services" field.
  List<DocumentReference>? _services;
  List<DocumentReference> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  void _initializeFields() {
    _clientName = snapshotData['clientName'] as String?;
    _providerName = snapshotData['providerName'] as String?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _clientRef = snapshotData['clientRef'] as DocumentReference?;
    _providerRef = snapshotData['providerRef'] as DocumentReference?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
    _users = getDataList(snapshotData['users']);
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _timeOfResponse = snapshotData['timeOfResponse'] as DateTime?;
    _providerImage = snapshotData['providerImage'] as String?;
    _clientImage = snapshotData['clientImage'] as String?;
    _timeOfClosure = snapshotData['timeOfClosure'] as DateTime?;
    _cancelledBy = snapshotData['cancelledBy'] as String?;
    _providerDocRef = snapshotData['providerDocRef'] as DocumentReference?;
    _reviewedByClient = snapshotData['reviewedByClient'] as bool?;
    _services = getDataList(snapshotData['services']);
    _amount = castToType<double>(snapshotData['amount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('deals');

  static Stream<DealsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DealsRecord.fromSnapshot(s));

  static Future<DealsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DealsRecord.fromSnapshot(s));

  static DealsRecord fromSnapshot(DocumentSnapshot snapshot) => DealsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DealsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DealsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DealsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DealsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDealsRecordData({
  String? clientName,
  String? providerName,
  DateTime? dateCreated,
  String? status,
  DocumentReference? clientRef,
  DocumentReference? providerRef,
  DocumentReference? chatRef,
  DateTime? startTime,
  DateTime? endTime,
  DateTime? timeOfResponse,
  String? providerImage,
  String? clientImage,
  DateTime? timeOfClosure,
  String? cancelledBy,
  DocumentReference? providerDocRef,
  bool? reviewedByClient,
  double? amount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'clientName': clientName,
      'providerName': providerName,
      'dateCreated': dateCreated,
      'status': status,
      'clientRef': clientRef,
      'providerRef': providerRef,
      'chatRef': chatRef,
      'startTime': startTime,
      'endTime': endTime,
      'timeOfResponse': timeOfResponse,
      'providerImage': providerImage,
      'clientImage': clientImage,
      'timeOfClosure': timeOfClosure,
      'cancelledBy': cancelledBy,
      'providerDocRef': providerDocRef,
      'reviewedByClient': reviewedByClient,
      'amount': amount,
    }.withoutNulls,
  );

  return firestoreData;
}

class DealsRecordDocumentEquality implements Equality<DealsRecord> {
  const DealsRecordDocumentEquality();

  @override
  bool equals(DealsRecord? e1, DealsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.clientName == e2?.clientName &&
        e1?.providerName == e2?.providerName &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.status == e2?.status &&
        e1?.clientRef == e2?.clientRef &&
        e1?.providerRef == e2?.providerRef &&
        e1?.chatRef == e2?.chatRef &&
        listEquality.equals(e1?.users, e2?.users) &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.timeOfResponse == e2?.timeOfResponse &&
        e1?.providerImage == e2?.providerImage &&
        e1?.clientImage == e2?.clientImage &&
        e1?.timeOfClosure == e2?.timeOfClosure &&
        e1?.cancelledBy == e2?.cancelledBy &&
        e1?.providerDocRef == e2?.providerDocRef &&
        e1?.reviewedByClient == e2?.reviewedByClient &&
        listEquality.equals(e1?.services, e2?.services) &&
        e1?.amount == e2?.amount;
  }

  @override
  int hash(DealsRecord? e) => const ListEquality().hash([
        e?.clientName,
        e?.providerName,
        e?.dateCreated,
        e?.status,
        e?.clientRef,
        e?.providerRef,
        e?.chatRef,
        e?.users,
        e?.startTime,
        e?.endTime,
        e?.timeOfResponse,
        e?.providerImage,
        e?.clientImage,
        e?.timeOfClosure,
        e?.cancelledBy,
        e?.providerDocRef,
        e?.reviewedByClient,
        e?.services,
        e?.amount
      ]);

  @override
  bool isValidKey(Object? o) => o is DealsRecord;
}
