import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product.dart';
import 'package:shopp/screens/product_details_screen.dart';

class Productitem extends StatelessWidget {
//final String id ;
//final String title ;
//final String imgurl ;

// Productitem(this.id,this.imgurl,this.title);




  

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GridTile(
      child: GestureDetector(onTap: (){Navigator.of(context).
      pushNamed(ProductDetailsScreen.routename,arguments: product.id);
     },
      child: Image.network(product.imgurl,fit: BoxFit.cover,)),
      footer: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTileBar(leading:  IconButton(onPressed: (){product.togglestatus();},
        icon: Icon(product.isFav ? Icons.favorite:Icons.favorite_border)),
        backgroundColor: Colors.black54,
        title: Text(product.title,textAlign: TextAlign.center,
        ),trailing: IconButton(onPressed: (){
           

        },icon: Icon(Icons.shopping_cart,
        color:Colors.deepOrangeAccent,),
        )
        ,),
      ),
    );
  }
}