import 'package:flutter/material.dart';
import 'package:iclothes/models/pergunta.dart';
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
        child: _buildPanel(),
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
              title: Text(resposta.pergunta),
            );
          },
          body: ListTile(
              title: Text(resposta.resposta),
              onTap: () {
                setState(() {});
              }),
          isExpanded: resposta.isExpanded,
        );
      }).toList(),
    );
  }
}
