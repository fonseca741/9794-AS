import 'package:flutter/material.dart';
import 'package:manter_produto/components/produto_tile.dart';
import 'package:manter_produto/provider/produtos.dart';
import 'package:manter_produto/routes/app_routes.dart';
import 'package:provider/provider.dart';

class ViewListProduto extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final Produtos produtos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos', style: TextStyle(fontSize: 22)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUTO_FORM
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: produtos.count,
        itemBuilder: (ctx, i) => ProdutoTile(produtos.byIndex(i)),
      )
    );
  }
}