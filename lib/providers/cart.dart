import 'package:flutter/widgets.dart';


class CartItem{
final String id ;
final String title ;
 final int  quantity ;
final double price ;


CartItem({required this.id,required this.price, required this.quantity,required this.title});
}


class Cart with ChangeNotifier{
   Map<String,CartItem> _items = {} ;

 Map<String,CartItem> get items{
  return {..._items};
 }
 int get itemcount{
  return   _items.length ;
 }
 double get totalamount{
 var total = 0.0 ;
 _items.forEach((key, cartitems) { 

  total = total + cartitems.price * cartitems.quantity;
 });
 return total ;
 

 }


void addItem(String id , double price , String title){
  if(_items.containsKey(id)){
    _items.update(id, (existingCartitem) => CartItem(id: existingCartitem.id, 
    price: existingCartitem.price, title: existingCartitem.title,
    quantity: existingCartitem.quantity + 1));
  }else{
    _items.putIfAbsent(id, () => CartItem(id: DateTime.now().toString(), price: price, title: title,quantity: 1));
  }
  notifyListeners();
}
void removeitem(String productid){
_items.remove(productid);
notifyListeners();
}
void removesingleitem(String prodid){
if(!_items.containsKey(prodid)){
  return ;
}if(_items[prodid]!.quantity > 1){
    _items.update(prodid, (existingitem) => CartItem(id: existingitem.id,
     price: existingitem.price,
     quantity: existingitem.quantity-1,
      title: existingitem.title ),);
}else{
  _items.remove(prodid);
}
notifyListeners();
}

void clear(){
  _items = {};
  notifyListeners();
  
}

}