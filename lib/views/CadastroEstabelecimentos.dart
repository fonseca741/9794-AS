import 'dart:ui';
import 'package:iclothes/routes/app_routes.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:iclothes/models/estabelecimento.dart';

class ViewCadastroEstabelecimento extends StatefulWidget {
  @override
  _ViewCadastroEstabelecimentoState createState() =>
      _ViewCadastroEstabelecimentoState();
}

class _ViewCadastroEstabelecimentoState
    extends State<ViewCadastroEstabelecimento> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void loadFormData(Estabelecimento estab) {
    if (estab != null) {
      _formData['id'] = estab.id;
      _formData['nome'] = estab.nome;
      _formData['desc'] = estab.descricao;
      _formData['urlFoto'] = estab.urlFoto;
      _formData['tel'] = estab.telefone;
      _formData['end'] = estab.endereco;
      _formData['email'] = estab.email;
      _formData['senha'] = estab.senha;
      _formData['cnpj'] = estab.cnpj;
      _formData['categ'] = estab.categorias;
      _formData['regra'] = estab.regraEstabelecimento;
    }
  }

  void continuar() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      Estabelecimento estab = Estabelecimento(
        id: _formData['id'],
        nome: _formData['nome'],
        descricao: _formData['desc'],
        urlFoto: '',
        telefone: _formData['tel'],
        endereco: _formData['end'],
        email: _formData['email'],
        senha: _formData['senha'],
        cnpj: _formData['cnpj'],
        categorias: [''],
        regraEstabelecimento: '',
      );
      Navigator.of(context).pushNamed(
          AppRoutes.CADASTRO_ESTABELECIMENTO_ADICIONAL,
          arguments: estab);
    }
  }

  var _maskCNPJ = MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {'#': RegExp(r'[0-9]')});
  var _maskTelefone = MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {'#': RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cadastro de Estabelecimento',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
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
                    child: CircleAvatar(
                      radius: 48.0,
                      backgroundColor: Colors.grey[200],
                      child: IconButton(
                        iconSize: 64,
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                      ),
                    )),
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
                    initialValue: _formData['desc'],
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        labelText: 'Descrição do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return 'Insira uma descrição para o Estabelecimento';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['desc'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    inputFormatters: [_maskCNPJ],
                    initialValue: _formData['cnpj'],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'CNPJ do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.length < 18) {
                        return 'Insira um CNPJ válido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _formData['cnpj'] = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    inputFormatters: [_maskTelefone],
                    initialValue: _formData['tel'],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Telefone do Estabelecimento',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                    validator: (value) {
                      if (value.trim().length < 15) {
                        return 'Insira um telefone válido';
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
                      'Próximo',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.white,
                    color: Color.fromRGBO(95, 140, 245, 1),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => continuar(),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
