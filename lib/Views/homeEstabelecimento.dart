import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';

class ViewHomeEstabelecimento extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text('Gerenciar Estabelecimento', style: TextStyle(fontSize: 22)),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              title: Text('Perfil', style: TextStyle(fontSize: 18)),
              subtitle: Text('Dados do Estabelecimento',
                  style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
            ),
            ListTile(
              title: Text('Produtos', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Gerenciar produtos', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
              title: Text('Pedidos', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Gerenciar Pedidos', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
              title: Text('Chat', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Minhas conversas.', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
                title: Text('Relatórios', style: TextStyle(fontSize: 18)),
                subtitle: Text('Acesso à relatório de vendas',
                    style: TextStyle(fontSize: 16)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () => {
                      Navigator.of(context).pushNamed(AppRoutes.GERAR_RELATORIO)
                    }),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 35,
                color: Colors.red.shade400,
              ),
              title: Text('Sair', style: TextStyle(fontSize: 18)),
              subtitle: Text('Deslogar da conta Estabelecimento',
                  style: TextStyle(fontSize: 16)),
              // onTap: () => {}
            ),
          ],
        ));
  }
}
