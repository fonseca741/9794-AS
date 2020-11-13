import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/components/TileEstabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';

class ViewListEstabelecimento extends StatefulWidget {
  @override
  _ViewListEstabelecimentoState createState() =>
      _ViewListEstabelecimentoState();
}

class _ViewListEstabelecimentoState extends State<ViewListEstabelecimento> {
  @override
  Widget build(BuildContext context) {
    final ProviderEstabelecimentos estabelecimentos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Estabelecimentos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
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
