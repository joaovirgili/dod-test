class Grupo {
  String nome;
  int idGrupo;

  Grupo({
    this.nome,
    this.idGrupo,
  });

  factory Grupo.fromJson(Map<String, dynamic> json) => Grupo(
        nome: json["nome"],
        idGrupo: json["id_grupo"],
      );

  Map<String, dynamic> toJson() => {
        "nome": nome,
        "id_grupo": idGrupo,
      };
}
