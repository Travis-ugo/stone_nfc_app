// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'watch_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WatchHistoryModel {

/// Unique identifier for the watch history record
 String? get id;/// ID of the user who watched the video
@JsonKey(name: 'user_id') String get userId; VideoModel get video;/// When the video was viewed
@JsonKey(name: 'viewed_at')@TimestampConverter() Timestamp? get viewedAt;/// Duration watched in seconds
@JsonKey(name: 'watch_duration') int? get watchDuration;/// Whether the video was completed
 bool get completed;
/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WatchHistoryModelCopyWith<WatchHistoryModel> get copyWith => _$WatchHistoryModelCopyWithImpl<WatchHistoryModel>(this as WatchHistoryModel, _$identity);

  /// Serializes this WatchHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WatchHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.video, video) || other.video == video)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt)&&(identical(other.watchDuration, watchDuration) || other.watchDuration == watchDuration)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,video,viewedAt,watchDuration,completed);

@override
String toString() {
  return 'WatchHistoryModel(id: $id, userId: $userId, video: $video, viewedAt: $viewedAt, watchDuration: $watchDuration, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $WatchHistoryModelCopyWith<$Res>  {
  factory $WatchHistoryModelCopyWith(WatchHistoryModel value, $Res Function(WatchHistoryModel) _then) = _$WatchHistoryModelCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId, VideoModel video,@JsonKey(name: 'viewed_at')@TimestampConverter() Timestamp? viewedAt,@JsonKey(name: 'watch_duration') int? watchDuration, bool completed
});


$VideoModelCopyWith<$Res> get video;

}
/// @nodoc
class _$WatchHistoryModelCopyWithImpl<$Res>
    implements $WatchHistoryModelCopyWith<$Res> {
  _$WatchHistoryModelCopyWithImpl(this._self, this._then);

  final WatchHistoryModel _self;
  final $Res Function(WatchHistoryModel) _then;

/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = null,Object? video = null,Object? viewedAt = freezed,Object? watchDuration = freezed,Object? completed = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as VideoModel,viewedAt: freezed == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,watchDuration: freezed == watchDuration ? _self.watchDuration : watchDuration // ignore: cast_nullable_to_non_nullable
as int?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoModelCopyWith<$Res> get video {
  
  return $VideoModelCopyWith<$Res>(_self.video, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}


/// Adds pattern-matching-related methods to [WatchHistoryModel].
extension WatchHistoryModelPatterns on WatchHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WatchHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WatchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WatchHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _WatchHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WatchHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _WatchHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId,  VideoModel video, @JsonKey(name: 'viewed_at')@TimestampConverter()  Timestamp? viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WatchHistoryModel() when $default != null:
return $default(_that.id,_that.userId,_that.video,_that.viewedAt,_that.watchDuration,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'user_id')  String userId,  VideoModel video, @JsonKey(name: 'viewed_at')@TimestampConverter()  Timestamp? viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _WatchHistoryModel():
return $default(_that.id,_that.userId,_that.video,_that.viewedAt,_that.watchDuration,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'user_id')  String userId,  VideoModel video, @JsonKey(name: 'viewed_at')@TimestampConverter()  Timestamp? viewedAt, @JsonKey(name: 'watch_duration')  int? watchDuration,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _WatchHistoryModel() when $default != null:
return $default(_that.id,_that.userId,_that.video,_that.viewedAt,_that.watchDuration,_that.completed);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _WatchHistoryModel implements WatchHistoryModel {
  const _WatchHistoryModel({this.id, @JsonKey(name: 'user_id') required this.userId, required this.video, @JsonKey(name: 'viewed_at')@TimestampConverter() this.viewedAt, @JsonKey(name: 'watch_duration') this.watchDuration, this.completed = false});
  factory _WatchHistoryModel.fromJson(Map<String, dynamic> json) => _$WatchHistoryModelFromJson(json);

/// Unique identifier for the watch history record
@override final  String? id;
/// ID of the user who watched the video
@override@JsonKey(name: 'user_id') final  String userId;
@override final  VideoModel video;
/// When the video was viewed
@override@JsonKey(name: 'viewed_at')@TimestampConverter() final  Timestamp? viewedAt;
/// Duration watched in seconds
@override@JsonKey(name: 'watch_duration') final  int? watchDuration;
/// Whether the video was completed
@override@JsonKey() final  bool completed;

/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WatchHistoryModelCopyWith<_WatchHistoryModel> get copyWith => __$WatchHistoryModelCopyWithImpl<_WatchHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WatchHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WatchHistoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.video, video) || other.video == video)&&(identical(other.viewedAt, viewedAt) || other.viewedAt == viewedAt)&&(identical(other.watchDuration, watchDuration) || other.watchDuration == watchDuration)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,video,viewedAt,watchDuration,completed);

@override
String toString() {
  return 'WatchHistoryModel(id: $id, userId: $userId, video: $video, viewedAt: $viewedAt, watchDuration: $watchDuration, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$WatchHistoryModelCopyWith<$Res> implements $WatchHistoryModelCopyWith<$Res> {
  factory _$WatchHistoryModelCopyWith(_WatchHistoryModel value, $Res Function(_WatchHistoryModel) _then) = __$WatchHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'user_id') String userId, VideoModel video,@JsonKey(name: 'viewed_at')@TimestampConverter() Timestamp? viewedAt,@JsonKey(name: 'watch_duration') int? watchDuration, bool completed
});


@override $VideoModelCopyWith<$Res> get video;

}
/// @nodoc
class __$WatchHistoryModelCopyWithImpl<$Res>
    implements _$WatchHistoryModelCopyWith<$Res> {
  __$WatchHistoryModelCopyWithImpl(this._self, this._then);

  final _WatchHistoryModel _self;
  final $Res Function(_WatchHistoryModel) _then;

/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = null,Object? video = null,Object? viewedAt = freezed,Object? watchDuration = freezed,Object? completed = null,}) {
  return _then(_WatchHistoryModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,video: null == video ? _self.video : video // ignore: cast_nullable_to_non_nullable
as VideoModel,viewedAt: freezed == viewedAt ? _self.viewedAt : viewedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,watchDuration: freezed == watchDuration ? _self.watchDuration : watchDuration // ignore: cast_nullable_to_non_nullable
as int?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WatchHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VideoModelCopyWith<$Res> get video {
  
  return $VideoModelCopyWith<$Res>(_self.video, (value) {
    return _then(_self.copyWith(video: value));
  });
}
}

// dart format on
