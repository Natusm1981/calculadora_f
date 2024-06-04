import 'package:calculadora_f/grid_botoes.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class CalcController extends ChangeNotifier {
  String display = '0';
  String temp = '';
  String operation = '';
  //bool deuResultado = false;

  void onButtonClick(ButtonClick click) {
    if (click is NumberButtonClick) {
      temp = click.valor;
      if (display.contains('.') == true && click.valor == '.') {
        temp = '';
      }
      display += temp;
    } else if (click is ClearButtonClick) {
      display = '0';
    } else if (click is BackButtonClick) {
      if (display.length > 0 && display != '0') {
        if (display.isEmpty) {
          display = '0';
        }
      } else {
        display = '0';
      }
    } else if (click is EqualsButtonClick) {
      var temp = display.interpret();
      display = temp.toString();
      print(display);
      display = tratarDisplay(display, click.valor);
    }
    notifyListeners();
  }
}

String tratarDisplay(String display, String valor) {
  if (display.endsWith('.0')) {
    display = display.substring(0, display.length - 2);
  }
  return display;
}





// class EqualsButtonClick extends ButtonClick {
//   EqualsButtonClick({required super.valor});
// }