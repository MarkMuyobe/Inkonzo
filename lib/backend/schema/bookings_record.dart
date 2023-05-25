import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bookingDate" field.
  DateTime? _bookingDate;
  DateTime? get bookingDate => _bookingDate;
  bool hasBookingDate() => _bookingDate != null;

  // "providerRef" field.
  DocumentReference? _providerRef;
  DocumentReference? get providerRef => _providerRef;
  bool hasProviderRef() => _providerRef != null;

  // "providerName" field.
  String? _providerName;
  String get providerName => _providerName ?? '';
  bool hasProviderName() => _providerName != null;

  // "bookingStatus" field.
  String? _bookingStatus;
  String get bookingStatus => _bookingStatus ?? '';
  bool hasBookingStatus() => _bookingStatus != null;

  // "providerImage" field.
  String? _providerImage;
  String get providerImage => _providerImage ?? '';
  bool hasProviderImage() => _providerImage != null;

  // "bookingPrice" field.
  double? _bookingPrice;
  double get bookingPrice => _bookingPrice ?? 0.0;
  bool hasBookingPrice() => _bookingPrice != null;

  // "services" field.
  List<String>? _services;
  List<String> get services => _services ?? const [];
  bool hasServices() => _services != null;

  // "bookingID" field.
  String? _bookingID;
  String get bookingID => _bookingID ?? '';
  bool hasBookingID() => _bookingID != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _bookingDate = snapshotData['bookingDate'] as DateTime?;
    _providerRef = snapshotData['providerRef'] as DocumentReference?;
    _providerName = snapshotData['providerName'] as String?;
    _bookingStatus = snapshotData['bookingStatus'] as String?;
    _providerImage = snapshotData['providerImage'] as String?;
    _bookingPrice = castToType<double>(snapshotData['bookingPrice']);
    _services = getDataList(snapshotData['services']);
    _bookingID = snapshotData['bookingID'] as String?;
    _endDate = snapshotData['endDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bookings')
          : FirebaseFirestore.instance.collectionGroup('bookings');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bookings').doc();

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createBookingsRecordData({
  DateTime? bookingDate,
  DocumentReference? providerRef,
  String? providerName,
  String? bookingStatus,
  String? providerImage,
  double? bookingPrice,
  String? bookingID,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookingDate': bookingDate,
      'providerRef': providerRef,
      'providerName': providerName,
      'bookingStatus': bookingStatus,
      'providerImage': providerImage,
      'bookingPrice': bookingPrice,
      'bookingID': bookingID,
      'endDate': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}
