import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewAlterarSenha extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Alterar Senha',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _form,
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                  child: Text(
                    'Senha Antiga',
                    style: TextStyle(fontSize: 22, color: Color(0xff1d3557)),
                  ),
                ),
              ),
              Divider(
                color: Color(0xff1d3557),
              ),
              Padding(padding: EdgeInsets.all(8)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'É obrigatório inserir sua senha antiga.';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(5)),
              Divider(
                color: Color(0xff1d3557),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Center(
                  child: Text(
                'Senha Nova',
                style: TextStyle(fontSize: 22, color: Color(0xff1d3557)),
              )),
              Padding(padding: EdgeInsets.all(5)),
              Divider(
                color: Color(0xff1d3557),
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Senha',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Digite sua nova senha';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(5)),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Confirme a senha',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Digite sua nova senha';
                  }
                  return null;
                },
              ),
              Padding(padding: EdgeInsets.all(5)),
              RaisedButton(
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
                      title: "Senha alterada com sucesso!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
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
            ]),
          )),
    );
  }
}
