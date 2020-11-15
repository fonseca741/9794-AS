import 'package:flutter/material.dart';
import 'package:manter_produto/components/notificacao_tile.dart';
import 'package:manter_produto/provider/notificacoes.dart';
import 'package:provider/provider.dart';

class ViewNotificacoes extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final Notificacoes notificacoes = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notificações',
        style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
       body: ListView.builder(
        itemCount: notificacoes.count,
        itemBuilder: (ctx, i) => NotificacaoTile(notificacoes.byIndex(i)),
      )
    );
  }  
}