import 'alimento.dart';

class Combinacao {
  Alimento alimentoA;
  Alimento alimentoB;
  Alimento alimentoC;
  int totalCaloria;
  CombinacaoStatus status;
  

  Combinacao({
    this.alimentoA,
    this.alimentoB,
    this.alimentoC,
    this.totalCaloria,
  });

  factory Combinacao.fromJson(Map<String, dynamic> json) => Combinacao(
        alimentoA: json["nome"],
        alimentoB: json["alimentoB"],
        alimentoC: json["alimentoC"],
        totalCaloria: json["totalCaloria"]
      );

  Map<String, dynamic> toJson() => {
        "alimentoA": alimentoA,
        "alimentoB": alimentoB,
        "alimentoC": alimentoC,
        "totalCaloria": totalCaloria,
      };
}

enum CombinacaoStatus {
  Igual, 
  Acima,
  MuitoAcima,
}
