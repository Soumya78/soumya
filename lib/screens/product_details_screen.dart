import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product_provider.dart';
class ProductDetailsScreen extends StatelessWidget {
 // final String title ;
 // ProductDetailsScreen(this.title);

 static const routename = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final prodid = ModalRoute.of(context)!.settings.arguments as String ;
    final loadedprd = Provider.of<Products>(context).findbyId(prodid);
    return Scaffold(
      appBar: AppBar(title: Text(loadedprd.title)),
    );
  }
}