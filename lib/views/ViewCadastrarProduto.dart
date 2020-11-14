import 'package:flutter/material.dart';
import 'package:manter_produto/models/Produto.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ViewCadastrarProduto extends StatefulWidget{
  @override
  _ViewCadastrarProdutoState createState() => _ViewCadastrarProdutoState();
}

class _ViewCadastrarProdutoState extends State<ViewCadastrarProduto> {
  List _controladorC = ['Roupa', 'Social', 'Sapato', 'Cosmético', 'Bolsa', 'Acessório'];

  String _categoriaValor;

  final _form = GlobalKey<FormState>();
  final Map<String, Object> _formData = {};

  void loadFormData(Produto produto){
    if(produto != null){
      _formData['id'] = produto.id;
      _formData['Nome'] = produto.nome;
      _formData['Categoria'] = produto.categoria;
      _formData['Preço'] = produto.preco;
      _formData['Descrição'] = produto.descricao;
      _formData['Tamanhos'] = produto.tamanhos;
      _formData['Foto'] = produto.foto;
    } 
  }

  @override
  Widget build(BuildContext context) {
    final Produto produto = ModalRoute.of(context).settings.arguments;
    loadFormData(produto);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Produto', 
        style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: TextFormField(
                    initialValue: _formData['Nome'],
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                      ),
                    ),
                    validator: (value) {
                    if(value == null || value.trim().isEmpty){
                      return 'Ocorreu um erro';
                    }
                    return null;
                    },
                    onSaved: (value) => _formData['Nome'] = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                    child: Container(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      decoration: BoxDecoration( 
                        border: Border.all(color: Colors.black26, width: 1.5),
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                      ),
                      child: DropdownButton(
                        hint: Text('Roupa'),
                        value: _categoriaValor,
                        iconSize: 55.0,
                        isExpanded: true,
                        onChanged: (value) {
                        setState((){
                          _categoriaValor = value;
                        });
                      },
                      items: _controladorC.map((value){
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),); 
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['Preço'],
                    decoration: InputDecoration(
                      labelText: 'Preço',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Ocorreu um erro';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Preco'] = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['Descrição'],
                    decoration: InputDecoration(
                      labelText: 'Descrição',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Ocorreu um erro';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Descricao'] = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: TextFormField(
                    initialValue: _formData['Tamanhos'],
                    decoration: InputDecoration(
                      labelText: 'Tamanhos disponíveis',
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(20))
                      ),
                    ),
                    validator: (value) {
                      if(value == null || value.trim().isEmpty){
                        return 'Ocorreu um erro';
                      }
                      return null;
                    },
                    onSaved: (value) => _formData['Tamanhos'] = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Container(
                    height: 50.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 10.0),
                          blurRadius: 30.0,
                          color: Colors.black12
                        )
                      ],
                      border: Border.all(color: Colors.black26, width: 1.5),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text('Adicionar fotos'),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(200),
                            )
                          )
                        ),
                        Icon (Icons.image, size: 30)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: RaisedButton(
                    child: Text(
                      'Salvar',
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
                        title: "Produto salvo com sucesso!",
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
            ),
          ),
        ),
      );
  }
}