import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './new_bar_view_model.dart';

class NewBarView extends StatelessWidget {
  const NewBarView({Key? key, required this.aisle}) : super(key: key);

  final Aisle aisle;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NewBarViewModel>.reactive(
      viewModelBuilder: () => NewBarViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Background(
            child: SafeArea(
              child: Column(
                children: [Container()],
              ),
            ),
          ),
          extendBodyBehindAppBar: true,
        );
      },
    );
  }
}
