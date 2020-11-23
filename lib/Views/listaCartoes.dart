import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';
import 'package:iClothes/Components/tileCartao.dart';
import 'package:iClothes/Provider/providerCartao.dart';
import 'package:provider/provider.dart';

class ViewListaCartoes extends StatefulWidget {
  @override
  _ViewListaCartoesState createState() => _ViewListaCartoesState();
}

class _ViewListaCartoesState extends State<ViewListaCartoes> {
  @override
  Widget build(BuildContext context) {
    final ProviderCartao cartoes = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meus cartões',
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CADASTRO_CARTAO);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cartoes.count,
        itemBuilder: (ctx, i) => TileCartao(cartoes.byIndex(i)),
      ),
    );
  }
}
