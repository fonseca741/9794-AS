import 'package:flutter/material.dart';

class Pedido {
  final String id;
  final String nomeUsuarios;
  final String produtoCompra;
  final String estabelecimentoCompra;
  final String valorProduto;
  final String formaEntrega;
  final String formaPagamento;
  final String dataCompra;
  
  const Pedido({
    this.id,
    @required this.nomeUsuarios,
    @required this.produtoCompra,
    @required this.estabelecimentoCompra,
    @required this.valorProduto,
    @required this.formaEntrega,
    @required this.formaPagamento,
    @required this.dataCompra, 
  });
}