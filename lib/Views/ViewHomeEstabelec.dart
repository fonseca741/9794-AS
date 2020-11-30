import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projeto1/Views/ViewDevolEstab.dart';

import 'ajuda_view.dart';

class ViewHomeEstabelec extends StatefulWidget {
  @override
  _ViewHomeState createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHomeEstabelec> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    Ajuda(),
    
    ViewDevolEstab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.barcode,
            ),
            label: 'Produto',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.exchangeAlt,
            ),
            label: 'Devolução',
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