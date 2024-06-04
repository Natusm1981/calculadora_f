import 'package:calculadora_f/grid_botoes.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalcController extends ChangeNotifier {
  String display = '0';
  String temp = '';
  String operation = '';
  String displayTemp = '';
  bool replaceOp = false;
  bool primeiroClique = true;
  num resultado = 0.0;
  bool verificaPonto = true;
  //bool deuResultado = false;

  void onButtonClick(ButtonClick click) {
    if (click is NumberButtonClick) {
      if (primeiroClique) {
        display = '';
        primeiroClique = false;
      }
      temp += click.valor;
      if (display.contains('.') == true &&
          click.valor == '.' &&
          verificaPonto) {
        temp = '';
      }
      display += temp;
      temp = '';
      replaceOp = false;
    } else if (click is OperationButtonClick) {
      if (replaceOp) {
        display = display.substring(0, display.length - 1);
        display += click.valor;
      } else {
        display += click.valor;
        replaceOp = true;
      }
      temp = '';
      primeiroClique = false;
      verificaPonto = true;
      print(click.valor);
    } else if (click is ClearButtonClick) {
      display = '0';
      temp = '';
      operation = '';
      displayTemp = '';
      replaceOp = false;
      primeiroClique = true;
    } else if (click is BackButtonClick) {
      if (display.length > 0 && display != '0') {
        if (testaOperacao(display.length - 1)) {
          verificaPonto = true;
        }
        display = display.substring(0, display.length - 1);
        temp = '';
        if (display.isEmpty) {
          display = '0';
        }
      } else {
        display = '0';
      }
    } else if (click is EqualsButtonClick) {
      try {
        resultado = display.interpret();
        if (testaOperacao(display[display.length - 1])) {
          throw Exception('erro de lógica');
        }
        display = resultado.toString();
        print(display);
        display = tratarDisplay(display, click.valor);
        temp = '';
        replaceOp = false;
        resultado = 0;
        verificaPonto = true;
        primeiroClique = true;
      } catch (err) {
        display = 'error';
        print(err);
      }
    }
    notifyListeners();
  }
}

String tratarDisplay(String display, String valor) {
  if (display.endsWith('.')) {
    display = display.substring(0, display.length - 1);
  } else if (display.endsWith('.0')) {
    display = display.substring(0, display.length - 2);
  }
  if (display.length > 13) {
    display = display.substring(0, 12);
    display = display.interpret().toString();
  }

  return display;
}

bool testaOperacao(op) {
  if (op[op.length - 1] == '+' ||
      op[op.length - 1] == '-' ||
      op[op.length - 1] == '*' ||
      op[op.length - 1] == '/' ||
      op[op.length - 1] == '%') {
    return true;
  } else {
    return false;
  }
}


// class EqualsButtonClick extends ButtonClick {
//   EqualsButtonClick({required super.valor});
// }