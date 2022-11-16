import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product_provider.dart';
class ProductDetailsScreen extends StatelessWidget {
 // final String title ;
 // ProductDetailsScreen(this.title);

 static const routename = '/product-details-screen';

  @override
  Widget build(BuildContext context) {
    final prodid = ModalRoute.of(context)!.settings.arguments as String ;
    final loadedprd = Provider.of<Products>(context).findbyId(prodid);
    return Scaffold(
      appBar: AppBar(title: Text(loadedprd.title),
      ),
      body:SingleChildScrollView(
        child: Column(
          children:<Widget>[
           Container(height: 300,
           child:Image.network(loadedprd.imgurl,fit: BoxFit.cover,
          width: double.infinity,),
          
          ),
          SizedBox(height: 10,),

          Text('\$${loadedprd.price}',style: TextStyle(color: Colors.grey,
          fontSize: 20),
          ),
          SizedBox(height: 30,),

          Container(
            width:double.infinity,
            padding: EdgeInsets.symmetric(horizontal:10),
            child: Text(loadedprd.description,
          softWrap: true,textAlign: TextAlign.center ),
          ),
        ],
        ),
      )
      
    );
    
  }
}