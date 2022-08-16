import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
