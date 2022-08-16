import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NewAisleViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> submitAisle() async {
    Aisle newAisle = Aisle(
      name: 'Test',
    );

    await Supabase.instance.client.from('bars').insert([newAisle.toJson()]);
  }
}
