import 'package:flutter/material.dart';
import 'package:iClothes/Routes/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewSac extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formdata = {};

  void enviarAlerta(context) {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Mensagem enviada!",
      desc:
          "Sua mensagem foi enviada aos nossos atendentes, eles entrarão em contato por email o mais rápido possível.",
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => {
            Navigator.pop(context),
            Navigator.of(context).pushReplacementNamed(AppRoutes.INFO_PESSOAIS)
          },
          width: 120,
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Atendimento',
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Mande uma mensagem para nós!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                            initialValue: _formdata['assunto'],
                            decoration: InputDecoration(
                                labelText: 'Assunto',
                                border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(20)))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira o assunto de sua mensagem.';
                              }
                              return null;
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextFormField(
                            maxLines: 10,
                            decoration: InputDecoration(
                                labelText: 'Mensagem',
                                alignLabelWithHint: true,
                                border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        const Radius.circular(30)))),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Insira a sua mensagem.';
                              }
                              return null;
                            }),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                      child: Text(
                        'Enviar',
                        style: TextStyle(fontSize: 20),
                      ),
                      textColor: Colors.white,
                      color: Color(0xff1d3557),
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () => {
                            if (_form.currentState.validate())
                              {enviarAlerta(context)},
                          }),
                ),
              ],
            ),
          ),
        ));
  }
}
