import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iclothes/views/ListEstabelecimentos.dart';
import 'package:iclothes/views/CadastroEstabelecimentos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    ListEstabelecimentos(),
    EstabelecimentoForms()
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
