import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iclothes/views/cadastroEstabelecimentos.dart';
import 'package:iclothes/views/listaEstabelecimentos.dart';
import 'package:iclothes/views/listaPedidos.dart';

class ViewHome extends StatefulWidget {
  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ViewListaEstabelecimento(),
    ViewListaPedidos()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
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
            icon: FaIcon(FontAwesomeIcons.clipboardList),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Color(0xffe63946),
        unselectedItemColor: Color(0xff457b9d),
        showUnselectedLabels: true,
        onTap: onTabTapped,
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
