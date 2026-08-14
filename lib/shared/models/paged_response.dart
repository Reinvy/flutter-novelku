import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_response.freezed.dart';
part 'paged_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PagedResponse<T> with _$PagedResponse<T> {
  const factory PagedResponse({
    required List<T> items,
    required PageMeta meta,
  }) = _PagedResponse<T>;

  factory PagedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$PagedResponseFromJson(json, fromJsonT);
}

@freezed
abstract class PageMeta with _$PageMeta {
  const factory PageMeta({
    required int page,
    required int pageSize,
    required int total,
    required int totalPages,
  }) = _PageMeta;

  factory PageMeta.fromJson(Map<String, dynamic> json) => _$PageMetaFromJson(json);
}
