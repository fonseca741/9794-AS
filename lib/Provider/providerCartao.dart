import 'package:flutter/material.dart';
import 'package:iClothes/Models/cartao.dart';
import 'package:iClothes/Data/dummy_cartao.dart';

class ProviderCartao with ChangeNotifier {
  Map<String, Cartao> _itens = {...CARTOES};

  List<Cartao> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Cartao byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Cartao cartao) {
    if (cartao == null) {
      return;
    }
    _itens.putIfAbsent(
      null,
      () => Cartao(cartao.numero, cartao.titular, cartao.validade, cartao.cvv,
          cartao.cpf),
    );
    notifyListeners();
  }

  void remove(Cartao cartao) {
    if (cartao != null) {
      _itens.remove(cartao);
    }
    notifyListeners();
  }
}
