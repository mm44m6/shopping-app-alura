import 'dart:convert';

class Movel {
  String titulo;
  String preco;
  String foto;
  String descricao;

  Movel({this.titulo, this.preco, this.foto, this.descricao});

  factory Movel.fromJson(Map<String, dynamic> json) {
    if (json == null)
      return null;

    return Movel(
      titulo: json['titulo'] as String,
      preco: json['preco'] as String,
      foto: json['foto'] as String,
      descricao: json['descricao'] as String
    );
  }

  List<dynamic> parseMovel(String jsonStr) {
    final parsed = json.decode(jsonStr);
    return parsed;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['preco'] = this.preco;
    data['foto'] = this.foto;
    data['descricao'] = this.descricao;
    return data;
  }
}