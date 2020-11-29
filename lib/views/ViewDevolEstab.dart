import 'package:flutter/material.dart';
import 'package:manter_produto/routes/app_routes.dart';

class ViewDevolEstab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Devolução de produto', style: TextStyle(fontSize: 22)),
        ),
        body: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Marcos de Oliveira', style: TextStyle(fontSize: 18)),
              subtitle: Text('Ver detalhes', style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () {Navigator.of(context).pushNamed(AppRoutes.DEVEST1);},
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                size: 35,
                color: Colors.blueGrey,
              ),
              title: Text('Pedro da Silva', style: TextStyle(fontSize: 18)),
              subtitle: Text('Ver detalhes',
                  style: TextStyle(fontSize: 16)),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: () => {Navigator.of(context).pushNamed(AppRoutes.DEVEST2)}
            ),
            ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Colors.blueGrey,
                ),
                title: Text('Maria Santos', style: TextStyle(fontSize: 18)),
                subtitle: Text('Ver detalhes',
                    style: TextStyle(fontSize: 16)),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {Navigator.of(context).pushNamed(AppRoutes.DEVEST3);}
                ),
          ],
        ));
  }
}