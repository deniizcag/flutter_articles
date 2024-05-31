// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      uri: json['uri'] as String?,
      url: json['url'] as String?,
      id: (json['id'] as num?)?.toInt(),
      assetId: (json['assetId'] as num?)?.toInt(),
      source: json['source'] as String?,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      section: json['section'] as String?,
      subsection: json['subsection'] as String?,
      nytdsection: json['nytdsection'] as String?,
      adxKeywords: json['adxKeywords'] as String?,
      column: json['column'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      articleModelAbstract: json['articleModelAbstract'] as String?,
      desFacet: (json['desFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      orgFacet: (json['orgFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      perFacet: (json['perFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      geoFacet: (json['geoFacet'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      etaId: (json['etaId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'uri': instance.uri,
      'url': instance.url,
      'id': instance.id,
      'assetId': instance.assetId,
      'source': instance.source,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'section': instance.section,
      'subsection': instance.subsection,
      'nytdsection': instance.nytdsection,
      'adxKeywords': instance.adxKeywords,
      'column': instance.column,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'articleModelAbstract': instance.articleModelAbstract,
      'desFacet': instance.desFacet,
      'orgFacet': instance.orgFacet,
      'perFacet': instance.perFacet,
      'geoFacet': instance.geoFacet,
      'media': instance.media,
      'etaId': instance.etaId,
    };
