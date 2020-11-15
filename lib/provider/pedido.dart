import 'package:flutter/cupertino.dart';
import 'package:projeto1/Dummy_Pedido/Dummy_pedido.dart';
import 'package:projeto1/Models/pedido.dart';
import 'package:flutter/material.dart';

class Pedidos with ChangeNotifier{
  Map<String , Pedido> _items = {...Dummy_Pedido};
  List<Pedido> get al{
    return [... _items.values];
  }
  int get count{
    return _items.length;
  }
}