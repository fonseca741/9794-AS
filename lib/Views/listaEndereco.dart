import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';
import 'package:iClothes/Components/tileEndereco.dart';
import 'package:iClothes/Provider/providerEndereco.dart';
import 'package:provider/provider.dart';

class ViewListaEnderecos extends StatefulWidget {
  @override
  _ViewListaEnderecosState createState() => _ViewListaEnderecosState();
}

class _ViewListaEnderecosState extends State<ViewListaEnderecos> {
  @override
  Widget build(BuildContext context) {
    final ProviderEndereco enderecos = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Meus Endereços',
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CADASTRO_ENDERECO);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: enderecos.count,
        itemBuilder: (ctx, i) => TileEndereco(
          enderecos.byIndex((i)),
        ),
      ),
    );
  }
}
