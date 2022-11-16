import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/cart.dart';




class Cartitemwidget extends StatelessWidget {
  final String? id ;
final double? price ;
final String? prodid ;
final int? quantity;
final String? title ;
Cartitemwidget(this.id,this.price,this.quantity,this.title,this.prodid);
 

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
         Provider.of<Cart>(context,listen: false).removeitem(prodid!);
      },
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,color: Colors.white,size: 40,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15,
        vertical: 4),
      ),
      child: Card(
        margin:EdgeInsets.symmetric(horizontal: 15,vertical:4),
        child: Padding(padding: EdgeInsets.all(8),
        child: ListTile(leading: CircleAvatar(child:Text('\$${price}'),),
        title: Text(title!),
        subtitle: Text('Total: \$${(price!*quantity!)}'),trailing: Text('$quantity x'),),
      )),
    );
  }
}