import 'package:flutter/material.dart';

import '../home_bloc.dart';

class ErroServidor extends StatelessWidget {
  const ErroServidor({
    Key key,
    @required this.bloc,
  }) : super(key: key);

  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Erro ao efetuar busca no servidor.",
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.refresh),
            onPressed: this.bloc.getAlimentos,
          )
        ],
      ),
    );
  }
}