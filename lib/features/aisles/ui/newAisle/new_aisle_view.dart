import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:candy_bars/features/shared/ui/loading_overlay.dart';
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
        nameController.addListener(() {
          model.notifyListeners();
        });
      },
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text('New Aisle'),
              leading: CloseButton(
                color: Colors.black,
              ),
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Background(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 72),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(label: Text('Aisle Name')),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: nameController.text.isNotEmpty ? () async {
                            await model.submitAisle(nameController.text);
                            Navigator.of(context).pop();
                          } : null,
                          child: Text('Submit'),
                        )
                      ],
                    ),
                  ),
                ),
                if(model.isBusy) LoadingOverlay(),
              ],
            ));
      },
    );
  }
}
