import 'package:flutter/material.dart';
import 'package:iclothes/provider/providerPedidos.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:iclothes/views/alterarSenha.dart';
import 'package:iclothes/views/dadosEstabelecimento.dart';
import 'package:iclothes/views/gerenciarPedido.dart';
import 'package:iclothes/views/homeEstabelecimento.dart';
import 'package:iclothes/views/cadastroEstabelecimentos.dart';
import 'package:iclothes/views/cadastroEstabelecimentosAdicional.dart';
import 'package:iclothes/views/listaEstabelecimentos.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:iclothes/views/home.dart';
import 'package:iclothes/views/login.dart';
import 'package:iclothes/views/pedidosEstab.dart';
import 'package:provider/provider.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderPedidos(),
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
          AppRoutes.LIST_ESTABELECIMENTOS: (_) => ViewListaEstabelecimento(),
          AppRoutes.CADASTRO_ESTABELECIMENTO: (_) =>
              ViewCadastroEstabelecimento(),
          AppRoutes.CADASTRO_ESTABELECIMENTO_ADICIONAL: (_) =>
              ViewCadastroEstabelecimentoAdicional(),
          AppRoutes.HOME_ESTABELECIMENTO: (_) => ViewHomeEstabelecimento(),
          AppRoutes.DADOS_ESTABELECIMENTO: (_) => ViewDadosEstabelecimento(),
          AppRoutes.ALTERAR_SENHA: (_) => ViewAlterarSenha(),
          AppRoutes.PEDIDOS_ESTAB: (_) => ViewPedidosEstab(),
          AppRoutes.GERENCIAR_PEDIDO: (_) => ViewGerenciarPedido(),
        },
      ),
    );
  }
}
