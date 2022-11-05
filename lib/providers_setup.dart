import 'package:frontend_engineer_test/providers/university_provider_service.dart';
import 'package:frontend_engineer_test/services/university_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  // single providers
  Provider(create: (context) => UniversityService()),

  //
  ChangeNotifierProvider(
    create: (context) => UniversityProvider(service: UniversityService()),
  ),
];
