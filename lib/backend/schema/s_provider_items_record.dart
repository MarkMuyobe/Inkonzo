import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 's_provider_items_record.g.dart';

abstract class SProviderItemsRecord
    implements Built<SProviderItemsRecord, SProviderItemsRecordBuilder> {
  static Serializer<SProviderItemsRecord> get serializer =>
      _$sProviderItemsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'Rating')
  int? get rating;

  BuiltList<String>? get skills;

  bool? get availability;

  String? get imageURL;

  DocumentReference? get uid;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SProviderItemsRecordBuilder builder) => builder
    ..name = ''
    ..rating = 0
    ..skills = ListBuilder()
    ..availability = false
    ..imageURL = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SProviderItems');

  static Stream<SProviderItemsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SProviderItemsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SProviderItemsRecord._();
  factory SProviderItemsRecord(
          [void Function(SProviderItemsRecordBuilder) updates]) =
      _$SProviderItemsRecord;

  static SProviderItemsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSProviderItemsRecordData({
  String? name,
  int? rating,
  bool? availability,
  String? imageURL,
  DocumentReference? uid,
}) {
  final firestoreData = serializers.toFirestore(
    SProviderItemsRecord.serializer,
    SProviderItemsRecord(
      (s) => s
        ..name = name
        ..rating = rating
        ..skills = null
        ..availability = availability
        ..imageURL = imageURL
        ..uid = uid,
    ),
  );

  return firestoreData;
}
