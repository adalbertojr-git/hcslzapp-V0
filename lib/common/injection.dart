import 'package:get_it/get_it.dart';
import '../models/associated.dart';
import '../models/template.dart';
import '../models/token.dart';

final locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton<Associated>(() => Template().loadAssociated());
  locator.registerLazySingleton<Token>(() => Token(token: ''));
}

loadAssociatedSingleton(Associated associated) {
  locator.get<Associated>().id = associated.id;
  locator.get<Associated>().name = associated.name;
  locator.get<Associated>().email = associated.email;
  locator.get<Associated>().phone = associated.phone;
  locator.get<Associated>().sponsor = associated.sponsor;
  locator.get<Associated>().cnh = associated.cnh;
  locator.get<Associated>().cpf = associated.cpf;
  locator.get<Associated>().bloodType = associated.bloodType;
  locator.get<Associated>().associatedType = associated.associatedType;
  locator.get<Associated>().dateBirth = associated.dateBirth;
  locator.get<Associated>().dateShield = associated.dateShield;
  locator.get<Associated>().status = associated.status;
  locator.get<Associated>().photoUrl = associated.photoUrl;
  locator.get<Associated>().dependents = associated.dependents;
  locator.get<Associated>().motorcycles = associated.motorcycles;
  locator.get<Associated>().authenticate = associated.authenticate;
}

loadTokenSingleton(Token token){
  locator.get<Token>().token = token.token;
}