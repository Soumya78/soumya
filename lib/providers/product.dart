import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
class Product with ChangeNotifier{
  final String id ;
  final String description;
  final String title ;
  final double price ;
  final String imgurl ;
   bool isFav ;


 Product({required this.id,
 required this.description,
 required this.imgurl,
  this.isFav = false,
 required this.price,
 required this.title});


  Future<void> togglestatus() async{
    var oldstatus  = isFav ;
     isFav = !isFav;
    notifyListeners();
    final url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/products/$id.json');
    try{
   http.patch(url,body: json.encode({
     'isfav':isFav,
    }));
    }catch(error){
      isFav = oldstatus ;
    }
   
   
  }
}