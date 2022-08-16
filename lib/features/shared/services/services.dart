import 'package:candy_bars/features/authentication/services/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

AuthService get authService{
  return getIt.get<AuthService>();
}