import 'package:flutter/material.dart';
import 'package:iclothes/components/tilePedidosEstab.dart';
import 'package:iclothes/provider/providerPedidos.dart';
import 'package:provider/provider.dart';

class ViewPedidosEstab extends StatefulWidget {
  @override
  _ViewPedidosEstabState createState() => _ViewPedidosEstabState();
}

class _ViewPedidosEstabState extends State<ViewPedidosEstab> {
  @override
  Widget build(BuildContext context) {
    final ProviderPedidos pedidos = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seus pedidos',
          style: TextStyle(fontSize: 22),
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
            return TilePedidoEstab(
              pedidos.byIndex(i),
              i,
            );
          }),
    );
  }
}
