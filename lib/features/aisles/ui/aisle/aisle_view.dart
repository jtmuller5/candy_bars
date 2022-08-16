import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:candy_bars/features/aisles/ui/aisle/aisle_view_model.dart';
import 'package:candy_bars/features/bars/ui/newBar/new_bar_view.dart';
import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:candy_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AisleView extends StatelessWidget {
  const AisleView({Key? key, required this.aisle}) : super(key: key);

  final Aisle aisle;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AisleViewModel>.reactive(
      viewModelBuilder: () => AisleViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leading: CloseButton(
              color: Colors.black,
            ),
            title: Text(aisle.name ?? ''),
          ),
          extendBodyBehindAppBar: true,
          body: Background(
            child: SafeArea(
              child: Column(
                children: [Container()],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            heroTag: 'bar',
            onPressed: () {
              Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
                builder: (context) => NewBarView(aisle: aisle),
              ));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Text('Candy Bar'),
            icon: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
