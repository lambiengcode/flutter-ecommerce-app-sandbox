import 'package:flutter/material.dart';
import 'package:now/src/pages/auth/login_page.dart';
import 'package:now/src/pages/auth/signup_page.dart';

class AuthenticatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AuthenticatePageState();
}

class _AuthenticatePageState extends State<AuthenticatePage> {
  bool showSignIn = true;

  @override
  void initState() {
    super.initState();
  }

  switchScreen() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showSignIn
        ? LoginPage(
            toggleView: switchScreen,
          )
        : SignupPage(
            toggleView: switchScreen,
          );
  }
}
