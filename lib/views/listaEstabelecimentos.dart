import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/components/tileEstabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';

class ViewListaEstabelecimento extends StatefulWidget {
  @override
  _ViewListaEstabelecimentoState createState() =>
      _ViewListaEstabelecimentoState();
}

class _ViewListaEstabelecimentoState extends State<ViewListaEstabelecimento> {
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
              Navigator.of(context)
                  .pushNamed(AppRoutes.CADASTRO_ESTABELECIMENTO);
            },
          )
        ],
      ),
      body: ListView.separated(
          padding: EdgeInsets.only(left: 16, right: 16),
          separatorBuilder: (context, index) => Divider(
                color: Color(0xff1d3557),
              ),
          itemCount: estabelecimentos.count,
          itemBuilder: (ctx, i) =>
              TileEstabelecimento(estabelecimentos.byIndex(i))),
    );
  }
}
