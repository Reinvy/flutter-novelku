// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paged_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PagedResponse<T> _$PagedResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PagedResponse<T>(
  items: (json['items'] as List<dynamic>).map(fromJsonT).toList(),
  meta: PageMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PagedResponseToJson<T>(
  _PagedResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'items': instance.items.map(toJsonT).toList(),
  'meta': instance.meta,
};

_PageMeta _$PageMetaFromJson(Map<String, dynamic> json) => _PageMeta(
  page: (json['page'] as num).toInt(),
  pageSize: (json['pageSize'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  totalPages: (json['totalPages'] as num).toInt(),
);

Map<String, dynamic> _$PageMetaToJson(_PageMeta instance) => <String, dynamic>{
  'page': instance.page,
  'pageSize': instance.pageSize,
  'total': instance.total,
  'totalPages': instance.totalPages,
};
