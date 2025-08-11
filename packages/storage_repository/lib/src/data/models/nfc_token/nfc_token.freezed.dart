// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NFCTokenModel {

/// Unique identifier for the NFC tag
@JsonKey(name: 'tag_id') String get tagId;/// ID of the video this tag links to
@JsonKey(name: 'video_id') String get videoId;/// When the token expires
@JsonKey(name: 'expires_at')@TimestampConverter() Timestamp? get expiresAt;/// Whether the token is currently active
@JsonKey(name: 'is_active') bool get isActive;/// When the token was created
@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? get createdAt;/// When the token was last updated
@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? get updatedAt;
/// Create a copy of NFCTokenModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFCTokenModelCopyWith<NFCTokenModel> get copyWith => _$NFCTokenModelCopyWithImpl<NFCTokenModel>(this as NFCTokenModel, _$identity);

  /// Serializes this NFCTokenModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCTokenModel&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,videoId,expiresAt,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NFCTokenModel(tagId: $tagId, videoId: $videoId, expiresAt: $expiresAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NFCTokenModelCopyWith<$Res>  {
  factory $NFCTokenModelCopyWith(NFCTokenModel value, $Res Function(NFCTokenModel) _then) = _$NFCTokenModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tag_id') String tagId,@JsonKey(name: 'video_id') String videoId,@JsonKey(name: 'expires_at')@TimestampConverter() Timestamp? expiresAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? updatedAt
});




}
/// @nodoc
class _$NFCTokenModelCopyWithImpl<$Res>
    implements $NFCTokenModelCopyWith<$Res> {
  _$NFCTokenModelCopyWithImpl(this._self, this._then);

  final NFCTokenModel _self;
  final $Res Function(NFCTokenModel) _then;

/// Create a copy of NFCTokenModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? videoId = null,Object? expiresAt = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

}


/// Adds pattern-matching-related methods to [NFCTokenModel].
extension NFCTokenModelPatterns on NFCTokenModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFCTokenModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFCTokenModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFCTokenModel value)  $default,){
final _that = this;
switch (_that) {
case _NFCTokenModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFCTokenModel value)?  $default,){
final _that = this;
switch (_that) {
case _NFCTokenModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')  String tagId, @JsonKey(name: 'video_id')  String videoId, @JsonKey(name: 'expires_at')@TimestampConverter()  Timestamp? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFCTokenModel() when $default != null:
return $default(_that.tagId,_that.videoId,_that.expiresAt,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tag_id')  String tagId, @JsonKey(name: 'video_id')  String videoId, @JsonKey(name: 'expires_at')@TimestampConverter()  Timestamp? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NFCTokenModel():
return $default(_that.tagId,_that.videoId,_that.expiresAt,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tag_id')  String tagId, @JsonKey(name: 'video_id')  String videoId, @JsonKey(name: 'expires_at')@TimestampConverter()  Timestamp? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NFCTokenModel() when $default != null:
return $default(_that.tagId,_that.videoId,_that.expiresAt,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NFCTokenModel implements NFCTokenModel {
  const _NFCTokenModel({@JsonKey(name: 'tag_id') required this.tagId, @JsonKey(name: 'video_id') required this.videoId, @JsonKey(name: 'expires_at')@TimestampConverter() this.expiresAt, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'created_at')@TimestampConverter() this.createdAt, @JsonKey(name: 'updated_at')@TimestampConverter() this.updatedAt});
  factory _NFCTokenModel.fromJson(Map<String, dynamic> json) => _$NFCTokenModelFromJson(json);

/// Unique identifier for the NFC tag
@override@JsonKey(name: 'tag_id') final  String tagId;
/// ID of the video this tag links to
@override@JsonKey(name: 'video_id') final  String videoId;
/// When the token expires
@override@JsonKey(name: 'expires_at')@TimestampConverter() final  Timestamp? expiresAt;
/// Whether the token is currently active
@override@JsonKey(name: 'is_active') final  bool isActive;
/// When the token was created
@override@JsonKey(name: 'created_at')@TimestampConverter() final  Timestamp? createdAt;
/// When the token was last updated
@override@JsonKey(name: 'updated_at')@TimestampConverter() final  Timestamp? updatedAt;

/// Create a copy of NFCTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFCTokenModelCopyWith<_NFCTokenModel> get copyWith => __$NFCTokenModelCopyWithImpl<_NFCTokenModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NFCTokenModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFCTokenModel&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,videoId,expiresAt,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NFCTokenModel(tagId: $tagId, videoId: $videoId, expiresAt: $expiresAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NFCTokenModelCopyWith<$Res> implements $NFCTokenModelCopyWith<$Res> {
  factory _$NFCTokenModelCopyWith(_NFCTokenModel value, $Res Function(_NFCTokenModel) _then) = __$NFCTokenModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tag_id') String tagId,@JsonKey(name: 'video_id') String videoId,@JsonKey(name: 'expires_at')@TimestampConverter() Timestamp? expiresAt,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? updatedAt
});




}
/// @nodoc
class __$NFCTokenModelCopyWithImpl<$Res>
    implements _$NFCTokenModelCopyWith<$Res> {
  __$NFCTokenModelCopyWithImpl(this._self, this._then);

  final _NFCTokenModel _self;
  final $Res Function(_NFCTokenModel) _then;

/// Create a copy of NFCTokenModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? videoId = null,Object? expiresAt = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NFCTokenModel(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}


}

// dart format on
