// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {

@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'display_name') String? get displayName; String? get email;@JsonKey(name: 'photo_url') String? get photoUrl;@JsonKey(name: 'phone_number') String? get phoneNumber;@JsonKey(name: 'date_of_birth')@TimestampConverter() Timestamp? get dateOfBirth; String? get gender; Map<String, dynamic>? get preferences;@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? get createdAt;@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? get updatedAt;@JsonKey(name: 'last_login_at')@TimestampConverter() Timestamp? get lastLoginAt;
/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileModelCopyWith<UserProfileModel> get copyWith => _$UserProfileModelCopyWithImpl<UserProfileModel>(this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.preferences, preferences)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,email,photoUrl,phoneNumber,dateOfBirth,gender,const DeepCollectionEquality().hash(preferences),createdAt,updatedAt,lastLoginAt);

@override
String toString() {
  return 'UserProfileModel(userId: $userId, displayName: $displayName, email: $email, photoUrl: $photoUrl, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, preferences: $preferences, createdAt: $createdAt, updatedAt: $updatedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res>  {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) _then) = _$UserProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'display_name') String? displayName, String? email,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'date_of_birth')@TimestampConverter() Timestamp? dateOfBirth, String? gender, Map<String, dynamic>? preferences,@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? updatedAt,@JsonKey(name: 'last_login_at')@TimestampConverter() Timestamp? lastLoginAt
});




}
/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? preferences = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as Timestamp?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,preferences: freezed == preferences ? _self.preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfileModel].
extension UserProfileModelPatterns on UserProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'display_name')  String? displayName,  String? email, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'date_of_birth')@TimestampConverter()  Timestamp? dateOfBirth,  String? gender,  Map<String, dynamic>? preferences, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt, @JsonKey(name: 'last_login_at')@TimestampConverter()  Timestamp? lastLoginAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.preferences,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'display_name')  String? displayName,  String? email, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'date_of_birth')@TimestampConverter()  Timestamp? dateOfBirth,  String? gender,  Map<String, dynamic>? preferences, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt, @JsonKey(name: 'last_login_at')@TimestampConverter()  Timestamp? lastLoginAt)  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel():
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.preferences,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'display_name')  String? displayName,  String? email, @JsonKey(name: 'photo_url')  String? photoUrl, @JsonKey(name: 'phone_number')  String? phoneNumber, @JsonKey(name: 'date_of_birth')@TimestampConverter()  Timestamp? dateOfBirth,  String? gender,  Map<String, dynamic>? preferences, @JsonKey(name: 'created_at')@TimestampConverter()  Timestamp? createdAt, @JsonKey(name: 'updated_at')@TimestampConverter()  Timestamp? updatedAt, @JsonKey(name: 'last_login_at')@TimestampConverter()  Timestamp? lastLoginAt)?  $default,) {final _that = this;
switch (_that) {
case _UserProfileModel() when $default != null:
return $default(_that.userId,_that.displayName,_that.email,_that.photoUrl,_that.phoneNumber,_that.dateOfBirth,_that.gender,_that.preferences,_that.createdAt,_that.updatedAt,_that.lastLoginAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfileModel implements UserProfileModel {
  const _UserProfileModel({@JsonKey(name: 'user_id') required this.userId, @JsonKey(name: 'display_name') this.displayName, this.email, @JsonKey(name: 'photo_url') this.photoUrl, @JsonKey(name: 'phone_number') this.phoneNumber, @JsonKey(name: 'date_of_birth')@TimestampConverter() this.dateOfBirth, this.gender, final  Map<String, dynamic>? preferences, @JsonKey(name: 'created_at')@TimestampConverter() this.createdAt, @JsonKey(name: 'updated_at')@TimestampConverter() this.updatedAt, @JsonKey(name: 'last_login_at')@TimestampConverter() this.lastLoginAt}): _preferences = preferences;
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) => _$UserProfileModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  String? email;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override@JsonKey(name: 'phone_number') final  String? phoneNumber;
@override@JsonKey(name: 'date_of_birth')@TimestampConverter() final  Timestamp? dateOfBirth;
@override final  String? gender;
 final  Map<String, dynamic>? _preferences;
@override Map<String, dynamic>? get preferences {
  final value = _preferences;
  if (value == null) return null;
  if (_preferences is EqualUnmodifiableMapView) return _preferences;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at')@TimestampConverter() final  Timestamp? createdAt;
@override@JsonKey(name: 'updated_at')@TimestampConverter() final  Timestamp? updatedAt;
@override@JsonKey(name: 'last_login_at')@TimestampConverter() final  Timestamp? lastLoginAt;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileModelCopyWith<_UserProfileModel> get copyWith => __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfileModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other._preferences, _preferences)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastLoginAt, lastLoginAt) || other.lastLoginAt == lastLoginAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,displayName,email,photoUrl,phoneNumber,dateOfBirth,gender,const DeepCollectionEquality().hash(_preferences),createdAt,updatedAt,lastLoginAt);

@override
String toString() {
  return 'UserProfileModel(userId: $userId, displayName: $displayName, email: $email, photoUrl: $photoUrl, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, gender: $gender, preferences: $preferences, createdAt: $createdAt, updatedAt: $updatedAt, lastLoginAt: $lastLoginAt)';
}


}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(_UserProfileModel value, $Res Function(_UserProfileModel) _then) = __$UserProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'display_name') String? displayName, String? email,@JsonKey(name: 'photo_url') String? photoUrl,@JsonKey(name: 'phone_number') String? phoneNumber,@JsonKey(name: 'date_of_birth')@TimestampConverter() Timestamp? dateOfBirth, String? gender, Map<String, dynamic>? preferences,@JsonKey(name: 'created_at')@TimestampConverter() Timestamp? createdAt,@JsonKey(name: 'updated_at')@TimestampConverter() Timestamp? updatedAt,@JsonKey(name: 'last_login_at')@TimestampConverter() Timestamp? lastLoginAt
});




}
/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

/// Create a copy of UserProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? displayName = freezed,Object? email = freezed,Object? photoUrl = freezed,Object? phoneNumber = freezed,Object? dateOfBirth = freezed,Object? gender = freezed,Object? preferences = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? lastLoginAt = freezed,}) {
  return _then(_UserProfileModel(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as Timestamp?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,preferences: freezed == preferences ? _self._preferences : preferences // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,lastLoginAt: freezed == lastLoginAt ? _self.lastLoginAt : lastLoginAt // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}


}

// dart format on
