import 'package:get_it/get_it.dart';
import '../models/associated.dto.dart';
import '../models/template.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AssociatedDTO>(() => Template().loadAssociatedDTO());
}