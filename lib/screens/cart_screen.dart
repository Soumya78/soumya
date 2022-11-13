import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/cart.dart';
class CartScreen extends StatelessWidget {
  static const route = '/route';

  @override
  Widget build(BuildContext context) {
    
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Your cart'),
      ),
      body:Column(children:  <Widget>[

        Card(margin: EdgeInsets.all(15),
        child: Padding(padding: EdgeInsets.all(8),
        child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <Widget>[
          
          Text("Total",style: TextStyle(fontSize: 20),),
          SizedBox(width: 10,),
          Chip(label: Text('\$${cart.totalamount}',style: TextStyle(color: Theme.of(context).primaryTextTheme.titleLarge!.color),),backgroundColor: Theme.of(context).backgroundColor,)
          ,ElevatedButton(onPressed: (){}, child: Text("PLace order"))
        ]
        ,),
        ),
        ),

      ],)
    );
  }
}