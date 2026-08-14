// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'novel_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChapterSummary {

 String get id; String get title; int get order; DateTime? get createdAt;
/// Create a copy of ChapterSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterSummaryCopyWith<ChapterSummary> get copyWith => _$ChapterSummaryCopyWithImpl<ChapterSummary>(this as ChapterSummary, _$identity);

  /// Serializes this ChapterSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order,createdAt);

@override
String toString() {
  return 'ChapterSummary(id: $id, title: $title, order: $order, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChapterSummaryCopyWith<$Res>  {
  factory $ChapterSummaryCopyWith(ChapterSummary value, $Res Function(ChapterSummary) _then) = _$ChapterSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title, int order, DateTime? createdAt
});




}
/// @nodoc
class _$ChapterSummaryCopyWithImpl<$Res>
    implements $ChapterSummaryCopyWith<$Res> {
  _$ChapterSummaryCopyWithImpl(this._self, this._then);

  final ChapterSummary _self;
  final $Res Function(ChapterSummary) _then;

/// Create a copy of ChapterSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? order = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterSummary].
extension ChapterSummaryPatterns on ChapterSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterSummary value)  $default,){
final _that = this;
switch (_that) {
case _ChapterSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int order,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterSummary() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int order,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChapterSummary():
return $default(_that.id,_that.title,_that.order,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int order,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChapterSummary() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterSummary implements ChapterSummary {
  const _ChapterSummary({required this.id, required this.title, required this.order, this.createdAt});
  factory _ChapterSummary.fromJson(Map<String, dynamic> json) => _$ChapterSummaryFromJson(json);

@override final  String id;
@override final  String title;
@override final  int order;
@override final  DateTime? createdAt;

/// Create a copy of ChapterSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterSummaryCopyWith<_ChapterSummary> get copyWith => __$ChapterSummaryCopyWithImpl<_ChapterSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order,createdAt);

@override
String toString() {
  return 'ChapterSummary(id: $id, title: $title, order: $order, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChapterSummaryCopyWith<$Res> implements $ChapterSummaryCopyWith<$Res> {
  factory _$ChapterSummaryCopyWith(_ChapterSummary value, $Res Function(_ChapterSummary) _then) = __$ChapterSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int order, DateTime? createdAt
});




}
/// @nodoc
class __$ChapterSummaryCopyWithImpl<$Res>
    implements _$ChapterSummaryCopyWith<$Res> {
  __$ChapterSummaryCopyWithImpl(this._self, this._then);

  final _ChapterSummary _self;
  final $Res Function(_ChapterSummary) _then;

/// Create a copy of ChapterSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? order = null,Object? createdAt = freezed,}) {
  return _then(_ChapterSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$NovelDetail {

 String get id; String get title; String get synopsis; String get status; String? get coverUrl; String get authorId; String get authorName; String? get authorAvatarUrl; int get chapterCount; int get ratingCount; double? get averageRating; List<ChapterSummary> get chapters; int? get myRating; bool? get inLibrary; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of NovelDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NovelDetailCopyWith<NovelDetail> get copyWith => _$NovelDetailCopyWithImpl<NovelDetail>(this as NovelDetail, _$identity);

  /// Serializes this NovelDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NovelDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.chapterCount, chapterCount) || other.chapterCount == chapterCount)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.myRating, myRating) || other.myRating == myRating)&&(identical(other.inLibrary, inLibrary) || other.inLibrary == inLibrary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,synopsis,status,coverUrl,authorId,authorName,authorAvatarUrl,chapterCount,ratingCount,averageRating,const DeepCollectionEquality().hash(chapters),myRating,inLibrary,createdAt,updatedAt);

@override
String toString() {
  return 'NovelDetail(id: $id, title: $title, synopsis: $synopsis, status: $status, coverUrl: $coverUrl, authorId: $authorId, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, chapterCount: $chapterCount, ratingCount: $ratingCount, averageRating: $averageRating, chapters: $chapters, myRating: $myRating, inLibrary: $inLibrary, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $NovelDetailCopyWith<$Res>  {
  factory $NovelDetailCopyWith(NovelDetail value, $Res Function(NovelDetail) _then) = _$NovelDetailCopyWithImpl;
@useResult
$Res call({
 String id, String title, String synopsis, String status, String? coverUrl, String authorId, String authorName, String? authorAvatarUrl, int chapterCount, int ratingCount, double? averageRating, List<ChapterSummary> chapters, int? myRating, bool? inLibrary, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$NovelDetailCopyWithImpl<$Res>
    implements $NovelDetailCopyWith<$Res> {
  _$NovelDetailCopyWithImpl(this._self, this._then);

  final NovelDetail _self;
  final $Res Function(NovelDetail) _then;

/// Create a copy of NovelDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? synopsis = null,Object? status = null,Object? coverUrl = freezed,Object? authorId = null,Object? authorName = null,Object? authorAvatarUrl = freezed,Object? chapterCount = null,Object? ratingCount = null,Object? averageRating = freezed,Object? chapters = null,Object? myRating = freezed,Object? inLibrary = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,chapterCount: null == chapterCount ? _self.chapterCount : chapterCount // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterSummary>,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,inLibrary: freezed == inLibrary ? _self.inLibrary : inLibrary // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NovelDetail].
extension NovelDetailPatterns on NovelDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NovelDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NovelDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NovelDetail value)  $default,){
final _that = this;
switch (_that) {
case _NovelDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NovelDetail value)?  $default,){
final _that = this;
switch (_that) {
case _NovelDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  String authorId,  String authorName,  String? authorAvatarUrl,  int chapterCount,  int ratingCount,  double? averageRating,  List<ChapterSummary> chapters,  int? myRating,  bool? inLibrary,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NovelDetail() when $default != null:
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.authorId,_that.authorName,_that.authorAvatarUrl,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.chapters,_that.myRating,_that.inLibrary,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  String authorId,  String authorName,  String? authorAvatarUrl,  int chapterCount,  int ratingCount,  double? averageRating,  List<ChapterSummary> chapters,  int? myRating,  bool? inLibrary,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _NovelDetail():
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.authorId,_that.authorName,_that.authorAvatarUrl,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.chapters,_that.myRating,_that.inLibrary,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String synopsis,  String status,  String? coverUrl,  String authorId,  String authorName,  String? authorAvatarUrl,  int chapterCount,  int ratingCount,  double? averageRating,  List<ChapterSummary> chapters,  int? myRating,  bool? inLibrary,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _NovelDetail() when $default != null:
return $default(_that.id,_that.title,_that.synopsis,_that.status,_that.coverUrl,_that.authorId,_that.authorName,_that.authorAvatarUrl,_that.chapterCount,_that.ratingCount,_that.averageRating,_that.chapters,_that.myRating,_that.inLibrary,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NovelDetail extends NovelDetail {
  const _NovelDetail({required this.id, required this.title, required this.synopsis, required this.status, this.coverUrl, required this.authorId, required this.authorName, this.authorAvatarUrl, required this.chapterCount, required this.ratingCount, this.averageRating, required final  List<ChapterSummary> chapters, this.myRating, this.inLibrary, this.createdAt, this.updatedAt}): _chapters = chapters,super._();
  factory _NovelDetail.fromJson(Map<String, dynamic> json) => _$NovelDetailFromJson(json);

@override final  String id;
@override final  String title;
@override final  String synopsis;
@override final  String status;
@override final  String? coverUrl;
@override final  String authorId;
@override final  String authorName;
@override final  String? authorAvatarUrl;
@override final  int chapterCount;
@override final  int ratingCount;
@override final  double? averageRating;
 final  List<ChapterSummary> _chapters;
@override List<ChapterSummary> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  int? myRating;
@override final  bool? inLibrary;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of NovelDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NovelDetailCopyWith<_NovelDetail> get copyWith => __$NovelDetailCopyWithImpl<_NovelDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NovelDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NovelDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.synopsis, synopsis) || other.synopsis == synopsis)&&(identical(other.status, status) || other.status == status)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.authorAvatarUrl, authorAvatarUrl) || other.authorAvatarUrl == authorAvatarUrl)&&(identical(other.chapterCount, chapterCount) || other.chapterCount == chapterCount)&&(identical(other.ratingCount, ratingCount) || other.ratingCount == ratingCount)&&(identical(other.averageRating, averageRating) || other.averageRating == averageRating)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.myRating, myRating) || other.myRating == myRating)&&(identical(other.inLibrary, inLibrary) || other.inLibrary == inLibrary)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,synopsis,status,coverUrl,authorId,authorName,authorAvatarUrl,chapterCount,ratingCount,averageRating,const DeepCollectionEquality().hash(_chapters),myRating,inLibrary,createdAt,updatedAt);

@override
String toString() {
  return 'NovelDetail(id: $id, title: $title, synopsis: $synopsis, status: $status, coverUrl: $coverUrl, authorId: $authorId, authorName: $authorName, authorAvatarUrl: $authorAvatarUrl, chapterCount: $chapterCount, ratingCount: $ratingCount, averageRating: $averageRating, chapters: $chapters, myRating: $myRating, inLibrary: $inLibrary, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$NovelDetailCopyWith<$Res> implements $NovelDetailCopyWith<$Res> {
  factory _$NovelDetailCopyWith(_NovelDetail value, $Res Function(_NovelDetail) _then) = __$NovelDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String synopsis, String status, String? coverUrl, String authorId, String authorName, String? authorAvatarUrl, int chapterCount, int ratingCount, double? averageRating, List<ChapterSummary> chapters, int? myRating, bool? inLibrary, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$NovelDetailCopyWithImpl<$Res>
    implements _$NovelDetailCopyWith<$Res> {
  __$NovelDetailCopyWithImpl(this._self, this._then);

  final _NovelDetail _self;
  final $Res Function(_NovelDetail) _then;

/// Create a copy of NovelDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? synopsis = null,Object? status = null,Object? coverUrl = freezed,Object? authorId = null,Object? authorName = null,Object? authorAvatarUrl = freezed,Object? chapterCount = null,Object? ratingCount = null,Object? averageRating = freezed,Object? chapters = null,Object? myRating = freezed,Object? inLibrary = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_NovelDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,synopsis: null == synopsis ? _self.synopsis : synopsis // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,authorName: null == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String,authorAvatarUrl: freezed == authorAvatarUrl ? _self.authorAvatarUrl : authorAvatarUrl // ignore: cast_nullable_to_non_nullable
as String?,chapterCount: null == chapterCount ? _self.chapterCount : chapterCount // ignore: cast_nullable_to_non_nullable
as int,ratingCount: null == ratingCount ? _self.ratingCount : ratingCount // ignore: cast_nullable_to_non_nullable
as int,averageRating: freezed == averageRating ? _self.averageRating : averageRating // ignore: cast_nullable_to_non_nullable
as double?,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<ChapterSummary>,myRating: freezed == myRating ? _self.myRating : myRating // ignore: cast_nullable_to_non_nullable
as int?,inLibrary: freezed == inLibrary ? _self.inLibrary : inLibrary // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
