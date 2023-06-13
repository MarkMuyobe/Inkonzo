import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProviderDocumentsRecord extends FirestoreRecord {
  ProviderDocumentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "availability" field.
  bool? _availability;
  bool get availability => _availability ?? false;
  bool hasAvailability() => _availability != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "skills" field.
  List<String>? _skills;
  List<String> get skills => _skills ?? const [];
  bool hasSkills() => _skills != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "hourlyRate" field.
  double? _hourlyRate;
  double get hourlyRate => _hourlyRate ?? 0.0;
  bool hasHourlyRate() => _hourlyRate != null;

  // "workLocation" field.
  LatLng? _workLocation;
  LatLng? get workLocation => _workLocation;
  bool hasWorkLocation() => _workLocation != null;

  // "bookingFee" field.
  double? _bookingFee;
  double get bookingFee => _bookingFee ?? 0.0;
  bool hasBookingFee() => _bookingFee != null;

  // "totalEarnings" field.
  double? _totalEarnings;
  double get totalEarnings => _totalEarnings ?? 0.0;
  bool hasTotalEarnings() => _totalEarnings != null;

  // "totalClients" field.
  int? _totalClients;
  int get totalClients => _totalClients ?? 0;
  bool hasTotalClients() => _totalClients != null;

  // "inkonzoComments" field.
  List<String>? _inkonzoComments;
  List<String> get inkonzoComments => _inkonzoComments ?? const [];
  bool hasInkonzoComments() => _inkonzoComments != null;

  // "dateJoined" field.
  DateTime? _dateJoined;
  DateTime? get dateJoined => _dateJoined;
  bool hasDateJoined() => _dateJoined != null;

  // "workDescription" field.
  String? _workDescription;
  String get workDescription => _workDescription ?? '';
  bool hasWorkDescription() => _workDescription != null;

  void _initializeFields() {
    _rating = snapshotData['rating'] as int?;
    _availability = snapshotData['availability'] as bool?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _name = snapshotData['name'] as String?;
    _skills = getDataList(snapshotData['skills']);
    _businessName = snapshotData['businessName'] as String?;
    _hourlyRate = castToType<double>(snapshotData['hourlyRate']);
    _workLocation = snapshotData['workLocation'] as LatLng?;
    _bookingFee = castToType<double>(snapshotData['bookingFee']);
    _totalEarnings = castToType<double>(snapshotData['totalEarnings']);
    _totalClients = snapshotData['totalClients'] as int?;
    _inkonzoComments = getDataList(snapshotData['inkonzoComments']);
    _dateJoined = snapshotData['dateJoined'] as DateTime?;
    _workDescription = snapshotData['workDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProviderDocuments');

  static Stream<ProviderDocumentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProviderDocumentsRecord.fromSnapshot(s));

  static Future<ProviderDocumentsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProviderDocumentsRecord.fromSnapshot(s));

  static ProviderDocumentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProviderDocumentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProviderDocumentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProviderDocumentsRecord._(reference, mapFromFirestore(data));

  static ProviderDocumentsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ProviderDocumentsRecord.getDocumentFromData(
        {
          'rating': snapshot.data['rating']?.round(),
          'availability': snapshot.data['availability'],
          'imageUrl': snapshot.data['imageUrl'],
          'name': snapshot.data['name'],
          'skills': safeGet(
            () => snapshot.data['skills'].toList(),
          ),
          'businessName': snapshot.data['businessName'],
          'hourlyRate': snapshot.data['hourlyRate']?.toDouble(),
          'workLocation': safeGet(
            () => LatLng(
              snapshot.data['_geoloc']['lat'],
              snapshot.data['_geoloc']['lng'],
            ),
          ),
          'bookingFee': snapshot.data['bookingFee']?.toDouble(),
          'totalEarnings': snapshot.data['totalEarnings']?.toDouble(),
          'totalClients': snapshot.data['totalClients']?.round(),
          'inkonzoComments': safeGet(
            () => snapshot.data['inkonzoComments'].toList(),
          ),
          'dateJoined': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(
                snapshot.data['dateJoined']),
          ),
          'workDescription': snapshot.data['workDescription'],
        },
        ProviderDocumentsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ProviderDocumentsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'ProviderDocuments',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ProviderDocumentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProviderDocumentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProviderDocumentsRecordData({
  int? rating,
  bool? availability,
  String? imageUrl,
  String? name,
  String? businessName,
  double? hourlyRate,
  LatLng? workLocation,
  double? bookingFee,
  double? totalEarnings,
  int? totalClients,
  DateTime? dateJoined,
  String? workDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'availability': availability,
      'imageUrl': imageUrl,
      'name': name,
      'businessName': businessName,
      'hourlyRate': hourlyRate,
      'workLocation': workLocation,
      'bookingFee': bookingFee,
      'totalEarnings': totalEarnings,
      'totalClients': totalClients,
      'dateJoined': dateJoined,
      'workDescription': workDescription,
    }.withoutNulls,
  );

  return firestoreData;
}
