import 'package:flutter/material.dart';
import 'package:shopp/widgets/products_item.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';
enum Fillterotipns{
    Favorites,
    all 
   }
class ProductsOverviewScreen extends StatefulWidget {

   
  
  

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showonlyfav = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyShow"),actions: <Widget>[
        PopupMenuButton(onSelected: (Fillterotipns selectedvalue){
          setState(() {
             if(selectedvalue == Fillterotipns.Favorites){
             _showonlyfav = true ;
           }else{
             _showonlyfav = false ;
           }
          });
          
        },icon: Icon(Icons.more_vert),
        itemBuilder: (_)=>
         [const PopupMenuItem(child: Text('Favorite'),value: Fillterotipns.Favorites,),
         const PopupMenuItem(child: Text('more'),value: Fillterotipns.all,)]),
      ],
      ),
      body: Productsgrid(_showonlyfav),
    );
  }
}

