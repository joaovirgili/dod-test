import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dodvision/app/shared/models/alimento.dart';
import 'package:dodvision/app/shared/models/combinacao.dart';
import 'package:dodvision/app/shared/repositories/alimentos_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:trotter/trotter.dart';

class HomeBloc extends BlocBase {
  AlimentosRepository alimentosRep;

  var combinacoesMeta$ = BehaviorSubject<List<Combinacao>>.seeded(null);
  var alimentos$ = BehaviorSubject<List<Alimento>>.seeded(null);
  var loading$ = BehaviorSubject<bool>.seeded(true);
  var erro$ = BehaviorSubject<bool>.seeded(null);

  Observable<Map<String, dynamic>> combinacoesContent$;

  List<Combinacao> todasCombinacoes;

  HomeBloc(this.alimentosRep) {
    this.combinacoesContent$ = Observable.combineLatest2(
        combinacoesMeta$, erro$, ((combinacoes, erro) {
      return {"combinacoes": combinacoes, "erro": erro};
    }));

    this.getAlimentos();
  }

  getAlimentos() {
    alimentosRep.getAlimentos().then((alimentos) {
      alimentos$.sink.add(alimentos);
      loading$.sink.add(false);

      if (alimentos != null && alimentos.length > 0) {
        this.todasCombinacoes = this.montaCombinacoes(alimentos.toList());
        this.erro$.sink.add(false);
      } else {
        this.erro$.sink.add(true);
      }
    });
  }

  buttonPressed(int metaCalorica) {
    var metasBatidas = this
        .todasCombinacoes
        .where((combinacao) => combinacao.totalCaloria >= metaCalorica)
        .map((combinacao) =>
            this.defineStatusCombinacao(combinacao, metaCalorica))
        .toList();
    metasBatidas.sort((a, b) => a.totalCaloria < b.totalCaloria ? -1 : 1);

    this.combinacoesMeta$.sink.add(metasBatidas);
  }

  Combinacao defineStatusCombinacao(Combinacao combinacao, int metaCalorica) {
    if (combinacao.totalCaloria == metaCalorica) {
      combinacao.status = CombinacaoStatus.Igual;
    } else if (combinacao.totalCaloria >=
        metaCalorica + combinacao.totalCaloria * 0.2) {
      combinacao.status = CombinacaoStatus.MuitoAcima;
    } else {
      combinacao.status = CombinacaoStatus.Acima;
    }
    return combinacao;
  }

  /// Monta as combinações de alimentos sem repetir o grupo.
  /// Primeiro é mapeada a lista apra id do alimento, pois o [Combinations] retorna combinação de [Object] mesmo sendo feita em cima de [Alimento].
  /// Com o tipo [Object], não era possível acessar as propriedades de [Alimento].
  /// Com o idAlimento, tenho como buscar este alimento na lista de alimentos novamente.
  /// Então a combinação é mapeada para ser agora combinação de [Alimento].
  montaCombinacoes(List<Alimento> alimentos) {
    List<int> bagOfItems =
        alimentos.map((alimento) => alimento.idAlimento).toList();

    var combos = Combinations(3, bagOfItems)().toList();

    return combos
        .map((combo) => this.transformaEmAlimento(combo, alimentos))
        .where((combo) => this.grupoNaoRepetido(combo))
        .map((combo) => Combinacao(
              alimentoA: combo[0],
              alimentoB: combo[1],
              alimentoC: combo[2],
              totalCaloria:
                  combo[0].calorias + combo[1].calorias + combo[2].calorias,
            ))
        .toList();
  }

  List<Alimento> transformaEmAlimento(
      List<Object> combo, List<Alimento> alimentos) {
    return combo.map((id) {
      return alimentos[
          alimentos.indexWhere((alimento) => alimento.idAlimento == id)];
    }).toList();
  }

  bool grupoNaoRepetido(List<Alimento> combo) {
    return combo[0].idGrupo != combo[1].idGrupo &&
        combo[0].idGrupo != combo[2].idGrupo &&
        combo[1].idGrupo != combo[2].idGrupo;
  }

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    combinacoesMeta$.close();
    alimentos$.close();
    loading$.close();
    erro$.close();
    super.dispose();
  }
}
