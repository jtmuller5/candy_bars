import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './new_aisle_view_model.dart';

class NewAisleView extends StatelessWidget {
  const NewAisleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <NewAisleViewModel>.reactive(
      viewModelBuilder: () => NewAisleViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: Background(
              child: Column(
                children: [
                  Container()
                ],
              ),
            )
        );
      },
    );
  }
}