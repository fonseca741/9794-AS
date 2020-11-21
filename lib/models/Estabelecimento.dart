import 'package:flutter/material.dart';

class Estabelecimento {
  final String id;
  final String nome;
  final String descricao;
  final String urlFoto;
  final String telefone;
  final String endereco;
  final String email;
  final String senha;
  final String cnpj;
  final List<String> categorias;
  final String regraEstabelecimento;

  const Estabelecimento({
    this.id,
    @required this.nome,
    @required this.descricao,
    @required this.urlFoto,
    @required this.telefone,
    @required this.endereco,
    @required this.email,
    @required this.senha,
    @required this.cnpj,
    @required this.categorias,
    @required this.regraEstabelecimento,
  });

  String getInfo() {
    String retorno = this.nome;
    this.categorias.forEach((element) {
      retorno += ' - ' + element;
    });
    retorno += ' - ' + this.cnpj;
    return retorno;
  }
}
