import 'package:flutter/material.dart';
import 'package:iClothes/Models/endereco.dart';

class TileEndereco extends StatelessWidget {
  final Endereco endereco;

  const TileEndereco(this.endereco);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.edit_location,
        size: 30,
        color: Colors.blueGrey,
      ),
      title: Text(
        endereco.apelido,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Text(
        endereco.rua + ' ' + endereco.numero,
        style: TextStyle(fontSize: 18),
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          size: 25,
          color: Colors.red,
        ),
      ),
    );
  }
}
