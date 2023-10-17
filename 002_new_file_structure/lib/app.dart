import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'config/palette.dart';
import 'pages/home/home.dart';
import 'pages/splash/splash.dart';

class App extends StatelessWidget {
  // Create the initilization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final _navigatorKey = GlobalKey<NavigatorState>();

  App({Key key}) : super(key: key);

  NavigatorState get _navigator => _navigatorKey.currentState;

  void _navigateToRoute(Route route) {
    _navigator.pushAndRemoveUntil<void>(
      route,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        canvasColor: Palette.lightGrey,
        primaryColor: Palette.darkerGrey,
        buttonTheme: const ButtonThemeData(
          buttonColor: Palette.darkerGrey,
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: const ColorScheme.light(
          primary: Colors.black, //flat button text color
        ).copyWith(secondary: Palette.lightBlue),
      ),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            // Firebase check for errors
            if (snapshot.hasError) {
              //error
            }

            // Firebase initialized
            if (snapshot.connectionState == ConnectionState.done) {
              // Listen to user authentication state updates
              return const HomePage();
            }

            // Firebase loading
            return child;
          },
        );
      },
      onGenerateRoute: (_) => MaterialPageRoute<SplashPage>(
        builder: (context) {
          return const SplashPage();
        },
      ),
    );
  }
}
