import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/cart.dart';
import 'package:shopp/screens/cart_screen.dart';
import 'package:shopp/widgets/app-drawer.dart';
import 'package:shopp/widgets/badge.dart';
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
         [const PopupMenuItem(child: Text('Favorite'),
         value: Fillterotipns.Favorites,),
         const PopupMenuItem(child: Text('more'),
         value: Fillterotipns.all,),
         ],
         ),
         Consumer<Cart>(builder: (context, cart, ch) => 
          Badge(value: cart.itemcount.toString(),color: Colors.deepOrangeAccent,
           child: IconButton(icon: Icon(Icons.shopping_cart),
           onPressed: () { 
             print("not good");
            print(cart.totalamount.toString() + "this is working");
           
            Navigator.of(context).pushNamed(CartScreen.route);
            
            },), 
          ),
          
          
            
            ),
      ],
      ),
      drawer: AppDrawer(),
      body: Productsgrid(_showonlyfav),
    );
  }
}

