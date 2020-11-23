import 'package:iClothes/Models/cartao.dart';
import 'package:iClothes/Models/endereco.dart';

import 'cliente.dart';

class Usuario extends Cliente {
  final String cpf;
  final List<Cartao> cartoes = new List();
  final List<Endereco> enderecos = new List();

  Usuario(String nome, String email, String telefone, String senha, this.cpf)
      : super(nome, email, telefone, senha);

  // Usuario(this.nome, this.email, this.telefone, this.cpf, this.senha);

  @override
  String toString() {
    return 'Usuario{nome: $nome\nEmail: $email\nTelefone: $telefone}';
  }
}
