import 'package:candy_bars/features/shared/ui/background.dart';
import 'package:candy_bars/features/shared/ui/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import './sign_in_view_model.dart';

class SignInView extends HookWidget {
  SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = useTextEditingController();
    final TextEditingController passwordController = useTextEditingController();

    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: Stack(
            children: [
              Background(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(label: Text('Email')),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(label: Text('Password ')),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () async {
                            
                            await model.signUp(
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          child: Text('Sign In'))
                    ],
                  ),
                ),
              ),
              if (model.isBusy) LoadingOverlay(),
            ],
          ),
        );
      },
    );
  }
}
