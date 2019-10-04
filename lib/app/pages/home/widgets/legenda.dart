import 'package:flutter/material.dart';

import 'legenda-item.dart';

class Legenda extends StatelessWidget {
  const Legenda({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        LegendaItem(
          texto: "Caloria total igual a meta",
          cor: Colors.green,
        ),
        LegendaItem(
          texto: "Caloria total até 20% acima da meta",
          cor: Colors.yellow,
        ),
        LegendaItem(
          texto: "Caloria total mais de 20% acima da meta",
          cor: Colors.red,
        ),
      ],
    );
  }
}