import 'package:flutter/material.dart';
import 'package:iClothes/Models/cartao.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastroCartao extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastrar Cartão',
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
                initialValue: _formData['numero'],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Número do cartão',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['numero'] = value;
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['validade'],
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: 'Validade',
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20)))),
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _formData['validade'] = value;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['cvv'],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'CVV',
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20)))),
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Campo obrigatório';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _formData['cvv'] = value;
                      },
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextFormField(
                initialValue: _formData['titular'],
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    labelText: 'Nome do títular',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['titular'] = value;
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextFormField(
                initialValue: _formData['cpf'],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'CPF',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Este campo não pode ser vazio';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['cpf'] = value;
                },
              ),
              Padding(padding: EdgeInsets.all(155)),
              RaisedButton(
                child: Text(
                  'Cadastrar Cartão',
                  style: TextStyle(fontSize: 20),
                ),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () => {
                  if (_form.currentState.validate())
                    {
                      Cartao(
                        //instanciação do novo cartão para futuras operações
                        _formData['numero'],
                        _formData['titular'],
                        _formData['validade'],
                        _formData['cvv'],
                        _formData['cpf'],
                      ),
                      Alert(
                        context: context,
                        type: AlertType.success,
                        title: "Cartão cadastrado com sucesso!",
                        buttons: [
                          DialogButton(
                            child: Text(
                              "OK",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () => {
                              Navigator.pop(context),
                              // Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN)
                            },
                            width: 120,
                          )
                        ],
                      ).show(),
                    }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
