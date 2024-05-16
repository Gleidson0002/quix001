import 'package:flutter/material.dart';
import 'package:flutter_application_1/tela_inicial.dart';

void main() {
  runApp(Quizapp());
}

class Quizapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:TelaInicial(),
    );
  }
}
