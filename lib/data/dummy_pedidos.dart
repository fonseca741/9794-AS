import 'package:iclothes/models/pedido.dart';

const PEDIDOS = {
  '1': const Pedido(
    id: '1',
    nomeUsuario: 'Roberto de Assis',
    produtosCompra: ['Camisa do Homem Aranha', 'Fronha do Batman'],
    estabelecimentoCompra: 'Mega HQ',
    valorPedido: '149,90',
    formaEntrega: 'Entrega na Residencia',
    formaPagamento: 'Pagamento Online',
    dataCompra: '02/03/2020',
  ),
  '2': const Pedido(
    id: '2',
    nomeUsuario: 'Gustavo da Silva',
    produtosCompra: ['Shorts Stylish', 'Meia Três Quartos'],
    estabelecimentoCompra: 'Estilo do Homem',
    valorPedido: '99,90',
    formaEntrega: 'Entrega na Residencia',
    formaPagamento: 'Pagamento na Entrega',
    dataCompra: '11/02/2020',
  ),
  '3': const Pedido(
    id: '3',
    nomeUsuario: 'Amanda Rodrigues',
    produtosCompra: ['Vestido longo', 'Blusinha Florida', 'Shorts barra alta'],
    estabelecimentoCompra: 'Channel',
    valorPedido: '500,90',
    formaEntrega: 'Entrega na Residencia',
    formaPagamento: 'Pagamento Online',
    dataCompra: '17/04/2020',
  ),
};
