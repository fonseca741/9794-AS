import 'package:flutter/material.dart';

class Pedido {
  final String id;
  final String nomeUsuario;
  final List<String> produtosCompra;
  final String estabelecimentoCompra;
  final String valorPedido;
  final String formaEntrega;
  final String formaPagamento;
  final String dataCompra;

  const Pedido({
    this.id,
    @required this.nomeUsuario,
    @required this.produtosCompra,
    @required this.estabelecimentoCompra,
    @required this.valorPedido,
    @required this.formaEntrega,
    @required this.formaPagamento,
    @required this.dataCompra,
  });
}
