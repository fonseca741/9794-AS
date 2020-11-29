import 'package:flutter/material.dart';
import 'package:projeto1/Models/devolucao.dart';
import 'package:projeto1/Views/ViewDevolEstab1.dart';
import 'package:projeto1/Views/ViewDevolEstab3.dart';
import 'package:projeto1/Views/ajuda_view.dart';
import 'package:projeto1/Views/chat_Dev1.dart';
import 'package:projeto1/Views/chat_Dev2.dart';
import 'package:projeto1/Views/chat_Dev3.dart';
import 'package:projeto1/Views/chat_view.dart';
import 'package:projeto1/Views/login_view.dart';
import 'package:projeto1/Views/pedido_list.dart';
import 'package:projeto1/Views/principal_view.dart';
import 'package:projeto1/Views/viewDevolucao.dart';
import 'package:projeto1/provider/pedido.dart';
import 'package:projeto1/provider/providerPedidos.dart';
import 'package:provider/provider.dart';

import 'Routes/app_Routes.dart';
import 'Views/ViewDevolEstab2.dart';
import 'Views/ViewHomeEstabelec.dart';

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
        ChangeNotifierProvider(
          create: (context) => ProviderPedidos(),
     ),
    ],
    child: MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
        
         primaryColor: Color(0xff1d3557),
        
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        //AppRoutes.HOME:(_) => PedidoLista(), 
        //AppRoutes.BE:(_) =>  ViewHomeEstabelec(),      
        AppRoutes.HOME:(_) => ViewLogin(),
        AppRoutes.BE:(_) => ViewHome(),
        AppRoutes.AJUDA:(_) => Ajuda(),
        AppRoutes.DEVOLUCAO:(_) => ViewDevolucao(),
        AppRoutes.CHAT:(_) => Chat(),
        AppRoutes.DEVEST1:(_) => ViewDevEst1(),
        AppRoutes.DEVEST2:(_) => ViewDevEst2(),
        AppRoutes.DEVEST3:(_) => ViewDevEst3(),
        AppRoutes.CHATDEV1:(_) => ChatDev1(),
        AppRoutes.CHATDEV2:(_) => ChatDev2(),
        AppRoutes.CHATDEV3:(_) => ChatDev3(),
      } ,
      
    ),
    );
  }
}
