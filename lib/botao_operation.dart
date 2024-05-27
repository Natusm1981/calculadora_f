import 'package:flutter/material.dart';

class Botao_operation extends StatefulWidget {
  final String operador;
  // final double operando;
  // final double resultado = 0;
  const Botao_operation(this.operador, {super.key});

  @override
  State<Botao_operation> createState() => _Botao_operationState();
}

class _Botao_operationState extends State<Botao_operation> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 121, 84, 30),
        ),
        onPressed: () {
          debugPrint('clicou operation');
        },
        child: Center(child: Text(widget.operador)),
      ),
    );
  }
}
