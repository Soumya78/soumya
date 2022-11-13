import 'package:flutter/material.dart';
import '../providers/product.dart';
import './products_item.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
class Productsgrid extends StatelessWidget {
 final bool showfav ;

 Productsgrid(this.showfav);

  @override
  Widget build(BuildContext context) {
   final productsdata =  Provider.of<Products>(context);
   final product = showfav ?productsdata.favitems: productsdata.items ;
    return GridView.builder(padding:const EdgeInsets.all(10.0),
    itemCount: product.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
    childAspectRatio: 3/2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10), 
    itemBuilder: (ctx,i)=>
    ChangeNotifierProvider.value( 
      value: product[i],
   child: Productitem(
    
    
    //product[i].id,
    //product[i].title,
  //  product[i].imgurl),
    ),
    ),
    );
  }
}