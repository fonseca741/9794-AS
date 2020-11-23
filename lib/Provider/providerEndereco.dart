import 'package:flutter/material.dart';
import 'package:iClothes/Models/endereco.dart';
import 'package:iClothes/Data/dummy_endereco.dart';

class ProviderEndereco with ChangeNotifier {
  Map<String, Endereco> _itens = {...ENDERECOS};

  List<Endereco> get all {
    return [..._itens.values];
  }

  int get count {
    return _itens.length;
  }

  Endereco byIndex(int i) {
    return _itens.values.elementAt(i);
  }

  void put(Endereco endereco) {
    if (endereco == null) {
      return;
    }
    _itens.putIfAbsent(
        null,
        () => Endereco(endereco.apelido, endereco.rua, endereco.numero,
            endereco.complemento, endereco.cidade, endereco.uf));
    notifyListeners();
  }

  void remove(Endereco endereco) {
    if (endereco != null) {
      _itens.remove(endereco);
    }
    notifyListeners();
  }
}
