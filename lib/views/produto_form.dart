/*import 'package:flutter/material.dart';
import 'package:manter_produto/models/Produto.dart';
import 'package:manter_produto/provider/produtos.dart';
import 'package:provider/provider.dart';

class ProdutoForm extends StatefulWidget {
  @override
  _ProdutoFormState createState() => _ProdutoFormState();
}

class _ProdutoFormState extends State<ProdutoForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Produto produto){
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
  void didChangeDependencies(){
    super.didChangeDependencies();
    final Produto produto = ModalRoute.of(context).settings.arguments;

    _loadFormData(produto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Produto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save), 
            onPressed: () {
              final isValid =  _form.currentState.validate();
              if(isValid){
                _form.currentState.save();
                Provider.of<Produtos>(context, listen: false).put(Produto(
                  id: _formData['id'],
                  nome: _formData['Nome'],
                  categoria: _formData['Categoria'],
                  preco: _formData['Preco'],
                  descricao: _formData['Descrição'],
                  tamanhos: _formData['Tamanhos'],
                  foto: _formData['Foto'],
                  ),
                );
                Navigator.of(context).pop();
              }
            }
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['Nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Nome'] = value,
              ),
              TextFormField(
                initialValue: _formData['Categoria'],
                decoration: InputDecoration(labelText: 'Categoria'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Categoria'] = value,
              ),
              TextFormField(
                initialValue: _formData['Preço'],
                decoration: InputDecoration(labelText: 'Preço'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Preco'] = value,
              ),
              TextFormField(
                initialValue: _formData['Descrição'],
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Descricao'] = value,
              ),
              TextFormField(
                initialValue: _formData['Tamanhos'],
                decoration: InputDecoration(labelText: 'Tamanhos'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Tamanhos'] = value,
              ),
              TextFormField(
                initialValue: _formData['Foto'],
                decoration: InputDecoration(labelText: 'Foto'),
                validator: (value) {
                  if(value == null || value.trim().isEmpty){
                    return 'Ocorreu um erro';
                  }
                },
                onSaved: (value) => _formData['Foto'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/