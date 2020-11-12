import 'package:flutter/material.dart';
import 'package:flutter_iclothes/components/TileEstabelecimento.dart';
import 'package:flutter_iclothes/provider/providerEstabelecimentos.dart';
import 'package:flutter_iclothes/routes/app_routes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ListEstabelecimentos extends StatelessWidget {
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Lojas',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.ticketAlt),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Perfil',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffe63946),
        unselectedItemColor: Color(0xff457b9d),
        showUnselectedLabels: true,
        //onTap: _onItemTapped,
      ),
    );
  }
}
