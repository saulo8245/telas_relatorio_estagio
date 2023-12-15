import 'package:flutter/material.dart';
import 'screens/home/home.dart';
import 'screens/login/pageLogin.dart';
import 'screens/promocoes/promocoesScreen.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String promocoes = '/promocoes';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => Home());
      case login:
        return MaterialPageRoute(builder: (_) => PageLogin());
      case promocoes:
        return MaterialPageRoute(builder: (_) => PromocoesScreen());
      default:
        return MaterialPageRoute(builder: (_) => Home());
    }
  }
}
