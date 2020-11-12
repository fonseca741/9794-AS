import 'package:flutter/material.dart';
import 'package:iclothes/models/Estabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:provider/provider.dart';

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
      title: Text(estabelecimento.nome),
      subtitle: Text(estabelecimento.endereco),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.ESTABELECIMENTOS_FORMS,
                  arguments: estabelecimento,
                );
              },
              color: Colors.lightBlue,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Excluir Estabelecimento'),
                    content: Text('Você deseja excluir este estabelecimento?'),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: Text('Não')),
                      FlatButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: Text('Sim')),
                    ],
                  ),
                ).then((value) {
                  if (value) {
                    Provider.of<ProviderEstabelecimentos>(context,
                            listen: false)
                        .remove(estabelecimento);
                  }
                });
              },
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
