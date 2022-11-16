import 'package:flutter/material.dart' ;
import 'package:intl/intl.dart';

import 'package:shopp/providers/order.dart' as ord;
class Orderitem extends StatelessWidget {

final ord.Orderitem orde ;
    Orderitem(this.orde);
  

  

  

  @override
  Widget build(BuildContext context) {
    
   
    return Card(
       margin: EdgeInsets.all(10.0),
       child: Column(children: <Widget>[
        ListTile(title: Text('\$${orde.amount}'),
        subtitle: Text(DateFormat('dd MM yyyy hh:mm ').format(orde.datetime),),
        trailing: IconButton(icon: Icon(Icons.expand_more),onPressed: (){},),)
       ],),
    );
  }
}