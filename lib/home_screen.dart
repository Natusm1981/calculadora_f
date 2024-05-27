import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double resultado = 0;
  String display = '';
  String displayPequeno = '';
  bool primeiroClique = true;
  double altura = 50;
  double lagura = 50;

  void calcular(String tecla) {
    primeiroClique = false;
    switch (tecla) {
      case 'ac':
        {
          setState(() {
            display = '0';
          });
          primeiroClique = true;
        }
      case 'del':
        {
          setState(() {
            if (display[0] != '0' && display.length > 1)
              display = display.substring(0, display.length - 1);
            else
              display = '0';
          });
          break;
        }
      default:
        if (display[0] == '0' && tecla != '0') display = '';
        setState(() {
          display += tecla;
        });
        break;
    }
    displayPequeno = display;
  }

  @override
  Widget build(BuildContext context) {
    if (primeiroClique == true) display = '0';
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('CALCULADORA'),
        ),
      ),
      body: Container(
        color: Colors.lightBlue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  display,
                  style: TextStyle(fontSize: 70),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  displayPequeno,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('del');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        'Del',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('ac');
                    print('clicou AC');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('%');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '%',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('<');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '<',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('7');
                    print('clicou 7');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '7',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('8');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('9');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '9',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('x');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        'X',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('4');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '4',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('5');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('6');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '6',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('-');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '-',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    calcular('1');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '1',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('2');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '2',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('3');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '3',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('+');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: lagura,
                  height: altura,
                  child: Center(
                    child: Text(
                      ' ',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('0');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '0',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular(',');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        ',',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    calcular('=');
                  },
                  child: Container(
                    width: lagura,
                    height: altura,
                    child: Center(
                      child: Text(
                        '=',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
