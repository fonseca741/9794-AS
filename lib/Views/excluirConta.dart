import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewExcluirConta extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Exclusão de Conta',
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
                  'Para realizar a exclusão da conta, por favor preencha o campo abaixo',
                  style: TextStyle(fontSize: 19),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Senha atual',
                      border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20)))),
                  validator: (value) {
                    if (value.trim().isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  'Deseja realmente realizar a exclusão da sua conta?',
                  style: TextStyle(fontSize: 19),
                  textAlign: TextAlign.center,
                ),
                Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      child: Text(
                        'Não',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Colors.red,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      onPressed: () => {
                        Navigator.pop(context),
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        'Sim',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17)),
                      onPressed: () => {
                        if (_form.currentState.validate())
                          {
                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "Conta Excluida!",
                              desc:
                                  "Todas as suas informações foram retiradas do nosso banco de dados.",
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
                            ).show(),
                          },
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
