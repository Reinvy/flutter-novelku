import 'package:flutter/material.dart';

import 'package:novelku/views/publish/publish_view.dart';

import 'package:novelku/views/auth/widgets/form_sign_in.dart';
import 'package:novelku/views/auth/widgets/form_sign_up.dart';
import 'package:novelku/view_models/auth_view_model.dart';

import 'package:provider/provider.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);
  static String routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var passwordController2 = TextEditingController();
    final authViewModel = Provider.of<AuthViewModel>(context);
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: authViewModel.isAuth
            ? const PublishView()
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  );
                },
                child: authViewModel.haveAccount
                    ? FormSignIn(
                        // key: ValueKey<bool>(authViewModel.haveAccount),
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        authViewModel: authViewModel)
                    : FormSignUp(
                        // key: ValueKey<bool>(authViewModel.haveAccount),
                        formKey: _formKey,
                        emailController: emailController,
                        passwordController: passwordController,
                        passwordController2: passwordController2,
                        authViewModel: authViewModel)),
      ),
    );
  }
}
