// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileEntity {

/// Unique identifier for the user
 String get userId;/// Display name of the user
 String? get displayName;/// Email address of the user
 String? get email;/// Profile photo URL
 String? get photoUrl;/// Phone number of the user
 String? get phoneNumber;/// Date of birth
@TimestampDateTimeConverter() DateTime? get dateOfBirth;/// Gender of the user
 String? get gender;/// When the profile was created
@TimestampDateTimeConverter() DateTime? get createdAt;/// When the profile was last updated
@TimestampDateTimeConverter() DateTime? get updatedAt;/// When the user last logged in
@TimestampDateTimeConverter() DateTime? get lastLoginAt;
/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileEntityCopyWith<UserProfileEntity> get copyWith => _$UserProfileEntityCopyWithImpl<UserProfileEntity>(this as UserProfileEntity, _$identity);

  /// Serializes this UserProfileEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,email,photoUrl,phoneNumber,dateOfBirth,gender,createdAt,updatedAt,lastLoginAt);

@override
String toString() {
  return 'UserProfileEntity(userId: $userId, displayName: $displayName, email: $email, photoUrl: $photoUrl, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileEntityCopyWith<$Res>  {
  factory $UserProfileEntityCopyWith(UserProfileEntity value, $Res Function(UserProfileEntity) _then) = _$UserProfileEntityCopyWithImpl;
@useResult
$Res call({
 String userId, String? displayName, String? email, String? photoUrl, String? phoneNumber,@TimestampDateTimeConverter() DateTime? dateOfBirth, String? gender,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt,@TimestampDateTimeConverter() DateTime? lastLoginAt
});




}
/// @nodoc
class _$UserProfileEntityCopyWithImpl<$Res>
    implements $UserProfileEntityCopyWith<$Res> {
  _$UserProfileEntityCopyWithImpl(this._self, this._then);

  final UserProfileEntity _self;
  final $Res Function(UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileEntity].
extension UserProfileEntityPatterns on UserProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String? displayName,  String? email,  String? photoUrl,  String? phoneNumber, @TimestampDateTimeConverter()  DateTime? dateOfBirth,  String? gender, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt, @TimestampDateTimeConverter()  DateTime? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String? displayName,  String? email,  String? photoUrl,  String? phoneNumber, @TimestampDateTimeConverter()  DateTime? dateOfBirth,  String? gender, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt, @TimestampDateTimeConverter()  DateTime? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity():
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String? displayName,  String? email,  String? photoUrl,  String? phoneNumber, @TimestampDateTimeConverter()  DateTime? dateOfBirth,  String? gender, @TimestampDateTimeConverter()  DateTime? createdAt, @TimestampDateTimeConverter()  DateTime? updatedAt, @TimestampDateTimeConverter()  DateTime? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileEntity() when $default != null:
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileEntity implements UserProfileEntity {
  const _UserProfileEntity({required this.userId, this.displayName, this.email, this.photoUrl, this.phoneNumber, @TimestampDateTimeConverter() this.dateOfBirth, this.gender, @TimestampDateTimeConverter() this.createdAt, @TimestampDateTimeConverter() this.updatedAt, @TimestampDateTimeConverter() this.lastLoginAt});
  factory _UserProfileEntity.fromJson(Map<String, dynamic> json) => _$UserProfileEntityFromJson(json);

/// Unique identifier for the user
@override final  String userId;
/// Display name of the user
@override final  String? displayName;
/// Email address of the user
@override final  String? email;
/// Profile photo URL
@override final  String? photoUrl;
/// Phone number of the user
@override final  String? phoneNumber;
/// Date of birth
@override@TimestampDateTimeConverter() final  DateTime? dateOfBirth;
/// Gender of the user
@override final  String? gender;
/// When the profile was created
@override@TimestampDateTimeConverter() final  DateTime? createdAt;
/// When the profile was last updated
@override@TimestampDateTimeConverter() final  DateTime? updatedAt;
/// When the user last logged in
@override@TimestampDateTimeConverter() final  DateTime? lastLoginAt;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileEntityCopyWith<_UserProfileEntity> get copyWith => __$UserProfileEntityCopyWithImpl<_UserProfileEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileEntity&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,email,photoUrl,phoneNumber,dateOfBirth,gender,createdAt,updatedAt,lastLoginAt);

@override
String toString() {
  return 'UserProfileEntity(userId: $userId, displayName: $displayName, email: $email, photoUrl: $photoUrl, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, createdAt: $createdAt, updatedAt: $updatedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileEntityCopyWith<$Res> implements $UserProfileEntityCopyWith<$Res> {
  factory _$UserProfileEntityCopyWith(_UserProfileEntity value, $Res Function(_UserProfileEntity) _then) = __$UserProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String userId, String? displayName, String? email, String? photoUrl, String? phoneNumber,@TimestampDateTimeConverter() DateTime? dateOfBirth, String? gender,@TimestampDateTimeConverter() DateTime? createdAt,@TimestampDateTimeConverter() DateTime? updatedAt,@TimestampDateTimeConverter() DateTime? lastLoginAt
});




}
/// @nodoc
class __$UserProfileEntityCopyWithImpl<$Res>
    implements _$UserProfileEntityCopyWith<$Res> {
  __$UserProfileEntityCopyWithImpl(this._self, this._then);

  final _UserProfileEntity _self;
  final $Res Function(_UserProfileEntity) _then;

/// Create a copy of UserProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_UserProfileEntity(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as DateTime?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
