import 'package:flutter/material.dart';
import 'package:frontend_engineer_test/abstract/university_service_abs.dart';
import 'package:frontend_engineer_test/models/university.dart';

enum UniversityState { Idle, Busy }

class UniversityProvider extends ChangeNotifier {
  UniversityProvider({required UniversityServiceAbs service})
      : _service = service {
    _state = UniversityState.Busy;
    _listCollege = [];
  }

  /// Attributes
  UniversityServiceAbs _service;
  UniversityState? _state;
  List<University>? _listCollege;
  int lastItem = 0;

  Future getCollege() async {
    try {
      _listCollege = await _service.fetchAllCollege();
      notifyListeners();
      return _listCollege;
    } catch (e) {
      print(e);
    } finally {}
  }

  add20Img() {
    for (var i = 0; i < 20; i++) {
      lastItem++;
    }
  }

  /// getters
  UniversityState? get state => _state;
  List<University>? get getColleges => _listCollege;

  /// setters
  set state(UniversityState? value) {
    _state = value;
    notifyListeners();
  }

  set setColleges(List<University>? value) {
    _listCollege = value!;
    notifyListeners();
  }
}
