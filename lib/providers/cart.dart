import 'package:flutter/widgets.dart';


class CartItem{
final String ?id ;
final String ?title ;
final int ?quantity ;
final double ?price ;


CartItem({@required this.id,@required this.price, this.quantity,@required this.title});
}


class Cart with ChangeNotifier{
 late Map<String,CartItem> _items = {} ;

 Map<String,CartItem> get items{
  return {..._items};
 }
 int get itemcount{
  return   _items.length ;
 }
void addItem(String id , double price , String title){
  if(_items.containsKey(id)){
    _items.update(id, (existingCartitem) => CartItem(id: existingCartitem.id, 
    price: existingCartitem.price, title: existingCartitem.title,
    quantity: existingCartitem.quantity! + 1));
  }else{
    _items.putIfAbsent(id, () => CartItem(id: DateTime.now().toString(), price: price, title: title));
  }
  notifyListeners();
}

}