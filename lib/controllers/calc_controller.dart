import 'package:calculadora_f/grid_botoes.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends ChangeNotifier {
  String display = '0';
  String temp = '';
  String operation = '';
  bool replaceOp = false;
  bool primeiroClique = true;
  double resultado = 0.0;
  bool podePorPonto = true;
  RegExp operacoes = RegExp(r'[+\-/*]$');

  void onButtonClick(ButtonClick click) {
    if (click is NumberButtonClick) {
      temp = click.valor;
      if (click.valor == '.') {
        if (!podePorPonto) {
          temp = '';
        }
        podePorPonto = false;
      }
      if (primeiroClique) {
        display = '';
        primeiroClique = false;
        if (click.valor == '0' || click.valor == '00') {
          temp = '0';
          primeiroClique = true;
        }
      }
      display += temp;
      temp = '';
      replaceOp = false;
      display = tratarDisplay(display);
    } else if (click is OperationButtonClick) {
      if (operacoes.hasMatch(display[display.length - 1])) {
        display = display.substring(0, display.length - 1);
        display += click.valor;
      } else {
        display += click.valor;
      }
      primeiroClique = false;
      podePorPonto = true;
    } else if (click is ClearButtonClick) {
      display = '0';
      temp = '';
      operation = '';
      replaceOp = false;
      primeiroClique = true;
      podePorPonto = true;
    } else if (click is BackButtonClick) {
      if (display.length > 0 && display != '0') {
        if (operacoes.hasMatch(display[display.length - 1])) {
          replaceOp = false;
          podePorPonto = false;
        }
        if (display[display.length - 1] == '.') {
          podePorPonto = true;
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
      if (operacoes.hasMatch(display[display.length - 1])) {
        display = display.substring(0, display.length - 1);
      }
      try {
        final Parser p = Parser();
        Expression exp = p.parse(display);
        resultado = exp.evaluate(EvaluationType.REAL, ContextModel());
        display = resultado.toString();
        display = tratarDisplay(display);
        display = verificaPontoNoDisplay(display);
      } catch (err) {
        display = 'error';
        primeiroClique = true;
      } finally {
        temp = '';
        replaceOp = false;
        resultado = 0;
        primeiroClique = true;
        podePorPonto = true;
      }
    }
    notifyListeners();
  }
}

String verificaPontoNoDisplay(String display) {
  if (display.endsWith('.')) {
    display = display.substring(0, display.length - 1);
  } else if (display.endsWith('.0')) {
    display = display.substring(0, display.length - 2);
  }
  return display;
}

String tratarDisplay(String display) {
  if (display.length > 12) {
    display = display.substring(0, 12);
  }

  return display;
}

bool testaOperacao(String display, int inicio) {
  display = display.substring(inicio, display.length);
  if (display.contains('+') ||
      display.contains('-') ||
      display.contains('*') ||
      display.contains('/') ||
      display.contains('%')) {
    return true;
  } else {
    return false;
  }
}

bool verificarPonto(String display, int inicio) {
  String displayParcial = display.substring(inicio, display.length);
  if (displayParcial.contains('.'))
    return true;
  else
    return false;
}
