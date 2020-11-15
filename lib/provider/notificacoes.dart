import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manter_produto/data/dummy_notificacoes.dart';
import 'package:manter_produto/models/Notificacao.dart';

class Notificacoes with ChangeNotifier{
  final Map<String, Notificacao> _items = {...DUMMY_NOTIFICACOES};

  List<Notificacao> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Notificacao byIndex(int i){
    return _items.values.elementAt(i);
  }   
}