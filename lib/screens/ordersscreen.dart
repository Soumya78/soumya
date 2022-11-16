import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/order.dart' show Orders;
import 'package:shopp/widgets/app-drawer.dart';
import '../widgets/orderitem.dart';
class OrdersScreen extends StatelessWidget {
  static const routenamed = '/orders';
  const OrdersScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders  = Provider.of<Orders>(context);
    return Scaffold(
      appBar:AppBar(title: Text("Your orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(itemCount: orders.order.length,
      itemBuilder: (ctx,i)=>Orderitem(orders.order[i]),),
    );
  }
}