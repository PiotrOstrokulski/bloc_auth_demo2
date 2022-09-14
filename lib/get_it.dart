import 'package:bloc_auth_demo/models/mocked_repo.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupServices() => locator.registerLazySingleton<MockedRepo>(MockedRepo.new);
