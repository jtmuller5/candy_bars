import 'package:candy_bars/features/authentication/ui/signIn/sign_in_view.dart';
import 'package:candy_bars/features/authentication/ui/splash/splash_view_model.dart';
import 'package:candy_bars/features/home/ui/home/home_view.dart';
import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:candy_bars/main.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) async {
        Future<void> checkAuth() async {
          bool signedIn = await model.checkAuthState();

          if (signedIn) {
            await Navigator.of(navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
          } else {
            await Navigator.of(navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (context) => SignInView()));
          }
        }

        Supabase.instance.client.auth.onAuthStateChange((AuthChangeEvent event, session) async {
          debugPrint('Supabase Auth Event: ${event.toString()}');

          if (event == AuthChangeEvent.signedIn) {
            await Navigator.of(navigatorKey.currentContext!).pushReplacement(MaterialPageRoute(builder: (context) => HomeView()));
          }
        });

        await checkAuth();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Background(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
