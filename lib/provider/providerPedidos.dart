import 'package:flutter/material.dart';
import 'package:projeto1/Dummy_Pedido/dummy_pedidos.dart';
import 'package:projeto1/Models/pedidos.dart';


class ProviderPedidos with ChangeNotifier {
  Map<String, Pedidos> _items = {...PEDIDOS};
  List<Pedidos> get all {
    return [..._items.values];
  }

  Pedidos byIndex(int i) {
    return _items.values.elementAt(i);
  }

  int get count {
    return _items.length;
  }
}