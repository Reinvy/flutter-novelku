// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadingHistory {

 HistoryNovel get novel; HistoryChapter get chapter; int get progress; DateTime get updatedAt;
/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingHistoryCopyWith<ReadingHistory> get copyWith => _$ReadingHistoryCopyWithImpl<ReadingHistory>(this as ReadingHistory, _$identity);

  /// Serializes this ReadingHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingHistory&&(identical(other.novel, novel) || other.novel == novel)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,novel,chapter,progress,updatedAt);

@override
String toString() {
  return 'ReadingHistory(novel: $novel, chapter: $chapter, progress: $progress, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ReadingHistoryCopyWith<$Res>  {
  factory $ReadingHistoryCopyWith(ReadingHistory value, $Res Function(ReadingHistory) _then) = _$ReadingHistoryCopyWithImpl;
@useResult
$Res call({
 HistoryNovel novel, HistoryChapter chapter, int progress, DateTime updatedAt
});


$HistoryNovelCopyWith<$Res> get novel;$HistoryChapterCopyWith<$Res> get chapter;

}
/// @nodoc
class _$ReadingHistoryCopyWithImpl<$Res>
    implements $ReadingHistoryCopyWith<$Res> {
  _$ReadingHistoryCopyWithImpl(this._self, this._then);

  final ReadingHistory _self;
  final $Res Function(ReadingHistory) _then;

/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? novel = null,Object? chapter = null,Object? progress = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
novel: null == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as HistoryNovel,chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as HistoryChapter,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryNovelCopyWith<$Res> get novel {
  
  return $HistoryNovelCopyWith<$Res>(_self.novel, (value) {
    return _then(_self.copyWith(novel: value));
  });
}/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryChapterCopyWith<$Res> get chapter {
  
  return $HistoryChapterCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReadingHistory].
extension ReadingHistoryPatterns on ReadingHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingHistory value)  $default,){
final _that = this;
switch (_that) {
case _ReadingHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingHistory value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HistoryNovel novel,  HistoryChapter chapter,  int progress,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingHistory() when $default != null:
return $default(_that.novel,_that.chapter,_that.progress,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HistoryNovel novel,  HistoryChapter chapter,  int progress,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ReadingHistory():
return $default(_that.novel,_that.chapter,_that.progress,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HistoryNovel novel,  HistoryChapter chapter,  int progress,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ReadingHistory() when $default != null:
return $default(_that.novel,_that.chapter,_that.progress,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadingHistory implements ReadingHistory {
  const _ReadingHistory({required this.novel, required this.chapter, required this.progress, required this.updatedAt});
  factory _ReadingHistory.fromJson(Map<String, dynamic> json) => _$ReadingHistoryFromJson(json);

@override final  HistoryNovel novel;
@override final  HistoryChapter chapter;
@override final  int progress;
@override final  DateTime updatedAt;

/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingHistoryCopyWith<_ReadingHistory> get copyWith => __$ReadingHistoryCopyWithImpl<_ReadingHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadingHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingHistory&&(identical(other.novel, novel) || other.novel == novel)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,novel,chapter,progress,updatedAt);

@override
String toString() {
  return 'ReadingHistory(novel: $novel, chapter: $chapter, progress: $progress, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ReadingHistoryCopyWith<$Res> implements $ReadingHistoryCopyWith<$Res> {
  factory _$ReadingHistoryCopyWith(_ReadingHistory value, $Res Function(_ReadingHistory) _then) = __$ReadingHistoryCopyWithImpl;
@override @useResult
$Res call({
 HistoryNovel novel, HistoryChapter chapter, int progress, DateTime updatedAt
});


@override $HistoryNovelCopyWith<$Res> get novel;@override $HistoryChapterCopyWith<$Res> get chapter;

}
/// @nodoc
class __$ReadingHistoryCopyWithImpl<$Res>
    implements _$ReadingHistoryCopyWith<$Res> {
  __$ReadingHistoryCopyWithImpl(this._self, this._then);

  final _ReadingHistory _self;
  final $Res Function(_ReadingHistory) _then;

/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? novel = null,Object? chapter = null,Object? progress = null,Object? updatedAt = null,}) {
  return _then(_ReadingHistory(
novel: null == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as HistoryNovel,chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as HistoryChapter,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryNovelCopyWith<$Res> get novel {
  
  return $HistoryNovelCopyWith<$Res>(_self.novel, (value) {
    return _then(_self.copyWith(novel: value));
  });
}/// Create a copy of ReadingHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryChapterCopyWith<$Res> get chapter {
  
  return $HistoryChapterCopyWith<$Res>(_self.chapter, (value) {
    return _then(_self.copyWith(chapter: value));
  });
}
}


/// @nodoc
mixin _$HistoryNovel {

 String get id; String get title; String? get coverUrl; HistoryAuthor? get author;
/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryNovelCopyWith<HistoryNovel> get copyWith => _$HistoryNovelCopyWithImpl<HistoryNovel>(this as HistoryNovel, _$identity);

  /// Serializes this HistoryNovel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl,author);

@override
String toString() {
  return 'HistoryNovel(id: $id, title: $title, coverUrl: $coverUrl, author: $author)';
}


}

/// @nodoc
abstract mixin class $HistoryNovelCopyWith<$Res>  {
  factory $HistoryNovelCopyWith(HistoryNovel value, $Res Function(HistoryNovel) _then) = _$HistoryNovelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? coverUrl, HistoryAuthor? author
});


$HistoryAuthorCopyWith<$Res>? get author;

}
/// @nodoc
class _$HistoryNovelCopyWithImpl<$Res>
    implements $HistoryNovelCopyWith<$Res> {
  _$HistoryNovelCopyWithImpl(this._self, this._then);

  final HistoryNovel _self;
  final $Res Function(HistoryNovel) _then;

/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,Object? author = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as HistoryAuthor?,
  ));
}
/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryAuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $HistoryAuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryNovel].
extension HistoryNovelPatterns on HistoryNovel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryNovel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryNovel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryNovel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryNovel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryNovel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryNovel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl,  HistoryAuthor? author)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl,_that.author);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl,  HistoryAuthor? author)  $default,) {final _that = this;
switch (_that) {
case _HistoryNovel():
return $default(_that.id,_that.title,_that.coverUrl,_that.author);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? coverUrl,  HistoryAuthor? author)?  $default,) {final _that = this;
switch (_that) {
case _HistoryNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl,_that.author);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryNovel implements HistoryNovel {
  const _HistoryNovel({required this.id, required this.title, this.coverUrl, this.author});
  factory _HistoryNovel.fromJson(Map<String, dynamic> json) => _$HistoryNovelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? coverUrl;
@override final  HistoryAuthor? author;

/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryNovelCopyWith<_HistoryNovel> get copyWith => __$HistoryNovelCopyWithImpl<_HistoryNovel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryNovelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.author, author) || other.author == author));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl,author);

