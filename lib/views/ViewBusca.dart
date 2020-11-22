import 'package:flutter/material.dart';

class ViewBusca extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Busca',
        style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: 'Search...'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.red[400],
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Roupa',
                    ),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.black45,
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Social',
                    ),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.blue[400],
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Sapato',
                    ),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.purple[400],
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Cosmético',
                    ),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.pink[400],
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Bolsa',
                    ),
                    onPressed: (){}
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  RaisedButton(
                    color: Colors.green[400],
                    textColor: Colors.black,
                    elevation: 20, 
                    child: Text(
                      'Acessório',
                    ),
                    onPressed: (){}
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