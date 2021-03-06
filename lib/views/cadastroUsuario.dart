import 'package:flutter/material.dart';
import 'package:iclothes/models/usuario.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastroUsuario extends StatelessWidget {
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorEmail = TextEditingController();
  final TextEditingController _controladorTel = TextEditingController();
  final TextEditingController _controladorCpf = TextEditingController();
  final TextEditingController _controladorEnd = TextEditingController();
  final TextEditingController _controladorSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastro de Usuário',
          style: TextStyle(fontSize: 22),
        ),
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
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorTel,
                decoration: InputDecoration(
                    labelText: 'Telefone',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
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
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
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
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
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
                color: Color(0xff1d3557),
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

                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Bem Vindo!",
                    desc: "Conta criada com sucesso.",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => {
                          Navigator.pop(context),
                          Navigator.of(context)
                              .pushReplacementNamed(AppRoutes.LOGIN)
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                  print(usuarioNovo);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
