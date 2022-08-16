import 'package:flutter/material.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: ColoredBox(
        color: Colors.lightBlue.withOpacity(.5),
        child: Center(child: CircularProgressIndicator())));
  }
}
