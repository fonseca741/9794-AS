import 'package:flutter/material.dart';
import 'package:iclothes/routes/app_routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewSac extends StatelessWidget {
  final TextEditingController _controladorAssunto = TextEditingController();
  final TextEditingController _controladorMensagem = TextEditingController();

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
            Navigator.of(context).pushReplacementNamed(AppRoutes.PERFIL)
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
        // automaticallyImplyLeading: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_outlined),
        //   onPressed: () => Navigator.pop(context),
        // ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Mande uma mensagem para nós!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorAssunto,
                decoration: InputDecoration(
                    labelText: 'Assunto',
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(20)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                maxLines: 10,
                controller: _controladorMensagem,
                decoration: InputDecoration(
                    labelText: 'Mensagem',
                    alignLabelWithHint: true,
                    border: new OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(const Radius.circular(30)))),
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
                onPressed: () => {enviarAlerta(context)},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
