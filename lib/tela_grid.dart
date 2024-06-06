import 'package:calculadora_f/controllers/calc_controller.dart';
import 'package:calculadora_f/grid_botoes.dart';
import 'package:calculadora_f/tela_display.dart';
import 'package:flutter/material.dart';

class TelaGrid extends StatefulWidget {
  const TelaGrid({super.key});

  @override
  State<TelaGrid> createState() => _TelaGridState();
}

class _TelaGridState extends State<TelaGrid> {
  final controller = CalcController();
  void _listener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    controller.addListener(_listener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.removeListener(_listener);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: TelaDisplay(valor: controller.display),
          ),
          Expanded(
            flex: 7,
            child: GridBotoes(
              onButtonClick: controller.onButtonClick,
            ),
          ),
          Expanded(
            flex: 1,
            child: Placeholder(), // Reservado para teste de AD
          ),
        ],
      ),
    );
  }
}
