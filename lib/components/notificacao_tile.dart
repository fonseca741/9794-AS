import 'package:flutter/material.dart';
import 'package:manter_produto/models/Notificacao.dart';

class NotificacaoTile extends StatelessWidget {
  final Notificacao notificacao;
  const NotificacaoTile(this.notificacao);
  @override
  Widget build(BuildContext context) {
    if(notificacao.nome == 'Pedido confirmado'){
      return ListTile(
        leading: Icon(Icons.check_circle, size: 30, color: Colors.green),
        title: Text(notificacao.nome, style: TextStyle(fontSize: 18)),
        subtitle: Text(notificacao.tipo, style: TextStyle(fontSize: 14)),
        trailing: Container(
          width: 100,
        ),
      );
    }
    else{
      if(notificacao.nome == 'Pedido recusado'){
        return ListTile(
          leading: Icon(Icons.error, size: 30, color: Colors.red),
          title: Text(notificacao.nome, style: TextStyle(fontSize: 18)),
          subtitle: Text(notificacao.tipo, style: TextStyle(fontSize: 14)),
          trailing: Container(
            width: 100,
          ),
        );
      }
      else{
        return ListTile(
          leading: Icon(Icons.motorcycle, size: 30, color: Colors.black),
          title: Text(notificacao.nome, style: TextStyle(fontSize: 18)),
          subtitle: Text(notificacao.tipo, style: TextStyle(fontSize: 14)),
          trailing: Container(
            width: 100,
          ),
        );
      }
    }
  }
}