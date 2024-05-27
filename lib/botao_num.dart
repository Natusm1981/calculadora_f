import 'package:flutter/material.dart';

class BotaoP extends StatefulWidget {
  final String txtBotao;
  const BotaoP(this.txtBotao, {super.key});

  @override
  State<BotaoP> createState() => _BotaoPState();
}

class _BotaoPState extends State<BotaoP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(
        child: Text(widget.txtBotao),
      ),
    );
  }
}
