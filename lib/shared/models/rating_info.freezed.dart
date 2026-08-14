// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingInfo {

 double? get average; int get count; int? get myRating;
/// Create a copy of RatingInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingInfoCopyWith<RatingInfo> get copyWith => _$RatingInfoCopyWithImpl<RatingInfo>(this as RatingInfo, _$identity);

  /// Serializes this RatingInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingInfo&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count)&&(identical(other.myRating, myRating) || other.myRating == myRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,count,myRating);

@override
String toString() {
  return 'RatingInfo(average: $average, count: $count, myRating: $myRating)';
}


}

/// @nodoc
abstract mixin class $RatingInfoCopyWith<$Res>  {
  factory $RatingInfoCopyWith(RatingInfo value, $Res Function(RatingInfo) _then) = _$RatingInfoCopyWithImpl;
@useResult
$Res call({
 double? average, int count, int? myRating
});




}
/// @nodoc
class _$RatingInfoCopyWithImpl<$Res>
    implements $RatingInfoCopyWith<$Res> {
  _$RatingInfoCopyWithImpl(this._self, this._then);

  final RatingInfo _self;
  final $Res Function(RatingInfo) _then;

/// Create a copy of RatingInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = freezed,Object? count = null,Object? myRating = freezed,}) {
  return _then(_self.copyWith(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingInfo].
extension RatingInfoPatterns on RatingInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingInfo value)  $default,){
final _that = this;
switch (_that) {
case _RatingInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingInfo value)?  $default,){
final _that = this;
switch (_that) {
case _RatingInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? average,  int count,  int? myRating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingInfo() when $default != null:
return $default(_that.average,_that.count,_that.myRating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? average,  int count,  int? myRating)  $default,) {final _that = this;
switch (_that) {
case _RatingInfo():
return $default(_that.average,_that.count,_that.myRating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? average,  int count,  int? myRating)?  $default,) {final _that = this;
switch (_that) {
case _RatingInfo() when $default != null:
return $default(_that.average,_that.count,_that.myRating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingInfo implements RatingInfo {
  const _RatingInfo({this.average, required this.count, this.myRating});
  factory _RatingInfo.fromJson(Map<String, dynamic> json) => _$RatingInfoFromJson(json);

@override final  double? average;
@override final  int count;
@override final  int? myRating;

/// Create a copy of RatingInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingInfoCopyWith<_RatingInfo> get copyWith => __$RatingInfoCopyWithImpl<_RatingInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingInfo&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count)&&(identical(other.myRating, myRating) || other.myRating == myRating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,count,myRating);

@override
String toString() {
  return 'RatingInfo(average: $average, count: $count, myRating: $myRating)';
}


}

/// @nodoc
abstract mixin class _$RatingInfoCopyWith<$Res> implements $RatingInfoCopyWith<$Res> {
  factory _$RatingInfoCopyWith(_RatingInfo value, $Res Function(_RatingInfo) _then) = __$RatingInfoCopyWithImpl;
@override @useResult
$Res call({
 double? average, int count, int? myRating
});




}
/// @nodoc
class __$RatingInfoCopyWithImpl<$Res>
    implements _$RatingInfoCopyWith<$Res> {
  __$RatingInfoCopyWithImpl(this._self, this._then);

  final _RatingInfo _self;
  final $Res Function(_RatingInfo) _then;

/// Create a copy of RatingInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = freezed,Object? count = null,Object? myRating = freezed,}) {
  return _then(_RatingInfo(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
