import 'dart:convert';

import 'package:frontend_engineer_test/models/university.dart';
import 'package:http/http.dart';
import '../abstract/university_service_abs.dart';

class UniversityService implements UniversityServiceAbs {
  final uri = Uri.parse(
      'https://tyba-assets.s3.amazonaws.com/FE-Engineer-test/universities.json#');

  static String path = 'tyba-assets.s3.amazonaws.com';
  @override
  Future fetchAllCollege() async {
    Response response = await get(uri);
    List<dynamic> res = jsonDecode(utf8.decode(response.bodyBytes));

    return res.map((json) => University.fromJson(json)).toList();
  }
}
