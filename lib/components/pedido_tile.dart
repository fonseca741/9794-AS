import 'package:flutter/material.dart';
import 'package:projeto1/Models/pedido.dart';

class PedidoTile extends StatelessWidget{
  final Pedido pedido;

  const PedidoTile(this.pedido);  

  @override
  Widget build(BuildContext context){
    return ListTile(
      leading: Text(pedido.produtoCompra),
      title: Text(pedido.valorProduto),
      subtitle: Text(pedido.estabelecimentoCompra),
      trailing: Container (
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit), 
              color: Colors.green[100],
              onPressed: () {},
              ),
            IconButton(
              icon: Icon(Icons.delete), 
              color: Colors.red,
              onPressed: () {},
              ),

          ],
        ),
      )
    );
  }
}