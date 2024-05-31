import 'package:flutter_bloc_dio_articles/src/features/articles/domain/models/media_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  String? uri;
  String? url;
  int? id;
  int? assetId;
  String? source;
  DateTime? publishedDate;
  DateTime? updated;
  String? section;
  String? subsection;
  String? nytdsection;
  String? adxKeywords;
  String? column;
  String? byline;
  String? type;
  String? title;
  String? articleModelAbstract;
  List<String>? desFacet;
  List<String>? orgFacet;
  List<String>? perFacet;
  List<String>? geoFacet;
  List<MediaModel>? media;
  int? etaId;

  ArticleModel({
    this.uri,
    this.url,
    this.id,
    this.assetId,
    this.source,
    this.publishedDate,
    this.updated,
    this.section,
    this.subsection,
    this.nytdsection,
    this.adxKeywords,
    this.column,
    this.byline,
    this.type,
    this.title,
    this.articleModelAbstract,
    this.desFacet,
    this.orgFacet,
    this.perFacet,
    this.geoFacet,
    this.media,
    this.etaId,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);

  static List<ArticleModel> fromJsonList(List? json) {
    return json?.map((e) => ArticleModel.fromJson(e)).toList() ?? [];
  }
}
