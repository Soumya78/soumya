import 'package:flutter/material.dart';
import 'package:shopp/screens/ordersscreen.dart';
import 'package:shopp/screens/users_product_screen.dart';
class AppDrawer extends StatelessWidget {
  
  const AppDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(title: Text('Hello Friends'),
        automaticallyImplyLeading: false,),
        Divider(),
        ListTile(leading: Icon(Icons.shop),
        title: Text('Shop'),
        onTap:(){Navigator.of(context).pushReplacementNamed('/');}
        ,),
         Divider(),
        ListTile(leading: Icon(Icons.payment),
        title: Text('Orders'),
        onTap:(){Navigator.of(context).pushReplacementNamed(OrdersScreen.routenamed);}
        ,),
        Divider(),
         ListTile(leading: Icon(Icons.payment),
        title: Text('Manage products'),
        onTap:(){Navigator.of(context).pushNamed(UserproductsScreen.routenamed);}
        ,),

      ],
      
      ),
    );
  }
}