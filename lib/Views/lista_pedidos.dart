import 'package:flutter/material.dart';
import 'package:projeto1/components/tilePedidos.dart';
import 'package:projeto1/provider/providerPedidos.dart';
import 'package:provider/provider.dart';

class ViewListaPedidos extends StatefulWidget {
  @override
  _ViewListaPedidosState createState() => _ViewListaPedidosState();
}

class _ViewListaPedidosState extends State<ViewListaPedidos> {
  @override
  Widget build(BuildContext context) {
    final ProviderPedidos pedidos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Pedidos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
          padding: EdgeInsets.only(left: 16, right: 16),
          separatorBuilder: (context, index) => Divider(
                color: Color(0xff1d3557),
              ),
          itemCount: pedidos.count,
          itemBuilder: (ctx, i) {
            return TilePedido(
              pedidos.byIndex(i),
              i,
            );
          }),
    );
  }
}