import 'package:json_annotation/json_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';
part 'photo.freezed.dart';


@freezed
class Photo with _$Photo {
   factory Photo({
    required int id,
    required String tags,
    required String previewURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}