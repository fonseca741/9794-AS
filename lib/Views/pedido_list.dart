import 'package:flutter/material.dart';
import 'package:projeto1/Dummy_Pedido/Dummy_pedido.dart';
import 'package:projeto1/Models/pedido.dart';
import 'package:projeto1/components/pedido_Tile.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class PedidoLista extends StatefulWidget{
  @override
  _PedidoListaState createState() => _PedidoListaState();
}

class _PedidoListaState extends State<PedidoLista> {
  bool checkBoxValue = false;
  bool checkBoxValue1 = false;

  @override
  Widget build(BuildContext context) {
    //final pedido = {... Dummy_Pedido};

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido',style: TextStyle(fontSize: 22),),
        centerTitle: true,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.add) , 
            onPressed: () {},
            )

        ],
      ), 
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text( 
              'Usuário: Roberto de Assis', style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40), 
            child: Text('Estabelecimento: Mega HQ', style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Icon(Icons.shopping_cart),
          
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text('Produto: Camisa do Homem Aranha', style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40), 
            child: Text('Preço: 109,90', style: TextStyle(fontSize: 16)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40), 
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: checkBoxValue,
                
                    onChanged: (bool value){
                      setState((){
                      checkBoxValue = value;
                      });
                    }
                  ),
                    Text('Pagamento na entrega'),
              ]
            )
          ),
           Padding(
            padding: const EdgeInsets.only(top: 20), 
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: checkBoxValue1,
                
                    onChanged: (bool value){
                      setState((){
                      checkBoxValue1 = value;
                      });
                    }
                  ),
                    Text('Pagamento no Cartão'),
              ]
            )
          ),
           Padding(
            padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text(
                   'Finalizar Compra',
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
                        title: "Compra efetuada com Sucesso!",
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
            padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text(
                   'Cancelar Compra',
                   style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.white,
                    color: Color.fromRGBO(245, 10, 10, 1),
                    padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                    onPressed: () => {
                      Alert(
                        context: context,
                        type: AlertType.error,
                        title: "Compra Cancelada!",
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
      
        ]
      )
    );
  }
}