import 'package:flutter/material.dart';
import 'package:projeto1/Views/pedido_list.dart';
import 'package:projeto1/provider/pedido.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pedidos(),
     ),
    ],
    child: MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
        
         primarySwatch: Colors.blue,
        
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PedidoLista(),
    ),
    );
  }
}
