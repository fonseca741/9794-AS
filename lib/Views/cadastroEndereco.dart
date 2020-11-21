import 'package:flutter/material.dart';
import 'package:iClothes/Models/endereco.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastroEndereco extends StatefulWidget {
  @override
  _ViewCadastroEnderecoState createState() => _ViewCadastroEnderecoState();
}

class _ViewCadastroEnderecoState extends State<ViewCadastroEndereco> {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};
  String _uf;
  List _controladorUf = [
    'AC',
    'AL',
    'AP',
    'AM',
    'BA',
    'CE',
    'DF',
    'ES',
    'GO',
    'MA',
    'MT',
    'MS',
    'MG',
    'PA',
    'PB',
    'PR',
    'PE',
    'PI',
    'RJ',
    'RN',
    'RS',
    'RO',
    'RR',
    'SC',
    'SP',
    'SE',
    'TO',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cadastrar Endereco',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Text(
                'Digite as informações referente\nao endereço que deseja cadastrar.',
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Divider(
                color: Color(0xff1d3557),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                initialValue: _formData['apelido'],
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Apelido do endereço',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Este campo é obrigatório';
                  }
                  return null;
                },
                onSaved: (value) {
                  _formData['apelido'] = value;
                },
              ),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _formData['cidade'],
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          labelText: 'Cidade',
                          border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(20)))),
                      validator: (value) {
                        if (value.trim().isEmpty) {
                          return 'Este campo é obrigatório';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _formData['cidade'] = value;
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: 100,
                    height: 58,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26, width: 1.5),
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20))),
                    child: DropdownButton(
                      hint: Text('(UF)'),
                      value: _uf,
                      iconSize: 45.0,
                      isExpanded: true,
                      onChanged: (value) {
                        setState(() {
                          _uf = value;
                        });
                      },
                      items: _controladorUf.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextFormField(
                  initialValue: _formData['rua'],
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                      labelText: 'Endereço',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _formData['rua'] = value;
                  }),
              Padding(padding: EdgeInsets.all(8)),
              Row(
                children: [
                  Expanded(
                      child: TextFormField(
                          initialValue: _formData['complemento'],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: 'Complemento\n(Opcional)',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                          onSaved: (value) {
                            _formData['complemento'] = value;
                          })),
                  Padding(padding: EdgeInsets.all(8)),
                  Expanded(
                    child: TextFormField(
                        initialValue: _formData['numero'],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Número',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)))),
                        validator: (value) {
                          if (value.trim().isEmpty) {
                            return 'Este campo é obrigatório';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _formData['numero'] = value;
                        }),
                  )
                ],
              ),
              Padding(padding: EdgeInsets.all(115)),
              RaisedButton(
                child: Text(
                  'Cadastrar Endereço',
                  style: TextStyle(fontSize: 18),
                ),
                textColor: Colors.white,
                color: Colors.green,
                padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (_form.currentState.validate() && _uf.length != 0) {
                    Endereco(
                      //instanciação do novo usuário para futuras operações
                      _formData['apelido'],
                      _formData['cidade'],
                      _formData['uf'],
                      _formData['rua'],
                      _formData['complemento'],
                      _formData['numero'],
                    );
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Endereço cadastrado!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
