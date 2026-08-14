// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explore_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExploreFilter {

 String get search; String? get status; String get sort;
/// Create a copy of ExploreFilter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExploreFilterCopyWith<ExploreFilter> get copyWith => _$ExploreFilterCopyWithImpl<ExploreFilter>(this as ExploreFilter, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExploreFilter&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,search,status,sort);

@override
String toString() {
  return 'ExploreFilter(search: $search, status: $status, sort: $sort)';
}


}

/// @nodoc
abstract mixin class $ExploreFilterCopyWith<$Res>  {
  factory $ExploreFilterCopyWith(ExploreFilter value, $Res Function(ExploreFilter) _then) = _$ExploreFilterCopyWithImpl;
@useResult
$Res call({
 String search, String? status, String sort
});




}
/// @nodoc
class _$ExploreFilterCopyWithImpl<$Res>
    implements $ExploreFilterCopyWith<$Res> {
  _$ExploreFilterCopyWithImpl(this._self, this._then);

  final ExploreFilter _self;
  final $Res Function(ExploreFilter) _then;

/// Create a copy of ExploreFilter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? search = null,Object? status = freezed,Object? sort = null,}) {
  return _then(_self.copyWith(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ExploreFilter].
extension ExploreFilterPatterns on ExploreFilter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExploreFilter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExploreFilter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExploreFilter value)  $default,){
final _that = this;
switch (_that) {
case _ExploreFilter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExploreFilter value)?  $default,){
final _that = this;
switch (_that) {
case _ExploreFilter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String search,  String? status,  String sort)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExploreFilter() when $default != null:
return $default(_that.search,_that.status,_that.sort);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String search,  String? status,  String sort)  $default,) {final _that = this;
switch (_that) {
case _ExploreFilter():
return $default(_that.search,_that.status,_that.sort);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String search,  String? status,  String sort)?  $default,) {final _that = this;
switch (_that) {
case _ExploreFilter() when $default != null:
return $default(_that.search,_that.status,_that.sort);case _:
  return null;

}
}

}

/// @nodoc


class _ExploreFilter extends ExploreFilter {
  const _ExploreFilter({this.search = '', this.status, this.sort = 'newest'}): super._();
  

@override@JsonKey() final  String search;
@override final  String? status;
@override@JsonKey() final  String sort;

/// Create a copy of ExploreFilter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExploreFilterCopyWith<_ExploreFilter> get copyWith => __$ExploreFilterCopyWithImpl<_ExploreFilter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExploreFilter&&(identical(other.search, search) || other.search == search)&&(identical(other.status, status) || other.status == status)&&(identical(other.sort, sort) || other.sort == sort));
}


@override
int get hashCode => Object.hash(runtimeType,search,status,sort);

@override
String toString() {
  return 'ExploreFilter(search: $search, status: $status, sort: $sort)';
}


}

/// @nodoc
abstract mixin class _$ExploreFilterCopyWith<$Res> implements $ExploreFilterCopyWith<$Res> {
  factory _$ExploreFilterCopyWith(_ExploreFilter value, $Res Function(_ExploreFilter) _then) = __$ExploreFilterCopyWithImpl;
@override @useResult
$Res call({
 String search, String? status, String sort
});




}
/// @nodoc
class __$ExploreFilterCopyWithImpl<$Res>
    implements _$ExploreFilterCopyWith<$Res> {
  __$ExploreFilterCopyWithImpl(this._self, this._then);

  final _ExploreFilter _self;
  final $Res Function(_ExploreFilter) _then;

/// Create a copy of ExploreFilter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? search = null,Object? status = freezed,Object? sort = null,}) {
  return _then(_ExploreFilter(
search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,sort: null == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
