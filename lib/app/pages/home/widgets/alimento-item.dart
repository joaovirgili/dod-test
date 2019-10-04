import 'package:dodvision/app/shared/models/alimento.dart';
import 'package:flutter/material.dart';

class AlimentoItem extends StatelessWidget {
  final Alimento alimento;

  const AlimentoItem({@required this.alimento});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.black, width: 0.5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(alimento.nome),
            Text(alimento.grupo.nome),
            Text("${alimento.calorias} calorias"),
          ],
        ),
      ),
    );
  }
}