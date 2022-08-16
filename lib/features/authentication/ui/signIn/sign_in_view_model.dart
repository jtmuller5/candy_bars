import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> signUp(String email, String password) async {
    final response = await Supabase.instance.client.auth.signUp(
      email,
      password,
    );

    debugPrint('Response: $response');

    if (response.statusCode != null) {
      /// Handle error
    } else {
      /// Sign in with success
    }
  }

  Future<void> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth.signIn(
      email: email,
      password: password,
    );

    debugPrint('Response: $response');

    if (response.statusCode != null) {
      /// Handle error
    } else {
      /// Sign in with success
    }
  }
}
