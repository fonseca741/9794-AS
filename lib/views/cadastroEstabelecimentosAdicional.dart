import 'dart:ui';
import 'package:flutter_tagging/flutter_tagging.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:iclothes/models/estabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastroEstabelecimentoAdicional extends StatefulWidget {
  @override
  _ViewCadastroEstabelecimentoAdicionalState createState() =>
      _ViewCadastroEstabelecimentoAdicionalState();
}

class _ViewCadastroEstabelecimentoAdicionalState
    extends State<ViewCadastroEstabelecimentoAdicional> {
  final _form = GlobalKey<FormState>();
  List<Categoria> _categoriasSelecionadas = [];

  final Map<String, Object> _formData = {};

  void loadFormData(Estabelecimento estab) {
    if (estab != null) {
      _formData['id'] = '25';
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

  void cadastrar() {
    if (_form.currentState.validate()) {
      _form.currentState.save();
      List<String> categ = [];
      _categoriasSelecionadas.forEach((element) {
        categ.add(element.nome);
      });
      _formData['categ'] = categ;
      Estabelecimento estab = Estabelecimento(
        id: _formData['id'],
        nome: _formData['nome'],
        descricao: _formData['desc'],
        urlFoto: _formData['urlFoto'],
        telefone: _formData['tel'],
        endereco: _formData['end'],
        email: _formData['email'],
        senha: _formData['senha'],
        cnpj: _formData['cnpj'],
        categorias: _formData['categ'],
        regraEstabelecimento: _formData['regra'],
      );
      Provider.of<ProviderEstabelecimentos>(context, listen: false).put(estab);
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
              Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN),
              print(estab.getInfo())
            },
            width: 120,
          )
        ],
      ).show();
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
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(padding: EdgeInsets.all(16), children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: FlutterTagging<Categoria>(
              initialItems: _categoriasSelecionadas,
              textFieldConfiguration: TextFieldConfiguration(
                decoration: InputDecoration(
                    labelText: 'Categorias dos produtos do Estabelecimento',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
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
        Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      labelText: 'Regras do Estabelecimento (Devolução)',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Insira as regras do Estabelecimento';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['regra'] = value;
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
                  onPressed: () => cadastrar(),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class CategoriaServices {
  static Future<List<Categoria>> getCategorias(String query) async {
    await Future.delayed(Duration(milliseconds: 200), null);
    return <Categoria>[
      Categoria(
        nome: 'Roupa',
      ),
      Categoria(nome: 'Social'),
      Categoria(nome: 'Sapato'),
      Categoria(nome: 'Cosmético'),
      Categoria(nome: 'Bolsa'),
      Categoria(nome: 'Acessório'),
    ]
        .where((element) =>
            element.nome.toLowerCase().contains((query.toLowerCase())))
        .toList();
  }
}

class Categoria extends Taggable {
  final String nome;

  Categoria({
    this.nome,
  });

  @override
  List<Object> get props => [nome];
}
