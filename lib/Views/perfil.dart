import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewPerfil extends StatefulWidget {
  @override
  _ViewPerfilState createState() => _ViewPerfilState();
}

class _ViewPerfilState extends State<ViewPerfil> {
  final _form = GlobalKey<FormState>();
  bool _editEmail = true;
  bool _editTel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Meus Dados',
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
                        'Informações Pessoais',
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff1d3557),
                  ),
                  Padding(padding: EdgeInsets.all(8)),
                  TextFormField(
                    initialValue: 'Henrique Fonseca',
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    initialValue: '999.999.999-99',
                    readOnly: true,
                    decoration: InputDecoration(
                        labelText: 'CPF',
                        border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                                const Radius.circular(20)))),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Divider(
                    color: Color(0xff1d3557),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  Center(
                      child: Text(
                    'Dados de Contato',
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
                          initialValue: 'h.marquesluiz@gmail.com',
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
                          initialValue: '(44) 99163-5383',
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
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.EXCLUIR_CONTA),
                    },
                  )
                ],
              ),
            )));
  }
}
