import 'package:flutter/material.dart';

class Notificacao{
  final String id;
  final String nome;
  final String tipo;

  const Notificacao({
    this.id,
    @required this.nome,
    this.tipo,
  });
}