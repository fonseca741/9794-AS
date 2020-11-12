import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/views/ListEstabelecimentos.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:iclothes/views/Home.dart';
import 'package:iclothes/views/CadastroEstabelecimentos.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          AppRoutes.HOME: (_) => Home(),
          AppRoutes.LIST_ESTABELECIMENTOS: (_) => ListEstabelecimentos(),
          AppRoutes.ESTABELECIMENTOS_FORMS: (_) => EstabelecimentoForms()
        },
      ),
    );
  }
}
