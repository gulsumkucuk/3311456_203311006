import 'package:get_it/get_it.dart';
import 'package:flutter_proje/services/auth_service.dart';
import 'package:flutter_proje/services/provider/auth_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<AuthProvider>(AuthProvider());
  locator.registerSingleton<AuthService>(AuthService());
}