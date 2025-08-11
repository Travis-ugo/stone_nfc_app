// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NFCTokenEntity {

/// Unique identifier for the NFC tag (token)
 String get tagId;/// ID of the video this tag links to
@JsonKey(name: 'video_id') String get videoId;/// When the token expires
@TimestampDateTimeConverter() DateTime? get expiresAt;/// Whether the token is currently active
@JsonKey(name: 'is_active') bool get isActive;/// When the token was created
@TimestampDateTimeConverter() DateTime? get createdAt;/// When the token was last updated
@TimestampDateTimeConverter() DateTime? get updatedAt;
/// Create a copy of NFCTokenEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NFCTokenEntityCopyWith<NFCTokenEntity> get copyWith => _$NFCTokenEntityCopyWithImpl<NFCTokenEntity>(this as NFCTokenEntity, _$identity);

  /// Serializes this NFCTokenEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NFCTokenEntity&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,videoId,expiresAt,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NFCTokenEntity(tagId: $tagId, videoId: $videoId, expiresAt: $expiresAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NFCTokenEntityCopyWith<$Res>  {
  factory $NFCTokenEntityCopyWith(NFCTokenEntity value, $Res Function(NFCTokenEntity) _then) = _$NFCTokenEntityCopyWithImpl;
@useResult
$Res call({
 String tagId,@JsonKey(name: 'video_id') String videoId,@TimestampDateTimeConverter() DateTime? expiresAt,@JsonKey(name: 'is_active') bool isActive,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt
});




}
/// @nodoc
class _$NFCTokenEntityCopyWithImpl<$Res>
    implements $NFCTokenEntityCopyWith<$Res> {
  _$NFCTokenEntityCopyWithImpl(this._self, this._then);

  final NFCTokenEntity _self;
  final $Res Function(NFCTokenEntity) _then;

/// Create a copy of NFCTokenEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagId = null,Object? videoId = null,Object? expiresAt = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NFCTokenEntity].
extension NFCTokenEntityPatterns on NFCTokenEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NFCTokenEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NFCTokenEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NFCTokenEntity value)  $default,){
final _that = this;
switch (_that) {
case _NFCTokenEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NFCTokenEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NFCTokenEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String tagId, @JsonKey(name: 'video_id')  String videoId, @TimestampDateTimeConverter()  DateTime? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NFCTokenEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String tagId, @JsonKey(name: 'video_id')  String videoId, @TimestampDateTimeConverter()  DateTime? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NFCTokenEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String tagId, @JsonKey(name: 'video_id')  String videoId, @TimestampDateTimeConverter()  DateTime? expiresAt, @JsonKey(name: 'is_active')  bool isActive, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NFCTokenEntity() when $default != null:
return $default(_that.tagId,_that.videoId,_that.expiresAt,_that.isActive,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NFCTokenEntity extends NFCTokenEntity {
  const _NFCTokenEntity({required this.tagId, @JsonKey(name: 'video_id') required this.videoId, @TimestampDateTimeConverter() this.expiresAt, @JsonKey(name: 'is_active') this.isActive = true, @TimestampDateTimeConverter() this.createdAt, @TimestampDateTimeConverter() this.updatedAt}): super._();
  factory _NFCTokenEntity.fromJson(Map<String, dynamic> json) => _$NFCTokenEntityFromJson(json);

/// Unique identifier for the NFC tag (token)
@override final  String tagId;
/// ID of the video this tag links to
@override@JsonKey(name: 'video_id') final  String videoId;
/// When the token expires
@override@TimestampDateTimeConverter() final  DateTime? expiresAt;
/// Whether the token is currently active
@override@JsonKey(name: 'is_active') final  bool isActive;
/// When the token was created
@override@TimestampDateTimeConverter() final  DateTime? createdAt;
/// When the token was last updated
@override@TimestampDateTimeConverter() final  DateTime? updatedAt;

/// Create a copy of NFCTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NFCTokenEntityCopyWith<_NFCTokenEntity> get copyWith => __$NFCTokenEntityCopyWithImpl<_NFCTokenEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NFCTokenEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NFCTokenEntity&&(identical(other.tagId, tagId) || other.tagId == tagId)&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagId,videoId,expiresAt,isActive,createdAt,updatedAt);

@override
String toString() {
  return 'NFCTokenEntity(tagId: $tagId, videoId: $videoId, expiresAt: $expiresAt, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NFCTokenEntityCopyWith<$Res> implements $NFCTokenEntityCopyWith<$Res> {
  factory _$NFCTokenEntityCopyWith(_NFCTokenEntity value, $Res Function(_NFCTokenEntity) _then) = __$NFCTokenEntityCopyWithImpl;
@override @useResult
$Res call({
 String tagId,@JsonKey(name: 'video_id') String videoId,@TimestampDateTimeConverter() DateTime? expiresAt,@JsonKey(name: 'is_active') bool isActive,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt
});




}
/// @nodoc
class __$NFCTokenEntityCopyWithImpl<$Res>
    implements _$NFCTokenEntityCopyWith<$Res> {
  __$NFCTokenEntityCopyWithImpl(this._self, this._then);

  final _NFCTokenEntity _self;
  final $Res Function(_NFCTokenEntity) _then;

/// Create a copy of NFCTokenEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagId = null,Object? videoId = null,Object? expiresAt = freezed,Object? isActive = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NFCTokenEntity(
tagId: null == tagId ? _self.tagId : tagId // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
