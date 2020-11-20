import 'package:flutter/material.dart';
import 'package:iClothes/Models/pergunta.dart';
import 'package:iClothes/Routes/app_routes.dart';
// import 'package:expandable/expandable.dart';

class ViewFaq extends StatelessWidget {
  static const String _title = 'Perguntas Frequentes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _title,
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: ViewFaqBody(),
    );
  }
}

class ViewFaqBody extends StatefulWidget {
  ViewFaqBody({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ViewFaqBody> {
  List<Pergunta> _data = [
    Pergunta(pergunta: 'Pergunta 1', resposta: 'Resposta pergunta 1'),
    Pergunta(pergunta: 'Pergunta 2', resposta: 'Resposta pergunta 2'),
    Pergunta(pergunta: 'Pergunta 3', resposta: 'Resposta pergunta 3'),
    Pergunta(pergunta: 'Pergunta 4', resposta: 'Resposta pergunta 4'),
    Pergunta(pergunta: 'Pergunta 5', resposta: 'Resposta pergunta 5'),
    Pergunta(pergunta: 'Pergunta 6', resposta: 'Resposta pergunta 6'),
    Pergunta(pergunta: 'Pergunta 7', resposta: 'Resposta pergunta 7'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // child: _buildPanel(),
        child: Column(
          children: [
            _buildPanel(),
            Padding(padding: EdgeInsets.all(10)),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'Não encontrou a resposta para a sua pergunta? Nos envie uma mensagem!',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            RaisedButton(
              child: Text(
                'Enviar mensagem',
                style: TextStyle(fontSize: 18),
              ),
              textColor: Colors.white,
              color: Color(0xff1d3557),
              padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17)),
              onPressed: () => {Navigator.of(context).pushNamed(AppRoutes.SAC)},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Pergunta resposta) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(
                resposta.pergunta,
                style: TextStyle(fontSize: 18),
              ),
            );
          },
          body: ListTile(
              title: Text(
                resposta.resposta,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                setState(() {});
              }),
          isExpanded: resposta.isExpanded,
        );
      }).toList(),
    );
  }
}
