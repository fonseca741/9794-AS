import 'package:manter_produto/models/Notificacao.dart';

const DUMMY_NOTIFICACOES = {
  '1': const Notificacao(
    id: '1',
    nome: 'Pedido confirmado',
    tipo: 'Seu pedido foi confirmado',
  ),
  '2': const Notificacao(
    id: '2',
    nome: 'Pedido recusado',
    tipo: 'Seu pedido foi recusado',
  ),
  '3': const Notificacao(
    id: '3',
    nome: 'Pedido despachado',
    tipo: 'Seu pedido saiu para entrega',
  ),
};