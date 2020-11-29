import 'package:flutter/material.dart';
import 'package:projeto1/Models/devolucao.dart';
import 'package:projeto1/Routes/app_Routes.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewDevolucao extends StatelessWidget{
  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void loadFormData(Devolucao devolucao){
    if(devolucao != null){
      _formData['id'] = devolucao.id;
      _formData['Motivo'] = devolucao.motivo;
    } 
  }

  @override
  Widget build(BuildContext context){
    final Devolucao devolucao = ModalRoute.of(context).settings.arguments;
    loadFormData(devolucao);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Devolução de Produto',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top:100),
                child: Text(
                  'Produto:',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16),
                child: Text(
                  'Regata lisa sem estampa preta M      RS34,90',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Text(
                  'Estabelecimento:',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:16),
                child: Text(
                  'Boutique do Zé',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: TextFormField(
                  initialValue: _formData['Motivo'],
                  decoration: InputDecoration(
                    labelText: 'Motivo da devolução',
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                    ),
                  ),
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Ocorreu um erro';
                    }
                    return null;
                  },
                  onSaved: (value) => _formData['Motivo'] = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RaisedButton(
                  child: Text(
                    'Enviar',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Color.fromRGBO(95, 140, 245, 1),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Pedido de devulução enviado com sucesso!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show(),
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RaisedButton(
                  child: Text(
                    'Iniciar Chat com Estabelecimento',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {
                    Navigator.of(context).pushNamed(AppRoutes.CHAT),
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}