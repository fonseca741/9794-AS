class Usuario {
  final String nome;
  final String email;
  final String telefone;
  final String cpf;
  final String endereco;
  final String senha;

  Usuario(this.nome, this.email, this.telefone, this.cpf, this.endereco,
      this.senha);

  @override
  String toString() {
    return 'Usuario{nome: $nome\nEmail: $email\nTelefone: $telefone}';
  }
}
