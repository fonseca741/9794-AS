import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';
import 'package:iClothes/Views/cadastroUsuario.dart';
import 'package:iClothes/Views/homeEstabelecimento.dart';
import 'Views/faq.dart';
import 'Views/infoPessoais.dart';
import 'Views/sac.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'iClothes',
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          AppRoutes.INFO_PESSOAIS: (_) => ViewInfoPessoais(),
          AppRoutes.FAQ: (_) => ViewFaq(),
          AppRoutes.SAC: (_) => ViewSac(),
          AppRoutes.CADASTRO_USUARIO: (_) => ViewCadastroUsuario(),
          AppRoutes.HOME_ESTABELECIMENTO: (_) => ViewHomeEstabelecimento(),
        });
  }
}
