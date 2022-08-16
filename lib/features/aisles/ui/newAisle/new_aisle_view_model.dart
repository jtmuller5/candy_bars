import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class NewAisleViewModel extends BaseViewModel {
  void initialize() {}

  Future<void> submitAisle(String name) async {
    setBusy(true);

    try {
      var uuid = Uuid();

      Aisle newAisle = Aisle(
        name: name,
        userId: Supabase.instance.client.auth.currentUser?.id,
        createdAt: DateTime.now(),
        id: uuid.v4(),
      );

      Map? response = await Supabase.instance.client.from('aisles').insert([newAisle.toJson()]);

      debugPrint('Response: ${response.toString()}');
    } catch (e) {
      debugPrint('Aisle error: $e');
    }

    setBusy(false);
  }
}
