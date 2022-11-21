import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/cart.dart';
import 'package:shopp/providers/product.dart';
import 'package:shopp/screens/product_details_screen.dart';

class Productitem extends StatelessWidget {
//final String id ;
//final String title ;
//final String imgurl ;

// Productitem(this.id,this.imgurl,this.title);




  

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,listen: false);
    final cart = Provider.of<Cart>(context,listen: false);
    return GridTile(
      child: GestureDetector(onTap: (){Navigator.of(context).
      pushNamed(ProductDetailsScreen.routename,arguments: product.id);
     },
      child: Image.network(product.imgurl,fit: BoxFit.cover,)),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(leading:  IconButton(onPressed: (){product.togglestatus();},
        icon: Icon(product.isFav ? Icons.favorite:Icons.favorite_border), color:Colors.deepOrangeAccent,),
        backgroundColor: Colors.black54,
        title: Text(product.title,textAlign: TextAlign.center,
        ),trailing: IconButton(onPressed: (){
           cart.addItem(product.id, product.price, product.title);
           ScaffoldMessenger.of(context).hideCurrentSnackBar();
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added item to cart"),
           duration: Duration(seconds: 2),
           action: SnackBarAction(label: "undo",onPressed: (){cart.removesingleitem(product.id);},),

           ),
           );
        },icon: Icon(Icons.shopping_cart,
       ),
        )
        ,),
      ),
    );
  }
}