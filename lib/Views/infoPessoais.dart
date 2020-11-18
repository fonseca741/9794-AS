import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';

class ViewInfoPessoais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Informações Pessoais', style: TextStyle(fontSize: 22)),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Perfil', style: TextStyle(fontSize: 18)),
              subtitle: Text('Meus Dados', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () => {Navigator.of(context).pushNamed(AppRoutes.PERFIL)},
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Notificações', style: TextStyle(fontSize: 18)),
              subtitle: Text('Minha central de notificações',
                  style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
              leading: Icon(
                Icons.credit_card,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Cartões', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Gerencie seus cartões', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
              leading: Icon(
                Icons.edit_location,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Endereços', style: TextStyle(fontSize: 18)),
              subtitle: Text('Meus endereços de entrega',
                  style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              // onTap: () => {}
            ),
            ListTile(
              leading: Icon(
                Icons.chat_outlined,
                size: 35,
                color: Colors.blueGrey,
              ),
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
                leading: Icon(
                  Icons.help,
                  size: 35,
                  color: Colors.blueGrey,
                ),
                title: Text('Ajuda', style: TextStyle(fontSize: 18)),
                subtitle: Text('Acesse ajuda', style: TextStyle(fontSize: 16)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () => {Navigator.of(context).pushNamed(AppRoutes.FAQ)}),
            ListTile(
              leading: Icon(
                Icons.logout,
                size: 35,
                color: Colors.red.shade400,
              ),
              title: Text('Sair', style: TextStyle(fontSize: 18)),
              subtitle:
                  Text('Deslogar de sua conta', style: TextStyle(fontSize: 16)),
              // onTap: () => {}
            ),
          ],
        ));
  }
}
