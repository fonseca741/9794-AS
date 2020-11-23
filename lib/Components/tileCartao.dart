import 'package:flutter/material.dart';
import 'package:iClothes/Models/cartao.dart';

class TileCartao extends StatelessWidget {
  final Cartao cartao;

  const TileCartao(this.cartao);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.credit_card,
        size: 35,
        color: Colors.blueGrey,
      ),
      title: Text(
        'Cartão de crédito',
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        '****.****.****.' + cartao.numero.substring(12),
        style: TextStyle(fontSize: 18),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
      ),
    );
  }
}
