import 'package:flutter/material.dart';

class ViewGerarRelatorio extends StatelessWidget {
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
    );
  }
}
