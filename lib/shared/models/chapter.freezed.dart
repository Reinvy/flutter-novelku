// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

 String get id; String get novelId; String get title; String get content; int get order; DateTime? get createdAt; ChapterNovel? get novel;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.novelId, novelId) || other.novelId == novelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.novel, novel) || other.novel == novel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,novelId,title,content,order,createdAt,novel);

@override
String toString() {
  return 'Chapter(id: $id, novelId: $novelId, title: $title, content: $content, order: $order, createdAt: $createdAt, novel: $novel)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 String id, String novelId, String title, String content, int order, DateTime? createdAt, ChapterNovel? novel
});


$ChapterNovelCopyWith<$Res>? get novel;

}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? novelId = null,Object? title = null,Object? content = null,Object? order = null,Object? createdAt = freezed,Object? novel = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,novelId: null == novelId ? _self.novelId : novelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,novel: freezed == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as ChapterNovel?,
  ));
}
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterNovelCopyWith<$Res>? get novel {
    if (_self.novel == null) {
    return null;
  }

  return $ChapterNovelCopyWith<$Res>(_self.novel!, (value) {
    return _then(_self.copyWith(novel: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String novelId,  String title,  String content,  int order,  DateTime? createdAt,  ChapterNovel? novel)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.novelId,_that.title,_that.content,_that.order,_that.createdAt,_that.novel);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String novelId,  String title,  String content,  int order,  DateTime? createdAt,  ChapterNovel? novel)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.novelId,_that.title,_that.content,_that.order,_that.createdAt,_that.novel);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String novelId,  String title,  String content,  int order,  DateTime? createdAt,  ChapterNovel? novel)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.novelId,_that.title,_that.content,_that.order,_that.createdAt,_that.novel);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
  const _Chapter({required this.id, required this.novelId, required this.title, required this.content, required this.order, this.createdAt, this.novel});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override final  String id;
@override final  String novelId;
@override final  String title;
@override final  String content;
@override final  int order;
@override final  DateTime? createdAt;
@override final  ChapterNovel? novel;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.novelId, novelId) || other.novelId == novelId)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.order, order) || other.order == order)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.novel, novel) || other.novel == novel));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,novelId,title,content,order,createdAt,novel);

@override
String toString() {
  return 'Chapter(id: $id, novelId: $novelId, title: $title, content: $content, order: $order, createdAt: $createdAt, novel: $novel)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 String id, String novelId, String title, String content, int order, DateTime? createdAt, ChapterNovel? novel
});


@override $ChapterNovelCopyWith<$Res>? get novel;

}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? novelId = null,Object? title = null,Object? content = null,Object? order = null,Object? createdAt = freezed,Object? novel = freezed,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,novelId: null == novelId ? _self.novelId : novelId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,novel: freezed == novel ? _self.novel : novel // ignore: cast_nullable_to_non_nullable
as ChapterNovel?,
  ));
}

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChapterNovelCopyWith<$Res>? get novel {
    if (_self.novel == null) {
    return null;
  }

  return $ChapterNovelCopyWith<$Res>(_self.novel!, (value) {
    return _then(_self.copyWith(novel: value));
  });
}
}


/// @nodoc
mixin _$ChapterNovel {

 String get id; String get title; String? get coverUrl; String? get authorId;
/// Create a copy of ChapterNovel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterNovelCopyWith<ChapterNovel> get copyWith => _$ChapterNovelCopyWithImpl<ChapterNovel>(this as ChapterNovel, _$identity);

  /// Serializes this ChapterNovel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChapterNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.authorId, authorId) || other.authorId == authorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl,authorId);

@override
String toString() {
  return 'ChapterNovel(id: $id, title: $title, coverUrl: $coverUrl, authorId: $authorId)';
}


}

/// @nodoc
abstract mixin class $ChapterNovelCopyWith<$Res>  {
  factory $ChapterNovelCopyWith(ChapterNovel value, $Res Function(ChapterNovel) _then) = _$ChapterNovelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? coverUrl, String? authorId
});




}
/// @nodoc
class _$ChapterNovelCopyWithImpl<$Res>
    implements $ChapterNovelCopyWith<$Res> {
  _$ChapterNovelCopyWithImpl(this._self, this._then);

  final ChapterNovel _self;
  final $Res Function(ChapterNovel) _then;

/// Create a copy of ChapterNovel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,Object? authorId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChapterNovel].
extension ChapterNovelPatterns on ChapterNovel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChapterNovel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChapterNovel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChapterNovel value)  $default,){
final _that = this;
switch (_that) {
case _ChapterNovel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChapterNovel value)?  $default,){
final _that = this;
switch (_that) {
case _ChapterNovel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl,  String? authorId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChapterNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl,_that.authorId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? coverUrl,  String? authorId)  $default,) {final _that = this;
switch (_that) {
case _ChapterNovel():
return $default(_that.id,_that.title,_that.coverUrl,_that.authorId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? coverUrl,  String? authorId)?  $default,) {final _that = this;
switch (_that) {
case _ChapterNovel() when $default != null:
return $default(_that.id,_that.title,_that.coverUrl,_that.authorId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChapterNovel implements ChapterNovel {
  const _ChapterNovel({required this.id, required this.title, this.coverUrl, this.authorId});
  factory _ChapterNovel.fromJson(Map<String, dynamic> json) => _$ChapterNovelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? coverUrl;
@override final  String? authorId;

/// Create a copy of ChapterNovel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterNovelCopyWith<_ChapterNovel> get copyWith => __$ChapterNovelCopyWithImpl<_ChapterNovel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterNovelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChapterNovel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.authorId, authorId) || other.authorId == authorId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,coverUrl,authorId);

@override
String toString() {
  return 'ChapterNovel(id: $id, title: $title, coverUrl: $coverUrl, authorId: $authorId)';
}


}

/// @nodoc
abstract mixin class _$ChapterNovelCopyWith<$Res> implements $ChapterNovelCopyWith<$Res> {
  factory _$ChapterNovelCopyWith(_ChapterNovel value, $Res Function(_ChapterNovel) _then) = __$ChapterNovelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? coverUrl, String? authorId
});




}
/// @nodoc
class __$ChapterNovelCopyWithImpl<$Res>
    implements _$ChapterNovelCopyWith<$Res> {
  __$ChapterNovelCopyWithImpl(this._self, this._then);

  final _ChapterNovel _self;
  final $Res Function(_ChapterNovel) _then;

/// Create a copy of ChapterNovel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? coverUrl = freezed,Object? authorId = freezed,}) {
  return _then(_ChapterNovel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,authorId: freezed == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
