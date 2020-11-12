import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/components/TileEstabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';

class ListEstabelecimentos extends StatefulWidget {
  @override
  _ListEstabelecimentosState createState() => _ListEstabelecimentosState();
}

class _ListEstabelecimentosState extends State<ListEstabelecimentos> {
  @override
  Widget build(BuildContext context) {
    final ProviderEstabelecimentos estabelecimentos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Estabelecimentos',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.ESTABELECIMENTOS_FORMS);
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: estabelecimentos.count,
          itemBuilder: (ctx, i) =>
              TileEstabelecimento(estabelecimentos.byIndex(i))),
    );
  }
}
