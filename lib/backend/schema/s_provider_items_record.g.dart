// GENERATED CODE - DO NOT MODIFY BY HAND

part of 's_provider_items_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SProviderItemsRecord> _$sProviderItemsRecordSerializer =
    new _$SProviderItemsRecordSerializer();

class _$SProviderItemsRecordSerializer
    implements StructuredSerializer<SProviderItemsRecord> {
  @override
  final Iterable<Type> types = const [
    SProviderItemsRecord,
    _$SProviderItemsRecord
  ];
  @override
  final String wireName = 'SProviderItemsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SProviderItemsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('Rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.skills;
    if (value != null) {
      result
        ..add('skills')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.availability;
    if (value != null) {
      result
        ..add('availability')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.imageURL;
    if (value != null) {
      result
        ..add('imageURL')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.coverImage;
    if (value != null) {
      result
        ..add('CoverImage')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SProviderItemsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SProviderItemsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'skills':
          result.skills.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'availability':
          result.availability = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'imageURL':
          result.imageURL = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'CoverImage':
          result.coverImage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SProviderItemsRecord extends SProviderItemsRecord {
  @override
  final String? name;
  @override
  final int? rating;
  @override
  final BuiltList<String>? skills;
  @override
  final bool? availability;
  @override
  final String? imageURL;
  @override
  final DocumentReference<Object?>? uid;
  @override
  final String? coverImage;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SProviderItemsRecord(
          [void Function(SProviderItemsRecordBuilder)? updates]) =>
      (new SProviderItemsRecordBuilder()..update(updates))._build();

  _$SProviderItemsRecord._(
      {this.name,
      this.rating,
      this.skills,
      this.availability,
      this.imageURL,
      this.uid,
      this.coverImage,
      this.ffRef})
      : super._();

  @override
  SProviderItemsRecord rebuild(
          void Function(SProviderItemsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SProviderItemsRecordBuilder toBuilder() =>
      new SProviderItemsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SProviderItemsRecord &&
        name == other.name &&
        rating == other.rating &&
        skills == other.skills &&
        availability == other.availability &&
        imageURL == other.imageURL &&
        uid == other.uid &&
        coverImage == other.coverImage &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, name.hashCode), rating.hashCode),
                            skills.hashCode),
                        availability.hashCode),
                    imageURL.hashCode),
                uid.hashCode),
            coverImage.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SProviderItemsRecord')
          ..add('name', name)
          ..add('rating', rating)
          ..add('skills', skills)
          ..add('availability', availability)
          ..add('imageURL', imageURL)
          ..add('uid', uid)
          ..add('coverImage', coverImage)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SProviderItemsRecordBuilder
    implements Builder<SProviderItemsRecord, SProviderItemsRecordBuilder> {
  _$SProviderItemsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  int? _rating;
  int? get rating => _$this._rating;
  set rating(int? rating) => _$this._rating = rating;

  ListBuilder<String>? _skills;
  ListBuilder<String> get skills =>
      _$this._skills ??= new ListBuilder<String>();
  set skills(ListBuilder<String>? skills) => _$this._skills = skills;

  bool? _availability;
  bool? get availability => _$this._availability;
  set availability(bool? availability) => _$this._availability = availability;

  String? _imageURL;
  String? get imageURL => _$this._imageURL;
  set imageURL(String? imageURL) => _$this._imageURL = imageURL;

  DocumentReference<Object?>? _uid;
  DocumentReference<Object?>? get uid => _$this._uid;
  set uid(DocumentReference<Object?>? uid) => _$this._uid = uid;

  String? _coverImage;
  String? get coverImage => _$this._coverImage;
  set coverImage(String? coverImage) => _$this._coverImage = coverImage;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SProviderItemsRecordBuilder() {
    SProviderItemsRecord._initializeBuilder(this);
  }

  SProviderItemsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _rating = $v.rating;
      _skills = $v.skills?.toBuilder();
      _availability = $v.availability;
      _imageURL = $v.imageURL;
      _uid = $v.uid;
      _coverImage = $v.coverImage;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SProviderItemsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SProviderItemsRecord;
  }

  @override
  void update(void Function(SProviderItemsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SProviderItemsRecord build() => _build();

  _$SProviderItemsRecord _build() {
    _$SProviderItemsRecord _$result;
    try {
      _$result = _$v ??
          new _$SProviderItemsRecord._(
              name: name,
              rating: rating,
              skills: _skills?.build(),
              availability: availability,
              imageURL: imageURL,
              uid: uid,
              coverImage: coverImage,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'skills';
        _skills?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'SProviderItemsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
