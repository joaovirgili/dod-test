
import 'package:flutter/material.dart';

class LegendaItem extends StatelessWidget {

  final String texto;
  final Color cor;

  const LegendaItem({
    @required this.texto,
    @required this.cor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 2),
          width: 10,
          height: 10,
          color: cor,
        ),
        Text(texto)
      ],
    );
  }
}