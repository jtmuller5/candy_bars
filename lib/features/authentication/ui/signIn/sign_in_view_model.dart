import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> signUp(String email, String password) async {
    String formattedEmail = email.trim();
    String formattedPassword = password.trim();

    final response = await Supabase.instance.client.auth.signUp(
      formattedEmail,
      formattedPassword,
    );

    debugPrint('Response: $response');

    if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! <= 299) {
      response.user;
      response.session;
      signIn(formattedEmail, formattedPassword);
    } else {}
  }

  Future<void> signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth.signIn(
      email: email.trim(),
      password: password.trim(),
    );

    debugPrint('Response: $response');

    if (response.statusCode != null) {
      /// Handle error
    } else {
      /// Sign in with success
    }
  }
}
