import 'package:flutter/material.dart';
import 'package:manter_produto/models/Notificacao.dart';

class NotificacaoTile extends StatelessWidget {
  final Notificacao notificacao;
  const NotificacaoTile(this.notificacao);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notificacao.nome, style: TextStyle(fontSize: 18)),
      subtitle: Text(notificacao.tipo, style: TextStyle(fontSize: 14)),
      trailing: Container(
        width: 100,
      ),
    );
  }
}