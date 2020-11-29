import 'package:flutter/material.dart';

class ViewDevEst1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Devolução',
        style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Seu cliente Marcos de Oliveira solicitou devolução de produto', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Pedido de devolução feito às 16:33  10/10/2020', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Pedido 21454:', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                '- Regata lisa sem estampa preta                    RS35,90', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                '- Calça jeans Colcci                                       RS168,99', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Subtotal                                                            RS204,89', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Cupom                                                           Sem cupom', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Taxa de entrega                                                      Grátis', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                'Total                                                                   RS204,89', 
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Iniciar chat com cliente',
                    style: TextStyle(fontSize: 20),
                  ),
                  textColor: Colors.white,
                  color: Color(0xff1d3557),
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {},
                ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}