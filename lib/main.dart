import 'package:flutter/material.dart';
import 'package:projeto1/Views/ajuda_view.dart';
import 'package:projeto1/Views/chat_view.dart';
import 'package:projeto1/Views/pedido_list.dart';
import 'package:projeto1/provider/pedido.dart';
import 'package:provider/provider.dart';

import 'Routes/app_Routes.dart';

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
        
         primaryColor: Color(0xff1d3557),
        
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        AppRoutes.HOME:(_) => Ajuda(),

      } ,
      
    ),
    );
  }
}
