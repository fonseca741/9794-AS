import 'package:flutter/material.dart';

class Produto{
  final String id;
  final String nome;
  final String categoria;
  final String preco;
  final String descricao;
  final String tamanhos;
  final String foto;

  const Produto({
    this.id,
    @required this.nome,
    @required this.categoria,
    @required this.preco,
    @required this.descricao,
    @required this.tamanhos,
    @required this.foto,
  });

  //@override
  //String toString(){
    //return 'Produto{Nome: $nome\nCategoria: $categoria\nPreço: $preco\nDescrição: $descricao\nTamanhos: $tamanhos\nFotos: $foto}';
  //}
}