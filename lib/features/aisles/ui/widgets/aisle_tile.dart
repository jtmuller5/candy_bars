import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:candy_bars/features/aisles/ui/aisle/aisle_view.dart';
import 'package:flutter/material.dart';

class AisleTile extends StatelessWidget {
  const AisleTile({Key? key, required this.aisle}) : super(key: key);

  final Aisle aisle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AisleView(aisle: aisle)));
          },
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: Colors.deepOrange,
                          width: 2),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              (aisle.number ?? '6').toString(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(aisle.name ?? ''),
                    ),
                  ],
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('test'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
