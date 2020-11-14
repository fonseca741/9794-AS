import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manter_produto/data/dummy_produtos.dart';
import 'package:manter_produto/models/Produto.dart';

class Produtos with ChangeNotifier{
  final Map<String, Produto> _items = {...DUMMY_PRODUTOS};

  List<Produto> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Produto byIndex(int i){
    return _items.values.elementAt(i);
  }

  void put(Produto produto){
    if(produto == null){
      return;
    }

    if(produto.id != null && 
      produto.id.trim().isNotEmpty && 
      _items.containsKey(produto.id)){
      _items.update(produto.id, (_) => Produto(
        id: produto.id,
        nome: produto.nome,
        categoria: produto.categoria,
        preco: produto.preco,
        descricao: produto.descricao,
        tamanhos: produto.tamanhos,
        foto: produto.foto,
      ));
    }
    else{
      final id = Random().nextDouble().toString();
    _items.putIfAbsent(id, () => Produto(
      id: id,
      nome: produto.nome,
      categoria: produto.categoria,
      preco: produto.preco,
      descricao: produto.descricao,
      tamanhos: produto.tamanhos,
      foto: produto.foto
    ));
    }    

    notifyListeners();
  }
  void remove(Produto produto){
    if(produto != null && produto.id != null){
      _items.remove(produto.id); 
    }
    notifyListeners();
  }    
}