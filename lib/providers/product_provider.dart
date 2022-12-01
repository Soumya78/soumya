import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import 'product.dart';
class Products with ChangeNotifier{
 final List<Product>  _items =  [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgurl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
       imgurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
       imgurl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
       imgurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

 List<Product> get items {
    return [..._items];
 }
 List<Product> get favitems{
  return _items.where((prodfav) => prodfav.isFav).toList();
 }
 Product findbyId(String id){
  return _items.firstWhere((prod) => prod.id == id);
 }
 

 void addProducts(Product product){
  var url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/products.json');
    http.post(url,body: json.encode({
      'title':product.title,
      'description':product.description,
      'imageurl':product.imgurl,
      'price':product.price,
      'isfav':product.isFav,
    }));
 final addnewproduct  = Product(id: DateTime.now().toString(),
  description: product.description, 
  imgurl: product.imgurl,
   price: product.price,
    title: product.title);
    _items.add(addnewproduct);
   // _items.insert(0,addnewproduct);
  //_items.add(value);
  notifyListeners();
 }
 void updateProducts(String id , Product newproduct){
  final  prodindex = _items.indexWhere((element) => element.id == id);
  if(prodindex >= 0){
_items[prodindex] = newproduct ;
  }else{
    print('....');
  }
  
  notifyListeners();
 }

void deleteProducts(String id){
_items.removeWhere((element) => element.id == id);
notifyListeners();
}

}