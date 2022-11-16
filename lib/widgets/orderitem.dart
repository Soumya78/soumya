import 'dart:math';

import 'package:flutter/material.dart' ;
import 'package:intl/intl.dart';

import 'package:shopp/providers/order.dart' as ord;
class Orderitem extends StatefulWidget {

final ord.Orderitem orde ;
    Orderitem(this.orde);

  @override
  State<Orderitem> createState() => _OrderitemState();
}

class _OrderitemState extends State<Orderitem> {
  var _expanded = false ;
  @override
  Widget build(BuildContext context) {
    
   
    return Card(
       margin: EdgeInsets.all(10.0),
       child: Column(children: <Widget>[
        ListTile(title: Text('\$${widget.orde.amount}'),
        subtitle: Text(DateFormat('dd MM yyyy hh:mm ').format(widget.orde.datetime),),
        trailing: IconButton(icon: Icon(_expanded ? Icons.expand_less:Icons.expand_more),
        onPressed: (){
           setState(() {
             _expanded = !_expanded ;
           },
           );
 
        },
        ),
        ),
        if(_expanded) Container(height: min(widget.orde.products!.length * 20.0 + 100 , 180),
        child: ListView(
          
        children: widget.orde.products!.map((e) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children:<Widget> [
          Text(e.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),

          ),
          Text('${e.quantity}x \$${e.price}',
          style: TextStyle(fontSize: 18,color: Colors.grey),
          )
        ],),
        ).toList(),
        ),
       ),
       ],
       ),
    );
  }
}