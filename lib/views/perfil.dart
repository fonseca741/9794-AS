import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';

class ViewPerfil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Perfil',
        ),
      ),
      body: ListTile(
        leading: Icon(
          Icons.help,
          size: 40,
        ),
        title: Text('Ajuda'),
        subtitle: Text('Acesse ajuda'),
        trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.FAQ)}),
      ),
    );
  }
}
