import 'package:flutter/material.dart';
import 'package:iClothes/Models/usuario.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastroUsuario extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

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
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  initialValue: _formData['nome'],
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Nome',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'O campo nome é obrigatorio';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['nome'] = value;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['email'],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'E-mail',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'O campo email é obrigatorio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['email'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['tel'],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Telefone',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'O campo telefone é obrigatorio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['tel'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['cpf'],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'CPF',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'O campo CPF é obrigatorio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['cpf'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['senha'],
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Senha',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'O campo senha é obrigatorio';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['senha'] = value;
                    },
                  ),
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
                      if (_form.currentState.validate()) {
                        Usuario(
                          //instanciação do novo usuário para futuras operações
                          _formData['nome'],
                          _formData['email'],
                          _formData['tel'],
                          _formData['cpf'],
                          _formData['senha'],
                        );
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Bem Vindo!",
                          desc: "Conta criada com sucesso.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "OK",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => {
                                Navigator.pop(context),
                                // Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN)
                              },
                              width: 120,
                            )
                          ],
                        ).show();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
