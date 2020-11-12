import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:iclothes/data/dummy_estabelecimentos.dart';
import 'package:iclothes/models/Estabelecimento.dart';

class ProviderEstabelecimentos with ChangeNotifier {
  Map<String, Estabelecimento> _items = {...ESTABELECIMENTOS};

  List<Estabelecimento> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Estabelecimento byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Estabelecimento estab) {
    if (estab == null) {
      return;
    }

    if (estab.id != null &&
        estab.id.isNotEmpty &&
        _items.containsKey(estab.id)) {
      _items.update((estab.id), (_) => estab);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Estabelecimento(
            id: id,
            nome: estab.nome,
            telefone: estab.telefone,
            endereco: estab.endereco,
            email: estab.email,
            senha: estab.senha),
      );
    }
    notifyListeners();
  }

  void remove(Estabelecimento estab) {
    if (estab != null && estab.id != null) {
      _items.remove(estab.id);
    }

    notifyListeners();
  }
}
