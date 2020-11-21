import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewGerarRelatorio extends StatefulWidget {
  @override
  _ViewGerarRelatorioState createState() => _ViewGerarRelatorioState();
}

class _ViewGerarRelatorioState extends State<ViewGerarRelatorio> {
  DateTime _dateTime1;
  DateTime _dateTime2;
  DateFormat dateFormat = DateFormat("dd/MM/yyy");
  String _categoria;
  String _valor;
  List _controladorCategoria = [
    'Roupa',
    'Social',
    'Sapato',
    'Cosmético',
    'Bolsa',
    'Acessório'
  ];
  List _controladorValor = [
    'Todos',
    'Abaixo de R\$50,00',
    'Abaixo de R\$150,00',
    'Abaixo de R\$300,00',
    'Abaixo de R\$500,00',
    'Abaixo de R\$1000,00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Gerar Relatorio',
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Text(
              'Selecione o período para',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'gerar o relatório',
              style: TextStyle(fontSize: 20),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Divider(
              color: Color(0xff1d3557),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Text('Data inicial'), Text('Data final')],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  child: Text(
                    _dateTime1 == null
                        ? 'Selecione a data'
                        : dateFormat.format(_dateTime1),
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  color: Color(0xff1d3557),
                  padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime.now(),
                    ).then((date) {
                      setState(() {
                        _dateTime1 = date;
                      });
                    })
                  },
                ),
                RaisedButton(
                  child: Text(
                    _dateTime2 == null
                        ? 'Selecione a data'
                        : dateFormat.format(_dateTime2),
                    style: TextStyle(fontSize: 18),
                  ),
                  textColor: Colors.white,
                  color: Color(0xff1d3557),
                  padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () => {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015),
                      lastDate: DateTime.now(),
                    ).then((date) {
                      setState(() {
                        _dateTime2 = date;
                      });
                    })
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Divider(
              color: Color(0xff1d3557),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Text('Filtros', style: TextStyle(fontSize: 20)),
            Padding(padding: EdgeInsets.all(5)),
            Divider(
              color: Color(0xff1d3557),
            ),
            Padding(padding: EdgeInsets.all(5)),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Exibir apenas valores:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff1d3557), width: 1.5),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20))),
                      child: DropdownButton(
                        hint: Text('Todos'),
                        value: _valor,
                        iconSize: 45.0,
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            _valor = value;
                          });
                        },
                        items: _controladorValor.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Apenas a categoria:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Color(0xff1d3557), width: 1.5),
                          borderRadius: const BorderRadius.all(
                              const Radius.circular(20))),
                      child: DropdownButton(
                        hint: Text('Todos'),
                        value: _categoria,
                        iconSize: 45.0,
                        isExpanded: true,
                        onChanged: (value) {
                          setState(() {
                            _categoria = value;
                          });
                        },
                        items: _controladorCategoria.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5)),
            Divider(
              color: Color(0xff1d3557),
            ),
            Padding(padding: EdgeInsets.all(5)),
            RaisedButton(
              child: Text(
                'Gerar Relatório',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.white,
              color: Colors.lightGreen,
              padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              onPressed: () => {
                if (_dateTime1 == null || _dateTime2 == null)
                  {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "Erro!",
                      desc: "Selecione as duas datas.",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => {
                            Navigator.pop(context),
                            // Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN)
                          },
                          width: 120,
                        )
                      ],
                    ).show(),
                  }
                else
                  {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "Relatório gerado!",
                      desc:
                          "O relatório foi enviado ao email de cadastro do estabelecimento",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => {
                            Navigator.pop(context),
                            // Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN)
                          },
                          width: 120,
                        )
                      ],
                    ).show(),
                  }
              },
            ),
          ],
        ),
      ),
    );
  }
}
