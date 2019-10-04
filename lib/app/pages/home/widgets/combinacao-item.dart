import 'package:dodvision/app/shared/models/combinacao.dart';
import 'package:flutter/material.dart';

import 'alimento-item.dart';

class CombinacaoItem extends StatelessWidget {
  final Color color;
  final Combinacao combinacao;

  const CombinacaoItem({this.color, this.combinacao});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 0.5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(width: 5),
                AlimentoItem(alimento: combinacao.alimentoA),
                SizedBox(width: 5),
                AlimentoItem(alimento: combinacao.alimentoB),
                SizedBox(width: 5),
                AlimentoItem(alimento: combinacao.alimentoC),
                SizedBox(width: 5),
              ],
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: -3,
          child: Row(
            children: <Widget>[
              RotationTransition(
                turns: AlwaysStoppedAnimation(-45 / 360),
                child: Container(
                  child: Text(
                    "${combinacao.totalCaloria.toString()} calorias",
                    style: TextStyle(fontSize: 11),
                  ),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}