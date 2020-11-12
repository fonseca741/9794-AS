import 'package:flutter/material.dart';

import '../Models/usuario.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTel = TextEditingController();
  final TextEditingController _controladorCpf = TextEditingController();
  final TextEditingController _controladorEnd = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cadastro de Usuário'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _controladorNome,
                decoration: InputDecoration(
                    labelText: 'Nome',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorEmail,
                  decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorTel,
                  decoration: InputDecoration(
                      labelText: 'Telefone',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorCpf,
                  decoration: InputDecoration(
                      labelText: 'CPF',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _controladorEnd,
                  decoration: InputDecoration(
                      labelText: 'Endereço',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                    obscureText: true,
                    controller: _controladorSenha,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20))))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: RaisedButton(
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Color.fromRGBO(95, 140, 245, 1),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    final String nome = _controladorNome.text;
                    final String email = _controladorEmail.text;
                    final String telefone = _controladorTel.text;
                    final String cpf = _controladorCpf.text;
                    final String endereco = _controladorEnd.text;
                    final String senha = _controladorSenha.text;

                    final Usuario usuarioNovo =
                        Usuario(nome, email, telefone, cpf, endereco, senha);

                    print(usuarioNovo);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
