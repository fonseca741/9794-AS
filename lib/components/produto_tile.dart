import 'package:flutter/material.dart';
import 'package:manter_produto/models/Produto.dart';
import 'package:manter_produto/provider/produtos.dart';
import 'package:manter_produto/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ProdutoTile extends StatelessWidget {
  final Produto produto;
  const ProdutoTile(this.produto);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.image, size: 30),
      title: Text(produto.nome, style: TextStyle(fontSize: 18)),
      subtitle: Text(produto.categoria, style: TextStyle(fontSize: 14)),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget> [
            IconButton(
              icon: Icon(Icons.edit), color: Colors.blue, onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUTO_FORM,
                  arguments: produto,
                );
              }
            ),
            IconButton(
              icon: Icon(Icons.delete), color: Colors.red, onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Produto'),
                    content: Text('Tem certeza?'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        }, 
                      ),
                      FlatButton(
                        child: Text('Sim'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        }, 
                      ),
                    ],
                  )
                ).then((confirmed) {
                  if(confirmed){ 
                    Provider.of<Produtos>(context).remove(produto);
                  }
                });
              }
            )
          ]
        ),
      ),
    );
  }
}