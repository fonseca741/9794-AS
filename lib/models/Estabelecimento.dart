import 'package:iclothes/models/cliente.dart';

class Estabelecimento extends Cliente {
  final String id;
  final String descricao;
  final String urlFoto;
  final String endereco;
  final String cnpj;
  final List<String> categorias;
  final String regraEstabelecimento;

  Estabelecimento(
      String nome,
      String email,
      String telefone,
      String senha,
      this.id,
      this.descricao,
      this.urlFoto,
      this.endereco,
      this.cnpj,
      this.categorias,
      this.regraEstabelecimento)
      : super(nome, email, telefone, senha);
}
