import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashViewModel extends BaseViewModel {
  Future<bool> checkAuthState() async {
    try {
      final initialSession = await SupabaseAuth.instance.initialSession;

      debugPrint('Initial Session: $initialSession');

      if(initialSession == null) return false;

      return true;
    } catch (error) {
      // Handle errors in session initial recovery here
      debugPrint('Auth initialization error: $error');
      return false;
    }
  }
}
