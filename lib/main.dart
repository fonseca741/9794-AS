import 'package:flutter/material.dart';
import 'package:manter_produto/routes/app_routes.dart';
import 'package:manter_produto/provider/produtos.dart';   
import 'package:manter_produto/views/ViewCadastrarProduto.dart';
import 'package:manter_produto/views/ViewListProduto.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Produtos(),
        ),
      ],
      child: MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.HOME: (_) => ViewListProduto(),
          AppRoutes.PRODUTO_FORM: (_) => ViewCadastrarProduto()
        },
      ),
    );
  }
}