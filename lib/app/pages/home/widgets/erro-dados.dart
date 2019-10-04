import 'package:flutter/material.dart';

class ErroDados extends StatelessWidget {
  final bool semCombinacao;

  const ErroDados({Key key, @required this.semCombinacao}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        semCombinacao
            ? "Não há combinações"
            : "Insira uma meta para gerar combinaçöes",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}