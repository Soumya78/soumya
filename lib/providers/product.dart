import 'package:flutter/widgets.dart';

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


  void togglestatus(){
    isFav = !isFav;
    notifyListeners();
  }
}