import 'package:dodvision/app/pages/home/home_module.dart';
import 'package:dodvision/app/shared/models/combinacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_bloc.dart';
import 'widgets/combinacao-item.dart';
import 'widgets/erro-dados.dart';
import 'widgets/erro-servidor.dart';
import 'widgets/legenda.dart';
import 'widgets/loading.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc bloc;
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    this._textEditingController = TextEditingController();
    this.bloc = HomeModule.to.getBloc<HomeBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    this._textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Minha dieta")),
      body: StreamBuilder<bool>(
          stream: this.bloc.loading$.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data)
              return Loading();

            return Column(
              children: <Widget>[
                Flexible(flex: 2, child: buildFormSection(context)),
                Flexible(flex: 4, child: buildCombinacoesSection(context)),
              ],
            );
          }),
    );
  }

  Container buildCombinacoesSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          border: Border(top: BorderSide(width: 0.5))),
      child: StreamBuilder<Map<String, dynamic>>(
          // stream: this.bloc.combinacoesMeta$.stream,
          stream: this.bloc.combinacoesContent$,
          initialData: null,
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data["erro"] != null &&
                snapshot.data["erro"]) {
              return new ErroServidor(bloc: bloc);
            } else if (!snapshot.hasData ||
                snapshot.data["combinacoes"] == null ||
                snapshot.data["erro"] == null) {
              return new ErroDados(semCombinacao: false);
            } else if (snapshot.data["combinacoes"] != null && snapshot.data["combinacoes"].length == 0) {
              return new ErroDados(semCombinacao: true);
            }

            List<Combinacao> combinacoes = snapshot.data["combinacoes"];

            return ListView(
              children: combinacoes
                  .map((combinacao) => CombinacaoItem(
                        combinacao: combinacao,
                        color: combinacao.status == CombinacaoStatus.Igual
                            ? Colors.lightGreen
                            : combinacao.status == CombinacaoStatus.MuitoAcima
                                ? Colors.red
                                : Colors.yellow,
                      ))
                  .toList(),
            );
          }),
    );
  }

  Container buildFormSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 10),
          TextField(
            controller: _textEditingController,
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Entre com sua meta calórica",
              border: OutlineInputBorder(),
            ),
          ),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            color: Theme.of(context).accentColor,
            onPressed: () {
              this.bloc.buttonPressed(
                  int.parse(this._textEditingController.value.text));
            },
            child: Text(
              "Calcular combinações",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Legenda()
        ],
      ),
    );
  }
}




