import 'package:estagio_projeto/routes.dart';
import 'package:estagio_projeto/screens/home/home.dart';
import 'package:estagio_projeto/screens/login/pageLogin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        // Verifica se estamos na rota inicial
        if (settings.name == Routes.home) {
          // Remove todas as telas anteriores da pilha e vai para a tela home
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.home, (route) => false);
          });
        }
        // Chama o método generateRoute da sua classe Routes
        return Routes.generateRoute(settings);
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
