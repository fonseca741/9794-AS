import 'package:flutter/material.dart';

class Estabelecimento {
  final String id;
  final String nome;
  final String telefone;
  final String endereco;
  final String email;
  final String senha;

  const Estabelecimento({
    this.id,
    @required this.nome,
    @required this.telefone,
    @required this.endereco,
    @required this.email,
    @required this.senha,
  });
}
