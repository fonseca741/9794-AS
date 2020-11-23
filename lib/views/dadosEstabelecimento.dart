import 'package:flutter/material.dart';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'cadastroEstabelecimentosAdicional.dart';

class ViewDadosEstabelecimento extends StatefulWidget {
  @override
  _ViewDadosEstabelecimentoState createState() =>
      _ViewDadosEstabelecimentoState();
}

class _ViewDadosEstabelecimentoState extends State<ViewDadosEstabelecimento> {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};
  bool _editEmail = true;
  bool _editTel = true;
  bool _editEnd = true;

  List<Categoria> _categoriasSelecionadas = [
    Categoria(nome: 'Roupa'),
    Categoria(nome: 'Sapato')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dados do Estabelecimento',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 10),
                    child: Center(
                      child: Text(
                        'Informações Gerais',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff1d3557),
                  ),
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
                  Padding(padding: EdgeInsets.all(8)),
                  TextFormField(
                    initialValue: 'Brechó do Zé',
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFormField(
                    initialValue: 'Descrição do Estabelecimento',
                    decoration: InputDecoration(
                        labelText: 'Descrição',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: FlutterTagging<Categoria>(
                        initialItems: _categoriasSelecionadas,
                        textFieldConfiguration: TextFieldConfiguration(
                          decoration: InputDecoration(
                              labelText:
                                  'Categorias dos produtos do Estabelecimento',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                        ),
                        findSuggestions: CategoriaServices.getCategorias,
                        configureSuggestion: (value) {
                          return SuggestionConfiguration(
                            title: Text(value.nome),
                          );
                        },
                        configureChip: (value) {
                          return ChipConfiguration(
                              label: Text(value.nome),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Theme.of(context).primaryColor,
                              deleteIconColor: Colors.white);
                        },
                      )),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          initialValue: 'nomeEstabelecimento@estab.com',
                          readOnly: _editEmail,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'É obrigatório inserir uma conta de email.';
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.blueGrey,
                        onPressed: () => {
                          setState(() {
                            _editEmail = false;
                          })
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          initialValue: '(44) 99702-9547',
                          readOnly: _editTel,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Telefone',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                          validator: (value) {
                            if (value.trim().isEmpty) {
                              return 'É obrigatório inserir um telefone.';
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.blueGrey,
                        onPressed: () => {
                          setState(() {
                            _editTel = false;
                          })
                        },
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              initialValue: 'Avenida Brasil, 3093',
                              readOnly: _editEnd,
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
                          IconButton(
                            icon: Icon(Icons.edit),
                            color: Colors.blueGrey,
                            onPressed: () => {
                              setState(() {
                                _editEnd = false;
                              })
                            },
                          ),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      child: Text(
                        'Salvar',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Color(0xff1d3557),
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      onPressed: () {
                        if (_form.currentState.validate()) {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Dados alterados com sucesso!",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => {
                                  Navigator.pop(context),
                                },
                                width: 120,
                              )
                            ],
                          ).show();
                          setState(() {
                            _editEmail = true;
                            _editTel = true;
                          });
                        } else {
                          Alert(
                            context: context,
                            type: AlertType.error,
                            title: "Preencha os campos corretamente!",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () => {
                                  Navigator.pop(context),
                                },
                                width: 120,
                              )
                            ],
                          ).show();
                        }
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Divider(
                    color: Color(0xff1d3557),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Center(
                      child: Text(
                    'Credenciais',
                    style: TextStyle(fontSize: 22),
                  )),
                  Padding(padding: EdgeInsets.all(5)),
                  Divider(
                    color: Color(0xff1d3557),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: TextFormField(
                          initialValue: 'abcd1234',
                          obscureText: true,
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: 'Senha',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        color: Colors.blueGrey,
                        onPressed: () => {
                          Navigator.of(context)
                              .pushNamed(AppRoutes.ALTERAR_SENHA),
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    initialValue: '11.111.111/6666-22',
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'CNPJ',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                  ),
                  Padding(padding: EdgeInsets.all(16)),
                  RaisedButton(
                    child: Text(
                      'Excluir Conta',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () => {
                      // Navigator.of(context)
                      //     .pushReplacementNamed(AppRoutes.EXCLUIR_CONTA),
                    },
                  )
                ],
              ),
            )));
  }
}
