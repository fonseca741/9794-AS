import 'package:flutter/material.dart';
import 'package:manter_produto/provider/notificacoes.dart';
import 'package:manter_produto/provider/pedidos.dart';
import 'package:manter_produto/routes/app_routes.dart';
import 'package:manter_produto/provider/produtos.dart';  
import 'package:manter_produto/views/ViewCadastrarProduto.dart';
import 'package:manter_produto/views/ViewDetalheNotificacao.dart';
import 'package:manter_produto/views/ViewDetalheNotificacao2.dart';
import 'package:manter_produto/views/ViewDetalheNotificacao3.dart';
import 'package:manter_produto/views/ViewDevEst1.dart';
import 'package:manter_produto/views/ViewDevEst2.dart';
import 'package:manter_produto/views/ViewDevEst3.dart';
import 'package:manter_produto/views/ViewDevolucao.dart';
import 'package:manter_produto/views/ViewHome.dart';
import 'package:manter_produto/views/ViewHomeEstabelec.dart';
import 'package:manter_produto/views/ViewLogin.dart';
import 'package:manter_produto/views/ViewNotificacoes.dart';
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
          create: (ctx) => ProviderPedidos(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Notificacoes(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Produtos(),
        ),
      ],
      child: MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: { 
          AppRoutes.HOME: (_) => ViewLogin(),
          //AppRoutes.BARRA: (_) => ViewHome(),
          AppRoutes.BARRA: (_) => ViewHomeEstabelec(),
          AppRoutes.PRODUTO_FORM: (_) => ViewCadastrarProduto(),
          AppRoutes.DETALHES_NOTI: (_) => ViewDetalheNotificacao(),
          AppRoutes.DETALHES_NOTI2: (_) => ViewDetalheNotificacao2(),
          AppRoutes.DETALHES_NOTI3: (_) => ViewDetalheNotificacao3(),
          AppRoutes.NOTI: (_) => ViewNotificacoes(),
          AppRoutes.DEVOLUCAO: (_) => ViewDevolucao(),
          AppRoutes.DEVEST1: (_) => ViewDevEst1(),
          AppRoutes.DEVEST2: (_) => ViewDevEst2(),
          AppRoutes.DEVEST3: (_) => ViewDevEst3(),
        },
      ),
    );
  }
}