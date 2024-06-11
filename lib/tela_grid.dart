import 'package:calculadora_f/controllers/calc_controller.dart';
import 'package:calculadora_f/grid_botoes.dart';
import 'package:calculadora_f/tela_display.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'env_var.dart';

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
    bandeira.load();
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
            flex: 20,
            child: TelaDisplay(valor: controller.display),
          ),
          Expanded(
            flex: 70,
            child: GridBotoes(
              onButtonClick: controller.onButtonClick,
            ),
          ),
          Expanded(
            flex: 15,
            child: Align(
              alignment: Alignment.center,
              child: SafeArea(
                child: SizedBox(
                  width: 320,
                  height: 50,
                  child: AdWidget(ad: bandeira),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

BannerAd bandeira = BannerAd(
  size: AdSize.banner,
  adUnitId: adUnitId,
  listener: BannerAdListener(
    onAdLoaded: (ad) {
      debugPrint('$ad carregado');
    },
    onAdFailedToLoad: (ad, error) {
      ad.dispose();
      debugPrint('$ad $error');
    },
  ),
  request: const AdRequest(),
);
