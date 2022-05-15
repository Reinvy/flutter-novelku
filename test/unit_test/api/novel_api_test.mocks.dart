// Mocks generated by Mockito 5.1.0 from annotations
// in novelku/test/unit_test/api/novel_api_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:novelku/models/api/novel_api.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [NovelApi].
///
/// See the documentation for Mockito's code generation for more information.
class MockNovelApi extends _i1.Mock implements _i2.NovelApi {
  MockNovelApi() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> getNovels() =>
      (super.noSuchMethod(Invocation.method(#getNovels, []),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<void> postNovel(String? judul, String? sinopsis, String? author,
          String? status, String? linkImage) =>
      (super.noSuchMethod(
          Invocation.method(
              #postNovel, [judul, sinopsis, author, status, linkImage]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> updateNovel(String? id, String? judul, String? sinopsis,
          String? author, String? status, String? linkImage) =>
      (super.noSuchMethod(
          Invocation.method(
              #updateNovel, [id, judul, sinopsis, author, status, linkImage]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteNovel(String? idNovel) =>
      (super.noSuchMethod(Invocation.method(#deleteNovel, [idNovel]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> postChapters(
          String? idNovel, String? judulChapter, String? content) =>
      (super.noSuchMethod(
          Invocation.method(#postChapters, [idNovel, judulChapter, content]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  _i3.Future<void> deleteChapter(String? idNovel, String? idChapter) => (super
      .noSuchMethod(Invocation.method(#deleteChapter, [idNovel, idChapter]),
          returnValue: Future<void>.value(),
          returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
}