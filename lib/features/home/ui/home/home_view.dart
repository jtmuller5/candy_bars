import 'package:candy_bars/features/aisles/models/aisle.dart';
import 'package:candy_bars/features/aisles/ui/newAisle/new_aisle_view.dart';
import 'package:candy_bars/features/aisles/ui/widgets/aisle_tile.dart';
import 'package:candy_bars/features/authentication/ui/signIn/sign_in_view.dart';
import 'package:candy_bars/features/authentication/ui/splash/splash_view.dart';
import 'package:candy_bars/features/bars/ui/newBar/new_bar_view.dart';
import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:candy_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          drawer: Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Sign Out'),
                  onTap: () async {
                    await model.signOut();

                    await Navigator.of(navigatorKey.currentContext!).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SignInView()),
                      (route) => false,
                    );
                  },
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Background(
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Welcome to your shop!',
                        style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(child: FutureBuilder<PostgrestResponse<dynamic>>(
                    future: Supabase.instance.client.from('aisles').select('*').execute(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {

                        debugPrint('Aisles: + ${snapshot.data?.data}');

                        List<Aisle> aisles = snapshot.data!.data!.map<Aisle>((e) => Aisle.fromJson(e)).toList();

                        return ListView.builder(
                          padding: EdgeInsets.all(16),
                            itemCount: aisles.length,
                            itemBuilder: (context, index) {
                              Aisle aisle = aisles[index];

                              return AisleTile(aisle: aisle);
                            });
                      } else {
                        return Container();
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
          floatingActionButton: SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton.extended(
                  heroTag: 'aisle',
                  onPressed: () {
                    Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(builder: (context) => NewAisleView()));
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  label: Text('Aisle'),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
