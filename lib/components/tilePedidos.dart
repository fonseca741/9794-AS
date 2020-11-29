import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto1/Models/pedidos.dart';
import 'package:projeto1/Routes/app_Routes.dart';

class TilePedido extends StatelessWidget {
  final int index;
  final Pedidos pedidos;

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

  static const _icones = [_finalizado, _entrega, _confirmado, _cancelado];

  const TilePedido(this.pedidos, this.index);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: _icones[index],
      title: Text(pedidos.estabelecimentoCompra,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
      subtitle: Text(pedidos.dataCompra + ' - ' + pedidos.valorPedido,
          style: TextStyle(fontSize: 18)),
      trailing: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            color: Colors.blueGrey,
          ),
          onPressed: () => {
            Navigator.of(context).pushNamed(AppRoutes.DEVOLUCAO)
          }),
    );
  }
}