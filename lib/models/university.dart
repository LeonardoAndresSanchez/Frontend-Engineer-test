import 'package:freezed_annotation/freezed_annotation.dart';

part 'university.freezed.dart';
part 'university.g.dart';

@freezed
class University with _$University {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory University({
    String? alphaTwoCode,
    List<String>? domains,
    String? country,
    String? stateProvince,
    List<String>? webPages,
    String? name,
  }) = _University;

  factory University.fromJson(Map<String, dynamic> json) =>
      _$UniversityFromJson(json);
}
