import 'package:flutter/material.dart';
import 'package:iclothes/models/Estabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class EstabelecimentoForms extends StatefulWidget {
  @override
  _EstabelecimentoFormsState createState() => _EstabelecimentoFormsState();
}

class _EstabelecimentoFormsState extends State<EstabelecimentoForms> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void loadFormData(Estabelecimento estab) {
    if (estab != null) {
      _formData['id'] = estab.id;
      _formData['nome'] = estab.nome;
      _formData['tel'] = estab.telefone;
      _formData['end'] = estab.endereco;
      _formData['email'] = estab.email;
      _formData['senha'] = estab.senha;
    }
  }

  void cadastrar() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      Provider.of<ProviderEstabelecimentos>(context, listen: false).put(
        Estabelecimento(
          id: _formData['id'],
          nome: _formData['nome'],
          telefone: _formData['tel'],
          endereco: _formData['end'],
          email: _formData['email'],
          senha: _formData['senha'],
        ),
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
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      Navigator.of(context).pop(); //Volta pro Login
    }
  }

  @override
  Widget build(BuildContext context) {
    final estab = ModalRoute.of(context).settings.arguments as Estabelecimento;
    loadFormData(estab);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastro de Estabelecimento',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['nome'],
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: 'Nome do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira o nome do Estabelecimento';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['nome'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['tel'],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Telefone do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira o telefone do Estabelecimento';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['tel'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['end'],
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        labelText: 'Endereço do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira o endereço do Estabelecimento';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['end'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['email'],
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email para login',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira um email para login';
                      } else if (!value.contains('@') ||
                          !value.endsWith('.com')) {
                        return 'Insira um email válido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['email'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['senha'],
                    decoration: InputDecoration(
                        labelText: 'Senha para login',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira uma senha para login';
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
                    color: Color.fromRGBO(95, 140, 245, 1),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
