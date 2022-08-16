import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './new_bar_view_model.dart';

class NewBarView extends StatelessWidget {
  const NewBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <NewBarViewModel>.reactive(
      viewModelBuilder: () => NewBarViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: Column(
              children: [
                Container()
              ],
            )
        );
      },
    );
  }
}