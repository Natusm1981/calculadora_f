import 'package:flutter/material.dart';

class TelaDisplay extends StatelessWidget {
  final String valor;
  const TelaDisplay({required this.valor, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        valor,
        style: Theme.of(context).textTheme.displayLarge,
      ),
    );
  }
}
