import 'package:candy_bars/features/authentication/ui/signIn/sign_in_view.dart';
import 'package:candy_bars/features/authentication/ui/splash/splash_view.dart';
import 'package:candy_bars/features/bars/ui/newBar/new_bar_view.dart';
import 'package:candy_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
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
          body: Center(
            child: Text('Welcome'),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(builder: (context) => NewBarView()));
            },
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Text('Bar'),
            icon: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
