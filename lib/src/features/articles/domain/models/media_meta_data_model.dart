import 'package:json_annotation/json_annotation.dart';

part 'media_meta_data_model.g.dart';

@JsonSerializable()
class MediaMetaDataModel {
  String? url;
  String? format;
  int? height;
  int? width;

  MediaMetaDataModel({
    this.url,
    this.format,
    this.height,
    this.width,
  });

  factory MediaMetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MediaMetaDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMetaDataModelToJson(this);
}
