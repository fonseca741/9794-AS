import 'package:flutter/material.dart';
import 'package:iclothes/models/pedido.dart';
import 'package:iclothes/routes/app_routes.dart';

class TilePedidoEstab extends StatelessWidget {
  final int index;
  final Pedido pedido;

  const TilePedidoEstab(this.pedido, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Pedido #' + pedido.id,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      subtitle: Text(pedido.dataCompra + ' - ' + pedido.valorPedido,
          style: TextStyle(fontSize: 18)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.blueGrey,
      ),
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.GERENCIAR_PEDIDO, arguments: pedido);
      },
    );
  }
}
