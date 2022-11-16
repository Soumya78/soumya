import 'package:flutter/widgets.dart';
import 'package:shopp/providers/cart.dart';


class Orderitem {
  final String? id ;
  final double? amount ;
  final List<CartItem>? products ;
  final DateTime datetime ;



  Orderitem({required this.id,required this.amount,required this.datetime,required this.products});
}




class Orders with ChangeNotifier{
 List<Orderitem>_orders = [] ;


 List<Orderitem>get order{
  return _orders ;
 }

void addorders(List<CartItem> cartproducts , double totalamount){
  _orders.insert(0, Orderitem(id: DateTime.now().toString(),
   amount: totalamount,
   datetime: DateTime.now(), products: cartproducts),
   );
  notifyListeners();
}

}