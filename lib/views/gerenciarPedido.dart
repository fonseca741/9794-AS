import 'package:flutter/material.dart';
import 'package:iclothes/models/pedido.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewGerenciarPedido extends StatefulWidget {
  @override
  _ViewGerenciarPedidoState createState() => _ViewGerenciarPedidoState();
}

class _ViewGerenciarPedidoState extends State<ViewGerenciarPedido> {
  List lstStatus = [
    'Aguardando Confirmação',
    'Confirmado',
    'Cancelado',
    'Enviado',
    'Recebido',
    'Devolvido'
  ];
  String _status;

  @override
  Widget build(BuildContext context) {
    final pedido = ModalRoute.of(context).settings.arguments as Pedido;

    final _controllerComprador =
        TextEditingController(text: pedido.nomeUsuario);
    final _controllerData = TextEditingController(text: pedido.dataCompra);
    final _controllerValor = TextEditingController(text: pedido.valorPedido);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gerenciar Pedido',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controllerComprador,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Nome do comprador',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)))),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controllerData,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Data da compra',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)))),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controllerValor,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: 'Valor do pedido',
                            border: new OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(20)))),
                      ),
                    )
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Center(
                  child: Text(
                'Produtos comprados',
                style: TextStyle(fontSize: 22),
              )),
              Divider(
                color: Color(0xff1d3557),
              ),
              for (var item in pedido.produtosCompra)
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(text: item),
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: 'Produto',
                              border: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      const Radius.circular(20)))),
                        ),
                      )
                    ],
                  ),
                ),
              Padding(padding: EdgeInsets.all(5)),
              Center(
                  child: Text(
                'Status do Pedido',
                style: TextStyle(fontSize: 22),
              )),
              Divider(
                color: Color(0xff1d3557),
              ),
              Container(
                width: 250,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff1d3557), width: 1.5),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20))),
                child: DropdownButton(
                  hint: Text('Aguardando confirmação'),
                  value: _status,
                  iconSize: 45.0,
                  isExpanded: true,
                  onChanged: (value) {
                    setState(() {
                      _status = value;
                    });
                  },
                  items: lstStatus.map((value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: RaisedButton(
                  child: Text(
                    'Atualizar',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Color(0xff1d3557),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: "Status atualizado!",
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
