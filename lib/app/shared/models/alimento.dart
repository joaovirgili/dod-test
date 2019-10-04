import 'grupo.dart';

class Alimento {
  String nome;
  int calorias;
  int idAlimento;
  int idGrupo;
  Grupo grupo;

  Alimento({
    this.nome,
    this.calorias,
    this.idAlimento,
    this.idGrupo,
    this.grupo,
  });

  factory Alimento.fromJson(Map<String, dynamic> json) => Alimento(
        nome: json["nome"],
        calorias: json["calorias"],
        idAlimento: json["id_alimento"],
        idGrupo: json["id_grupo"],
        grupo: Grupo.fromJson(json["grupo"]),
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "calorias": calorias,
        "id_alimento": idAlimento,
        "id_grupo": idGrupo,
        "grupo": grupo.toJson(),
      };
}
