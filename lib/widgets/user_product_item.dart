import 'package:flutter/material.dart';
import 'package:shopp/screens/edit_productscreen.dart';
class Userproductitem extends StatelessWidget {
  String ?title ;
  String ?imgurl ;

  Userproductitem(this.title,this.imgurl);
 

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(backgroundImage: NetworkImage(imgurl!),
      ),
      trailing: Container(
        width: 100,
        child: Row(children: <Widget>[
          IconButton(color: Theme.of(context).primaryColor,onPressed: (){
            Navigator.of(context).pushNamed(Editproductscreen.routname);
          }, icon: Icon(Icons.edit),
          ),
          IconButton(color:Theme.of(context).errorColor,onPressed: (){}, icon: Icon(Icons.delete),)
        ]),
      ),
    );
  }
}