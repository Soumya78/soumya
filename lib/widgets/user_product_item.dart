import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/product_provider.dart';
import 'package:shopp/screens/edit_productscreen.dart';
class Userproductitem extends StatelessWidget {
  String ?id ;
  String ?title ;
  String ?imgurl ;

  Userproductitem(this.title,this.imgurl,this.id);
 

  @override
  Widget build(BuildContext context) {
    final productsdata = Provider.of<Products>(context,listen: false);
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(backgroundImage: NetworkImage(imgurl!),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(color: Theme.of(context).primaryColor,onPressed: (){
            Navigator.of(context).pushNamed(Editproductscreen.routname,arguments: id);
          }, icon: Icon(Icons.edit),
          ),
          IconButton(color:Theme.of(context).errorColor,onPressed: (){
            productsdata.deleteProducts(id!);
          }, icon: Icon(Icons.delete),)
        ]),
      ),
    );
  }
}