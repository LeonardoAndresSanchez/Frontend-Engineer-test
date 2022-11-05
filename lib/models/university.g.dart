// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'university.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_University _$$_UniversityFromJson(Map<String, dynamic> json) =>
    _$_University(
      alphaTwoCode: json['alpha_two_code'] as String?,
      domains:
          (json['domains'] as List<dynamic>?)?.map((e) => e as String).toList(),
      country: json['country'] as String?,
      stateProvince: json['state_province'] as String?,
      webPages: (json['web_pages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_UniversityToJson(_$_University instance) =>
    <String, dynamic>{
      'alpha_two_code': instance.alphaTwoCode,
      'domains': instance.domains,
      'country': instance.country,
      'state_province': instance.stateProvince,
      'web_pages': instance.webPages,
      'name': instance.name,
    };
