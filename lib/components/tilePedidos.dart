import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iclothes/models/pedido.dart';
import 'package:iclothes/routes/app_routes.dart';

class TilePedido extends StatelessWidget {
  final Pedido pedido;

  static const _finalizado = ImageIcon(
    AssetImage('lib/assets/delivered.png'),
    size: 36,
    color: Colors.lightGreen,
  );
  static const _entrega = Icon(
    Icons.delivery_dining,
    color: Colors.blueGrey,
    size: 36,
  );
  static const _confirmado =
      FaIcon(FontAwesomeIcons.checkCircle, color: Colors.green, size: 36);
  static const _cancelado =
      FaIcon(FontAwesomeIcons.timesCircle, color: Colors.red, size: 36);

  const TilePedido(this.pedido);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _entrega,
      title: Text(pedido.estabelecimentoCompra,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      subtitle: Text(pedido.dataCompra + ' - ' + pedido.valorPedido,
          style: TextStyle(fontSize: 18)),
      trailing: IconButton(
        icon: Icon(
          Icons.arrow_forward_ios,
          color: Colors.blueGrey,
        ),
        onPressed: () => {},
        //Juntar com a parte do Pedro
        //onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.PEDIDOS, arguments: pedido)},
      ),
    );
  }
}