@override
String toString() {
  return 'HistoryNovel(id: $id, title: $title, coverUrl: $coverUrl, author: $author)';
}


}

/// @nodoc
abstract mixin class _$HistoryNovelCopyWith<$Res> implements $HistoryNovelCopyWith<$Res> {
  factory _$HistoryNovelCopyWith(_HistoryNovel value, $Res Function(_HistoryNovel) _then) = __$HistoryNovelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? coverUrl, HistoryAuthor? author
});


@override $HistoryAuthorCopyWith<$Res>? get author;

}
/// @nodoc
class __$HistoryNovelCopyWithImpl<$Res>
    implements _$HistoryNovelCopyWith<$Res> {
  __$HistoryNovelCopyWithImpl(this._self, this._then);

  final _HistoryNovel _self;
  final $Res Function(_HistoryNovel) _then;

/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,Object? author = freezed,}) {
  return _then(_HistoryNovel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as HistoryAuthor?,
  ));
}

/// Create a copy of HistoryNovel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HistoryAuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $HistoryAuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}
}


/// @nodoc
mixin _$HistoryAuthor {

 String get name;
/// Create a copy of HistoryAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryAuthorCopyWith<HistoryAuthor> get copyWith => _$HistoryAuthorCopyWithImpl<HistoryAuthor>(this as HistoryAuthor, _$identity);

  /// Serializes this HistoryAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryAuthor&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'HistoryAuthor(name: $name)';
}


}

