import 'package:manter_produto/models/Produto.dart';

const DUMMY_PRODUTOS = {
  '1': const Produto(
    id: '1',
    nome: 'Regata', 
    categoria: 'Roupa', 
    preco: '25,00', 
    descricao: 'Regata simples lisa', 
    tamanhos: 'P, M, G', 
  ),
  '2': const Produto(
    id: '2',
    nome: 'Perfume Elysée', 
    categoria: 'Cosmético', 
    preco: '210,00', 
    descricao: 'Perfume Elysée eau de parfum oBoticário', 
    tamanhos: '50 ml', 
  ),
  '3': const Produto(
    id: '3',
    nome: 'Tênis All Star', 
    categoria: 'Sapato', 
    preco: '180,00', 
    descricao: 'Tênis All Star cano médio preto', 
    tamanhos: '35, 36, 37, 38, 39', 
  ),
  '4': const Produto(
    id: '4',
    nome: 'Calça Colcci', 
    categoria: 'Roupa', 
    preco: '190,00', 
    descricao: 'Calçca Colcci boca de sino preta', 
    tamanhos: '34, 36, 38, 40', 
  ),
};