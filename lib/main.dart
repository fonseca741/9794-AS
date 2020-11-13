import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/views/listEstabelecimentos.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:iclothes/views/home.dart';
import 'package:iclothes/views/cadastroEstabelecimentos.dart';
import 'package:iclothes/views/login.dart';
import 'package:iclothes/views/cadastroUsuario.dart';
import 'package:iclothes/views/faq.dart';
import 'package:iclothes/views/perfil.dart';
import 'package:provider/provider.dart';

import 'views/sac.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderEstabelecimentos(),
        )
      ],
      child: MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.LOGIN: (_) => ViewLogin(),
          AppRoutes.HOME: (_) => ViewHome(),
          AppRoutes.LIST_ESTABELECIMENTOS: (_) => ViewListEstabelecimento(),
          AppRoutes.ESTABELECIMENTOS_FORMS: (_) =>
              ViewCadastroEstabelecimento(),
          AppRoutes.PERFIL: (_) => ViewPerfil(),
          AppRoutes.FAQ: (_) => ViewFaq(),
          AppRoutes.SAC: (_) => ViewSac(),
          AppRoutes.CADASTRO_USUARIO: (_) => ViewCadastroUsuario(),
        },
      ),
    );
  }
}
