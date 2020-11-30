import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Ajuda extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações',style: TextStyle(fontSize: 22),),
        centerTitle: true,

      ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
            
              child: Text('Acessibilidade', style: TextStyle(fontSize: 22) ,
              ),
            ),
            
          ),
          Divider(
                    color: Color(0xff1d3557),
          ),
          Padding(padding: const EdgeInsets.all(20) 
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30), 
            child: Text('Para obermos mais acessibilidade à todos o sistema tem suporte para deficientes visuais!', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30), 
            child: Text('O Sistema conta com narração automática da tela e auxílio na maioria das funções do aplicativo', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30), 
            child: Text('Aperte o botão Abaixo para Iniciar O Processo', style: TextStyle(fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Icon(Icons.audiotrack,color: Colors.green[300], size: 50,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
              child: RaisedButton(
                child: Text(
                   'Começar a Utilizar o Processo',
                   style: TextStyle(fontSize: 22),
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
                        title: "Iniciou o Processo com Sucesso!",
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
            padding: const EdgeInsets.only(top: 15.0),
              child: RaisedButton(
                child: Text(
                   'Pare de Utilizar o Processo',
                   style: TextStyle(fontSize: 22),
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
                        title: "Parou o Processo com Sucesso!",
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

          
        ],
        ),
      )
    );      
  }
}