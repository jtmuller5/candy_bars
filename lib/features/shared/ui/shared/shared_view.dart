import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import './shared_view_model.dart';

class SharedView extends StatelessWidget {
  const SharedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder
    <SharedViewModel>.reactive(
      viewModelBuilder: () => SharedViewModel(),
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