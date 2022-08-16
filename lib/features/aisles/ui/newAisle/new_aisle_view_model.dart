import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewAisleViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> submitAisle(String name) async {
    Aisle newAisle = Aisle(
      name: name,
      userId: Supabase.instance.client.auth.currentUser?.id,
      createdAt: DateTime.now(),
      //id: 1
    );

    await Supabase.instance.client.from('aisles').insert([newAisle.toJson()]);
  }
}
