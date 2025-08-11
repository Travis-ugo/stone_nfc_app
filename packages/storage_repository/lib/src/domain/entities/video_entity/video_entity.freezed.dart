// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoEntity {

/// Unique identifier for the video.
 String get videoId;/// Title of the video.
 String get title;/// URL of the video (Firebase Storage link).
 String get url;/// Branding information for the video.
 String? get branding;/// Description of the video.
 String? get description;/// Thumbnail URL for the video.
@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl;/// Duration of the video in seconds.
 int? get duration;/// When the video was created.
@TimestampDateTimeConverter() DateTime? get createdAt;/// When the video was last updated.
@TimestampDateTimeConverter() DateTime? get updatedAt;
/// Create a copy of VideoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoEntityCopyWith<VideoEntity> get copyWith => _$VideoEntityCopyWithImpl<VideoEntity>(this as VideoEntity, _$identity);

  /// Serializes this VideoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoEntity&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,title,url,branding,description,thumbnailUrl,duration,createdAt,updatedAt);

@override
String toString() {
  return 'VideoEntity(videoId: $videoId, title: $title, url: $url, branding: $branding, description: $description, thumbnailUrl: $thumbnailUrl, duration: $duration, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $VideoEntityCopyWith<$Res>  {
  factory $VideoEntityCopyWith(VideoEntity value, $Res Function(VideoEntity) _then) = _$VideoEntityCopyWithImpl;
@useResult
$Res call({
 String videoId, String title, String url, String? branding, String? description,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, int? duration,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt
});




}
/// @nodoc
class _$VideoEntityCopyWithImpl<$Res>
    implements $VideoEntityCopyWith<$Res> {
  _$VideoEntityCopyWithImpl(this._self, this._then);

  final VideoEntity _self;
  final $Res Function(VideoEntity) _then;

/// Create a copy of VideoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = null,Object? title = null,Object? url = null,Object? branding = freezed,Object? description = freezed,Object? thumbnailUrl = freezed,Object? duration = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoEntity].
extension VideoEntityPatterns on VideoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoEntity value)  $default,){
final _that = this;
switch (_that) {
case _VideoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _VideoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String videoId,  String title,  String url,  String? branding,  String? description, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int? duration, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoEntity() when $default != null:
return $default(_that.videoId,_that.title,_that.url,_that.branding,_that.description,_that.thumbnailUrl,_that.duration,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String videoId,  String title,  String url,  String? branding,  String? description, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int? duration, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _VideoEntity():
return $default(_that.videoId,_that.title,_that.url,_that.branding,_that.description,_that.thumbnailUrl,_that.duration,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String videoId,  String title,  String url,  String? branding,  String? description, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  int? duration, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _VideoEntity() when $default != null:
return $default(_that.videoId,_that.title,_that.url,_that.branding,_that.description,_that.thumbnailUrl,_that.duration,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VideoEntity implements VideoEntity {
  const _VideoEntity({required this.videoId, required this.title, required this.url, this.branding, this.description, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, this.duration, @TimestampDateTimeConverter() this.createdAt, @TimestampDateTimeConverter() this.updatedAt});
  factory _VideoEntity.fromJson(Map<String, dynamic> json) => _$VideoEntityFromJson(json);

/// Unique identifier for the video.
@override final  String videoId;
/// Title of the video.
@override final  String title;
/// URL of the video (Firebase Storage link).
@override final  String url;
/// Branding information for the video.
@override final  String? branding;
/// Description of the video.
@override final  String? description;
/// Thumbnail URL for the video.
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
/// Duration of the video in seconds.
@override final  int? duration;
/// When the video was created.
@override@TimestampDateTimeConverter() final  DateTime? createdAt;
/// When the video was last updated.
@override@TimestampDateTimeConverter() final  DateTime? updatedAt;

/// Create a copy of VideoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoEntityCopyWith<_VideoEntity> get copyWith => __$VideoEntityCopyWithImpl<_VideoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VideoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoEntity&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.url, url) || other.url == url)&&(identical(other.branding, branding) || other.branding == branding)&&(identical(other.description, description) || other.description == description)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,title,url,branding,description,thumbnailUrl,duration,createdAt,updatedAt);

@override
String toString() {
  return 'VideoEntity(videoId: $videoId, title: $title, url: $url, branding: $branding, description: $description, thumbnailUrl: $thumbnailUrl, duration: $duration, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$VideoEntityCopyWith<$Res> implements $VideoEntityCopyWith<$Res> {
  factory _$VideoEntityCopyWith(_VideoEntity value, $Res Function(_VideoEntity) _then) = __$VideoEntityCopyWithImpl;
@override @useResult
$Res call({
 String videoId, String title, String url, String? branding, String? description,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, int? duration,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt
});




}
/// @nodoc
class __$VideoEntityCopyWithImpl<$Res>
    implements _$VideoEntityCopyWith<$Res> {
  __$VideoEntityCopyWithImpl(this._self, this._then);

  final _VideoEntity _self;
  final $Res Function(_VideoEntity) _then;

/// Create a copy of VideoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = null,Object? title = null,Object? url = null,Object? branding = freezed,Object? description = freezed,Object? thumbnailUrl = freezed,Object? duration = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_VideoEntity(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,branding: freezed == branding ? _self.branding : branding // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
