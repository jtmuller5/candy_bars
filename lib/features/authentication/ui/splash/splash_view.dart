import 'package:candy_bars/features/authentication/ui/signIn/sign_in_view.dart';
import 'package:candy_bars/features/authentication/ui/splash/splash_view_model.dart';
import 'package:candy_bars/features/home/ui/home/home_view.dart';
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

        Supabase.instance.client.auth.onAuthStateChange((AuthChangeEvent event, session) async {
          debugPrint('Supabase Auth Event: ${event.toString()}');

          if (event == AuthChangeEvent.signedIn) {
            await Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
          } else if (event == AuthChangeEvent.signedOut) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        });

        bool signedIn = await model.checkAuthState();

        if(signedIn){
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
        }else {
          await Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInView()));
        }
      },
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
