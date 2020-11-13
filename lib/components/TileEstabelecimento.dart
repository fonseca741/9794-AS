import 'package:flutter/material.dart';
import 'package:iclothes/models/estabelecimento.dart';
import 'package:iclothes/routes/app_routes.dart';

class TileEstabelecimento extends StatelessWidget {
  final Estabelecimento estabelecimento;

  const TileEstabelecimento(this.estabelecimento);

  @override
  Widget build(BuildContext context) {
    final fotoEstab = CircleAvatar(
      child: Icon(
        Icons.shopping_cart,
        color: Colors.white,
      ),
      backgroundColor: Color(0xff457b9d),
    );
    return ListTile(
      leading: fotoEstab,
      title: Text(
        estabelecimento.nome,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        estabelecimento.endereco,
        style: TextStyle(fontSize: 14),
      ),
      trailing: Icon(
        Icons.info_outline_rounded,
        size: 30,
      ),
      onTap: () => {Navigator.of(context).pushNamed(AppRoutes.FAQ)},
    );
  }
}
