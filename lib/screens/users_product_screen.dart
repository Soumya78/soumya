import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product_provider.dart';
import 'package:shopp/screens/edit_productscreen.dart';
import 'package:shopp/widgets/app-drawer.dart';
import 'package:shopp/widgets/user_product_item.dart';
class UserproductsScreen extends StatelessWidget {
  static const routenamed = '/user_products';

  Future<void>_refreshproducts(BuildContext context) async {
  await Provider.of<Products>(context,listen: false).fetchandSetProducts();
  }
  const UserproductsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Your Products"),actions: <Widget>[
       IconButton(onPressed: (){
        Navigator.of(context).pushNamed(Editproductscreen.routname);
       }, icon: const Icon(Icons.add),
       )
      ],
      ),
      body: RefreshIndicator(
        onRefresh: () =>_refreshproducts(context),
        child: Padding(padding: const EdgeInsets.all(8),
        child: ListView.builder(itemBuilder:(_,i)
         =>Column(
      
           children:[ Userproductitem(productsdata.items[i].title, 
               productsdata.items[i].imgurl,productsdata.items[i].id),
         ]) ,
        itemCount:productsdata.items.length ,
        ),
      
        ),
      ),
      
    );
  }
}