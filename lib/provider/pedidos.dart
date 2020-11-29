import 'package:flutter/material.dart';
import 'package:manter_produto/data/dummy_pedidos.dart';
import 'package:manter_produto/models/Pedido.dart';

class ProviderPedidos with ChangeNotifier {
  Map<String, Pedido> _items = {...PEDIDOS};
  List<Pedido> get all {
    return [..._items.values];
  }

  Pedido byIndex(int i) {
    return _items.values.elementAt(i);
  }

  int get count {
    return _items.length;
  }
}
