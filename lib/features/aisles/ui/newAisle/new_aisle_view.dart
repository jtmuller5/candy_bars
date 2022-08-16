import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import './new_aisle_view_model.dart';

class NewAisleView extends HookWidget {
  const NewAisleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = useTextEditingController();

    return ViewModelBuilder<NewAisleViewModel>.reactive(
      viewModelBuilder: () => NewAisleViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
            body: Background(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(

                  children: [
                    SizedBox(height: 72),
                    TextField(
                      controller: nameController,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: CloseButton(),
              ),
            ],
          ),
        ));
      },
    );
  }
}
