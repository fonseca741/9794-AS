import 'package:flutter/material.dart';
import 'package:manter_produto/models/Notificacao.dart';
import 'package:manter_produto/routes/app_routes.dart';

class NotificacaoTile extends StatelessWidget {
  final Notificacao notificacao;
  const NotificacaoTile(this.notificacao);
  @override
  Widget build(BuildContext context) {
    if(notificacao.nome == 'Pedido confirmado'){
      return ListTile(
        leading: Icon(Icons.check_circle, size: 30, color: Colors.green),
        title: Text(notificacao.nome, style: TextStyle(fontSize: 18)),
        subtitle: Text('Ver detalhes do pedido', style: TextStyle(fontSize: 14)),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 20,
        ),
        onTap: () => {
          Navigator.of(context).pushNamed(
            AppRoutes.DETALHES_NOTI,
          )
        },
      );
    }
    else{
      if(notificacao.nome == 'Pedido recusado'){
        return ListTile(
          leading: Icon(Icons.error, size: 30, color: Colors.red),
          title: Text('Pedido recusado', style: TextStyle(fontSize: 18)),
          subtitle: Text('Ver detalhes do pedido', style: TextStyle(fontSize: 14)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onTap: () => {
            Navigator.of(context).pushNamed(
              AppRoutes.DETALHES_NOTI2,
            )
          },
        );
      }
      else{
        return ListTile(
          leading: Icon(Icons.motorcycle, size: 30, color: Colors.black),
          title: Text('Pedido despachado', style: TextStyle(fontSize: 18)),
          subtitle: Text('Ver detalhes do pedido', style: TextStyle(fontSize: 14)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
          ),
          onTap: () => {
            Navigator.of(context).pushNamed(
              AppRoutes.DETALHES_NOTI3,
            )
          },
        );
      }
    }
  }
}