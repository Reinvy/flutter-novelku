// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Novel {

 String get id; String get title; String get synopsis; String get status; String? get coverUrl; Author get author; int get chapterCount; int get ratingCount; double? get averageRating; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NovelCopyWith<Novel> get copyWith => _$NovelCopyWithImpl<Novel>(this as Novel, _$identity);

  /// Serializes this Novel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Novel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.chapterCount, chapterCount) || other.chapterCount == chapterCount)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,synopsis,status,coverUrl,author,chapterCount,ratingCount,averageRating,createdAt,updatedAt);

@override
String toString() {
  return 'Novel(id: $id, title: $title, synopsis: $synopsis, status: $status, coverUrl: $coverUrl, author: $author, chapterCount: $chapterCount, ratingCount: $ratingCount, averageRating: $averageRating, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NovelCopyWith<$Res>  {
  factory $NovelCopyWith(Novel value, $Res Function(Novel) _then) = _$NovelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String synopsis, String status, String? coverUrl, Author author, int chapterCount, int ratingCount, double? averageRating, DateTime? createdAt, DateTime? updatedAt
});


$AuthorCopyWith<$Res> get author;

}
/// @nodoc
class _$NovelCopyWithImpl<$Res>
    implements $NovelCopyWith<$Res> {
  _$NovelCopyWithImpl(this._self, this._then);

  final Novel _self;
  final $Res Function(Novel) _then;

/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? synopsis = null,Object? status = null,Object? coverUrl = freezed,Object? author = null,Object? chapterCount = null,Object? ratingCount = null,Object? averageRating = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,chapterCount: null == chapterCount ? _self.chapterCount : chapterCount // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [Novel].
extension NovelPatterns on Novel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Novel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Novel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Novel value)  $default,){
final _that = this;
switch (_that) {
case _Novel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Novel value)?  $default,){
final _that = this;
switch (_that) {
case _Novel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  Author author,  int chapterCount,  int ratingCount,  double? averageRating,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Novel() when $default != null:
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.author,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  Author author,  int chapterCount,  int ratingCount,  double? averageRating,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Novel():
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.author,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  Author author,  int chapterCount,  int ratingCount,  double? averageRating,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Novel() when $default != null:
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.author,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Novel extends Novel {
  const _Novel({required this.id, required this.title, required this.synopsis, required this.status, this.coverUrl, required this.author, required this.chapterCount, required this.ratingCount, this.averageRating, this.createdAt, this.updatedAt}): super._();
  factory _Novel.fromJson(Map<String, dynamic> json) => _$NovelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String synopsis;
@override final  String status;
@override final  String? coverUrl;
@override final  Author author;
@override final  int chapterCount;
@override final  int ratingCount;
@override final  double? averageRating;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NovelCopyWith<_Novel> get copyWith => __$NovelCopyWithImpl<_Novel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NovelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Novel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author)&&(identical(other.chapterCount, chapterCount) || other.chapterCount == chapterCount)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,synopsis,status,coverUrl,author,chapterCount,ratingCount,averageRating,createdAt,updatedAt);

@override
String toString() {
  return 'Novel(id: $id, title: $title, synopsis: $synopsis, status: $status, coverUrl: $coverUrl, author: $author, chapterCount: $chapterCount, ratingCount: $ratingCount, averageRating: $averageRating, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NovelCopyWith<$Res> implements $NovelCopyWith<$Res> {
  factory _$NovelCopyWith(_Novel value, $Res Function(_Novel) _then) = __$NovelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String synopsis, String status, String? coverUrl, Author author, int chapterCount, int ratingCount, double? averageRating, DateTime? createdAt, DateTime? updatedAt
});


@override $AuthorCopyWith<$Res> get author;

}
/// @nodoc
class __$NovelCopyWithImpl<$Res>
    implements _$NovelCopyWith<$Res> {
  __$NovelCopyWithImpl(this._self, this._then);

  final _Novel _self;
  final $Res Function(_Novel) _then;

/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? synopsis = null,Object? status = null,Object? coverUrl = freezed,Object? author = null,Object? chapterCount = null,Object? ratingCount = null,Object? averageRating = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_Novel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as Author,chapterCount: null == chapterCount ? _self.chapterCount : chapterCount // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of Novel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthorCopyWith<$Res> get author {
  
  return $AuthorCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}

// dart format on
