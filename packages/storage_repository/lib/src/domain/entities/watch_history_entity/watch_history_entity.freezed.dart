// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_history_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchHistoryEntity {

/// Unique identifier for the watch history record
 String? get id;/// ID of the user who watched the video
@JsonKey(name: 'user_id') String get userId;/// When the video was viewed (stored as Timestamp in Firestore)
@JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter() DateTime get viewedAt;/// Duration watched in seconds
@JsonKey(name: 'watch_duration') int? get watchDuration;/// Whether the video was completed
 bool get completed; VideoEntity get video;
/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchHistoryEntityCopyWith<WatchHistoryEntity> get copyWith => _$WatchHistoryEntityCopyWithImpl<WatchHistoryEntity>(this as WatchHistoryEntity, _$identity);

  /// Serializes this WatchHistoryEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchHistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt)&&(identical(other.watchDuration, watchDuration) || other.watchDuration == watchDuration)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,viewedAt,watchDuration,completed,video);

@override
String toString() {
  return 'WatchHistoryEntity(id: $id, userId: $userId, viewedAt: $viewedAt, watchDuration: $watchDuration, completed: $completed, video: $video)';
}


}

/// @nodoc
abstract mixin class $WatchHistoryEntityCopyWith<$Res>  {
  factory $WatchHistoryEntityCopyWith(WatchHistoryEntity value, $Res Function(WatchHistoryEntity) _then) = _$WatchHistoryEntityCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter() DateTime viewedAt,@JsonKey(name: 'watch_duration') int? watchDuration, bool completed, VideoEntity video
});


$VideoEntityCopyWith<$Res> get video;

}
/// @nodoc
class _$WatchHistoryEntityCopyWithImpl<$Res>
    implements $WatchHistoryEntityCopyWith<$Res> {
  _$WatchHistoryEntityCopyWithImpl(this._self, this._then);

  final WatchHistoryEntity _self;
  final $Res Function(WatchHistoryEntity) _then;

/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? viewedAt = null,Object? watchDuration = freezed,Object? completed = null,Object? video = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as DateTime,watchDuration: freezed == watchDuration ? _self.watchDuration : watchDuration // ignore: cast_nullable_to_non_nullable
as int?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as VideoEntity,
  ));
}
/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoEntityCopyWith<$Res> get video {
  
  return $VideoEntityCopyWith<$Res>(_self.video, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchHistoryEntity].
extension WatchHistoryEntityPatterns on WatchHistoryEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchHistoryEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchHistoryEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchHistoryEntity value)  $default,){
final _that = this;
switch (_that) {
case _WatchHistoryEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchHistoryEntity value)?  $default,){
final _that = this;
switch (_that) {
case _WatchHistoryEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter()  DateTime viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed,  VideoEntity video)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchHistoryEntity() when $default != null:
return $default(_that.id,_that.userId,_that.viewedAt,_that.watchDuration,_that.completed,_that.video);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter()  DateTime viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed,  VideoEntity video)  $default,) {final _that = this;
switch (_that) {
case _WatchHistoryEntity():
return $default(_that.id,_that.userId,_that.viewedAt,_that.watchDuration,_that.completed,_that.video);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter()  DateTime viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed,  VideoEntity video)?  $default,) {final _that = this;
switch (_that) {
case _WatchHistoryEntity() when $default != null:
return $default(_that.id,_that.userId,_that.viewedAt,_that.watchDuration,_that.completed,_that.video);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WatchHistoryEntity implements WatchHistoryEntity {
  const _WatchHistoryEntity({this.id, @JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter() required this.viewedAt, @JsonKey(name: 'watch_duration') this.watchDuration, this.completed = false, required this.video});
  factory _WatchHistoryEntity.fromJson(Map<String, dynamic> json) => _$WatchHistoryEntityFromJson(json);

/// Unique identifier for the watch history record
@override final  String? id;
/// ID of the user who watched the video
@override@JsonKey(name: 'user_id') final  String userId;
/// When the video was viewed (stored as Timestamp in Firestore)
@override@JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter() final  DateTime viewedAt;
/// Duration watched in seconds
@override@JsonKey(name: 'watch_duration') final  int? watchDuration;
/// Whether the video was completed
@override@JsonKey() final  bool completed;
@override final  VideoEntity video;

/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchHistoryEntityCopyWith<_WatchHistoryEntity> get copyWith => __$WatchHistoryEntityCopyWithImpl<_WatchHistoryEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchHistoryEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchHistoryEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt)&&(identical(other.watchDuration, watchDuration) || other.watchDuration == watchDuration)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.video, video) || other.video == video));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,viewedAt,watchDuration,completed,video);

@override
String toString() {
  return 'WatchHistoryEntity(id: $id, userId: $userId, viewedAt: $viewedAt, watchDuration: $watchDuration, completed: $completed, video: $video)';
}


}

/// @nodoc
abstract mixin class _$WatchHistoryEntityCopyWith<$Res> implements $WatchHistoryEntityCopyWith<$Res> {
  factory _$WatchHistoryEntityCopyWith(_WatchHistoryEntity value, $Res Function(_WatchHistoryEntity) _then) = __$WatchHistoryEntityCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)@TimestampConverter() DateTime viewedAt,@JsonKey(name: 'watch_duration') int? watchDuration, bool completed, VideoEntity video
});


@override $VideoEntityCopyWith<$Res> get video;

}
/// @nodoc
class __$WatchHistoryEntityCopyWithImpl<$Res>
    implements _$WatchHistoryEntityCopyWith<$Res> {
  __$WatchHistoryEntityCopyWithImpl(this._self, this._then);

  final _WatchHistoryEntity _self;
  final $Res Function(_WatchHistoryEntity) _then;

/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? viewedAt = null,Object? watchDuration = freezed,Object? completed = null,Object? video = null,}) {
  return _then(_WatchHistoryEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,viewedAt: null == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as DateTime,watchDuration: freezed == watchDuration ? _self.watchDuration : watchDuration // ignore: cast_nullable_to_non_nullable
as int?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as VideoEntity,
  ));
}

/// Create a copy of WatchHistoryEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoEntityCopyWith<$Res> get video {
  
  return $VideoEntityCopyWith<$Res>(_self.video, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}

// dart format on
