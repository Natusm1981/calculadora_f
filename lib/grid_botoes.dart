import 'package:flutter/material.dart';

class GridBotoes extends StatelessWidget {
  const GridBotoes({super.key, this.onButtonClick});

  final void Function(ButtonClick click)? onButtonClick;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: <Widget>[
        Botao(
          valor: 'C',
          onTap: (valor) => onButtonClick!(ClearButtonClick(valor: 'C')),
        ),
        Botao(
          valor: '%',
          onTap: (valor) => onButtonClick!(OperationButtonClick(valor: valor)),
        ),
        Botao(
            onTap: (valor) => onButtonClick!(BackButtonClick(valor: valor)),
            valor: '<<'),
        Botao(
            onTap: (valor) =>
                onButtonClick!(OperationButtonClick(valor: valor)),
            valor: '/'),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '7',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '8',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '9',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) =>
                onButtonClick!(OperationButtonClick(valor: valor)),
            valor: '*'),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '4',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '5',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '6',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) =>
                onButtonClick!(OperationButtonClick(valor: valor)),
            valor: '-'),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '1',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '2',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '3',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) =>
                onButtonClick!(OperationButtonClick(valor: valor)),
            valor: '+'),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '00',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '0',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(NumberButtonClick(valor: valor)),
            valor: '.',
            cor: Colors.deepPurple[300]),
        Botao(
            onTap: (valor) => onButtonClick!(EqualsButtonClick(valor: valor)),
            valor: '=',
            cor: Colors.amber[900]),
      ],
    );
  }
}

sealed class ButtonClick {
  final String valor;

  ButtonClick({required this.valor});
}

class NumberButtonClick extends ButtonClick {
  NumberButtonClick({required super.valor});
}

class ClearButtonClick extends ButtonClick {
  ClearButtonClick({required super.valor});
}

class EqualsButtonClick extends ButtonClick {
  EqualsButtonClick({required super.valor});
}

class BackButtonClick extends ButtonClick {
  BackButtonClick({required super.valor});
}

class OperationButtonClick extends ButtonClick {
  OperationButtonClick({required super.valor});
}

class Botao extends StatelessWidget {
  final Color? cor;
  final String valor;
  final void Function(String valor)? onTap;
  const Botao({super.key, this.cor, required this.valor, this.onTap});

  @override
  Widget build(BuildContext context) {
    final cor = this.cor ?? Theme.of(context).colorScheme.primaryContainer;
    return Material(
      color: cor,
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!(valor),
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Text(
              valor,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ),
      ),
    );
  }
}
