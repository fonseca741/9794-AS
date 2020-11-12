import 'package:flutter/material.dart';
import 'package:iclothes/models/Estabelecimento.dart';
import 'package:iclothes/provider/providerEstabelecimentos.dart';
import 'package:provider/provider.dart';

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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.white,
            ),
            onPressed: () {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();
                Provider.of<ProviderEstabelecimentos>(context, listen: false)
                    .put(
                  Estabelecimento(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    telefone: _formData['tel'],
                    endereco: _formData['end'],
                    email: _formData['email'],
                    senha: _formData['senha'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                keyboardType: TextInputType.name,
                decoration:
                    InputDecoration(labelText: 'Nome do Estabelecimento'),
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
              TextFormField(
                initialValue: _formData['tel'],
                keyboardType: TextInputType.phone,
                decoration:
                    InputDecoration(labelText: 'Telefone do Estabelecimento'),
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
              TextFormField(
                initialValue: _formData['end'],
                keyboardType: TextInputType.streetAddress,
                decoration:
                    InputDecoration(labelText: 'Endereço do Estabelecimento'),
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
              TextFormField(
                initialValue: _formData['email'],
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Email para login'),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Insira um email para login';
                  } else if (!value.contains('@') || !value.endsWith('.com')) {
                    return 'Insira um email válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['email'] = value;
                },
              ),
              TextFormField(
                initialValue: _formData['senha'],
                decoration: InputDecoration(labelText: 'Senha para login'),
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
            ],
          ),
        ),
      ),
    );
  }
}