/// @nodoc
abstract mixin class $HistoryAuthorCopyWith<$Res>  {
  factory $HistoryAuthorCopyWith(HistoryAuthor value, $Res Function(HistoryAuthor) _then) = _$HistoryAuthorCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class _$HistoryAuthorCopyWithImpl<$Res>
    implements $HistoryAuthorCopyWith<$Res> {
  _$HistoryAuthorCopyWithImpl(this._self, this._then);

  final HistoryAuthor _self;
  final $Res Function(HistoryAuthor) _then;

/// Create a copy of HistoryAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryAuthor].
extension HistoryAuthorPatterns on HistoryAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryAuthor value)  $default,){
final _that = this;
switch (_that) {
case _HistoryAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryAuthor() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case _HistoryAuthor():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case _HistoryAuthor() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryAuthor implements HistoryAuthor {
  const _HistoryAuthor({required this.name});
  factory _HistoryAuthor.fromJson(Map<String, dynamic> json) => _$HistoryAuthorFromJson(json);

@override final  String name;

/// Create a copy of HistoryAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryAuthorCopyWith<_HistoryAuthor> get copyWith => __$HistoryAuthorCopyWithImpl<_HistoryAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryAuthor&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return 'HistoryAuthor(name: $name)';
}


}

/// @nodoc
abstract mixin class _$HistoryAuthorCopyWith<$Res> implements $HistoryAuthorCopyWith<$Res> {
  factory _$HistoryAuthorCopyWith(_HistoryAuthor value, $Res Function(_HistoryAuthor) _then) = __$HistoryAuthorCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$HistoryAuthorCopyWithImpl<$Res>
    implements _$HistoryAuthorCopyWith<$Res> {
  __$HistoryAuthorCopyWithImpl(this._self, this._then);

  final _HistoryAuthor _self;
  final $Res Function(_HistoryAuthor) _then;

/// Create a copy of HistoryAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(_HistoryAuthor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HistoryChapter {

 String get id; String get title; int get order;
/// Create a copy of HistoryChapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryChapterCopyWith<HistoryChapter> get copyWith => _$HistoryChapterCopyWithImpl<HistoryChapter>(this as HistoryChapter, _$identity);

  /// Serializes this HistoryChapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order);

@override
String toString() {
  return 'HistoryChapter(id: $id, title: $title, order: $order)';
}


}

/// @nodoc
abstract mixin class $HistoryChapterCopyWith<$Res>  {
  factory $HistoryChapterCopyWith(HistoryChapter value, $Res Function(HistoryChapter) _then) = _$HistoryChapterCopyWithImpl;
@useResult
$Res call({
 String id, String title, int order
});




}
/// @nodoc
class _$HistoryChapterCopyWithImpl<$Res>
    implements $HistoryChapterCopyWith<$Res> {
  _$HistoryChapterCopyWithImpl(this._self, this._then);

  final HistoryChapter _self;
  final $Res Function(HistoryChapter) _then;

/// Create a copy of HistoryChapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? order = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryChapter].
extension HistoryChapterPatterns on HistoryChapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryChapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryChapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryChapter value)  $default,){
final _that = this;
switch (_that) {
case _HistoryChapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryChapter value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryChapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int order)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryChapter() when $default != null:
return $default(_that.id,_that.title,_that.order);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int order)  $default,) {final _that = this;
switch (_that) {
case _HistoryChapter():
return $default(_that.id,_that.title,_that.order);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int order)?  $default,) {final _that = this;
switch (_that) {
case _HistoryChapter() when $default != null:
return $default(_that.id,_that.title,_that.order);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryChapter implements HistoryChapter {
  const _HistoryChapter({required this.id, required this.title, required this.order});
  factory _HistoryChapter.fromJson(Map<String, dynamic> json) => _$HistoryChapterFromJson(json);

@override final  String id;
@override final  String title;
@override final  int order;

/// Create a copy of HistoryChapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryChapterCopyWith<_HistoryChapter> get copyWith => __$HistoryChapterCopyWithImpl<_HistoryChapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryChapter&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.order, order) || other.order == order));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,order);

@override
String toString() {
  return 'HistoryChapter(id: $id, title: $title, order: $order)';
}


}

/// @nodoc
abstract mixin class _$HistoryChapterCopyWith<$Res> implements $HistoryChapterCopyWith<$Res> {
  factory _$HistoryChapterCopyWith(_HistoryChapter value, $Res Function(_HistoryChapter) _then) = __$HistoryChapterCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int order
});




}
/// @nodoc
class __$HistoryChapterCopyWithImpl<$Res>
    implements _$HistoryChapterCopyWith<$Res> {
  __$HistoryChapterCopyWithImpl(this._self, this._then);

  final _HistoryChapter _self;
  final $Res Function(_HistoryChapter) _then;

/// Create a copy of HistoryChapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? order = null,}) {
  return _then(_HistoryChapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
