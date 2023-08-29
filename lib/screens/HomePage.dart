import 'package:flutter/material.dart';
import 'package:cotacaomoeda/widgets/convercao.dart';

class HomePage extends StatelessWidget {
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Converção de moeda'),
      ),
      body: Center(
        child: Container(
          width: 500,
          child: Convercao(
              valor1: valor1
          ),
        ),
      ),
    );
  }
}
