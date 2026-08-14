// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {

 String get id; String get title; int get order; DateTime get bookmarkedAt; BookmarkNovel get novel;
/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkCopyWith<Bookmark> get copyWith => _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bookmark&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order)&&(identical(other.bookmarkedAt, bookmarkedAt) || other.bookmarkedAt == bookmarkedAt)&&(identical(other.novel, novel) || other.novel == novel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order,bookmarkedAt,novel);

@override
String toString() {
  return 'Bookmark(id: $id, title: $title, order: $order, bookmarkedAt: $bookmarkedAt, novel: $novel)';
}


}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res>  {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) = _$BookmarkCopyWithImpl;
@useResult
$Res call({
 String id, String title, int order, DateTime bookmarkedAt, BookmarkNovel novel
});


$BookmarkNovelCopyWith<$Res> get novel;

}
/// @nodoc
class _$BookmarkCopyWithImpl<$Res>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? order = null,Object? bookmarkedAt = null,Object? novel = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,bookmarkedAt: null == bookmarkedAt ? _self.bookmarkedAt : bookmarkedAt // ignore: cast_nullable_to_non_nullable
as DateTime,novel: null == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as BookmarkNovel,
  ));
}
/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkNovelCopyWith<$Res> get novel {
  
  return $BookmarkNovelCopyWith<$Res>(_self.novel, (value) {
    return _then(_self.copyWith(novel: value));
  });
}
}


/// Adds pattern-matching-related methods to [Bookmark].
extension BookmarkPatterns on Bookmark {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bookmark value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bookmark value)  $default,){
final _that = this;
switch (_that) {
case _Bookmark():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bookmark value)?  $default,){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int order,  DateTime bookmarkedAt,  BookmarkNovel novel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.bookmarkedAt,_that.novel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int order,  DateTime bookmarkedAt,  BookmarkNovel novel)  $default,) {final _that = this;
switch (_that) {
case _Bookmark():
return $default(_that.id,_that.title,_that.order,_that.bookmarkedAt,_that.novel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int order,  DateTime bookmarkedAt,  BookmarkNovel novel)?  $default,) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.id,_that.title,_that.order,_that.bookmarkedAt,_that.novel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bookmark implements Bookmark {
  const _Bookmark({required this.id, required this.title, required this.order, required this.bookmarkedAt, required this.novel});
  factory _Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);

@override final  String id;
@override final  String title;
@override final  int order;
@override final  DateTime bookmarkedAt;
@override final  BookmarkNovel novel;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order)&&(identical(other.bookmarkedAt, bookmarkedAt) || other.bookmarkedAt == bookmarkedAt)&&(identical(other.novel, novel) || other.novel == novel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order,bookmarkedAt,novel);

@override
String toString() {
  return 'Bookmark(id: $id, title: $title, order: $order, bookmarkedAt: $bookmarkedAt, novel: $novel)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int order, DateTime bookmarkedAt, BookmarkNovel novel
});


@override $BookmarkNovelCopyWith<$Res> get novel;

}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? order = null,Object? bookmarkedAt = null,Object? novel = null,}) {
  return _then(_Bookmark(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,bookmarkedAt: null == bookmarkedAt ? _self.bookmarkedAt : bookmarkedAt // ignore: cast_nullable_to_non_nullable
as DateTime,novel: null == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as BookmarkNovel,
  ));
}

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookmarkNovelCopyWith<$Res> get novel {
  
  return $BookmarkNovelCopyWith<$Res>(_self.novel, (value) {
    return _then(_self.copyWith(novel: value));
  });
}
}


/// @nodoc
mixin _$BookmarkNovel {

 String get id; String get title; String? get coverUrl;
/// Create a copy of BookmarkNovel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkNovelCopyWith<BookmarkNovel> get copyWith => _$BookmarkNovelCopyWithImpl<BookmarkNovel>(this as BookmarkNovel, _$identity);

  /// Serializes this BookmarkNovel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookmarkNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl);

@override
String toString() {
  return 'BookmarkNovel(id: $id, title: $title, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class $BookmarkNovelCopyWith<$Res>  {
  factory $BookmarkNovelCopyWith(BookmarkNovel value, $Res Function(BookmarkNovel) _then) = _$BookmarkNovelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? coverUrl
});




}
/// @nodoc
class _$BookmarkNovelCopyWithImpl<$Res>
    implements $BookmarkNovelCopyWith<$Res> {
  _$BookmarkNovelCopyWithImpl(this._self, this._then);

  final BookmarkNovel _self;
  final $Res Function(BookmarkNovel) _then;

/// Create a copy of BookmarkNovel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BookmarkNovel].
extension BookmarkNovelPatterns on BookmarkNovel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookmarkNovel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookmarkNovel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookmarkNovel value)  $default,){
final _that = this;
switch (_that) {
case _BookmarkNovel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookmarkNovel value)?  $default,){
final _that = this;
switch (_that) {
case _BookmarkNovel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookmarkNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl)  $default,) {final _that = this;
switch (_that) {
case _BookmarkNovel():
return $default(_that.id,_that.title,_that.coverUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? coverUrl)?  $default,) {final _that = this;
switch (_that) {
case _BookmarkNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookmarkNovel implements BookmarkNovel {
  const _BookmarkNovel({required this.id, required this.title, this.coverUrl});
  factory _BookmarkNovel.fromJson(Map<String, dynamic> json) => _$BookmarkNovelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? coverUrl;

/// Create a copy of BookmarkNovel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkNovelCopyWith<_BookmarkNovel> get copyWith => __$BookmarkNovelCopyWithImpl<_BookmarkNovel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkNovelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookmarkNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl);

@override
String toString() {
  return 'BookmarkNovel(id: $id, title: $title, coverUrl: $coverUrl)';
}


}

/// @nodoc
abstract mixin class _$BookmarkNovelCopyWith<$Res> implements $BookmarkNovelCopyWith<$Res> {
  factory _$BookmarkNovelCopyWith(_BookmarkNovel value, $Res Function(_BookmarkNovel) _then) = __$BookmarkNovelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? coverUrl
});




}
/// @nodoc
class __$BookmarkNovelCopyWithImpl<$Res>
    implements _$BookmarkNovelCopyWith<$Res> {
  __$BookmarkNovelCopyWithImpl(this._self, this._then);

  final _BookmarkNovel _self;
  final $Res Function(_BookmarkNovel) _then;

/// Create a copy of BookmarkNovel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,}) {
  return _then(_BookmarkNovel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
