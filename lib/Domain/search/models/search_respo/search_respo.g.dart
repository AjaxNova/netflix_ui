// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_respo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRespo _$SearchRespoFromJson(Map<String, dynamic> json) => SearchRespo(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => SearchResultdata.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SearchRespoToJson(SearchRespo instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

SearchResultdata _$SearchResultdataFromJson(Map<String, dynamic> json) =>
    SearchResultdata(
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$SearchResultdataToJson(SearchResultdata instance) =>
    <String, dynamic>{
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
    };
