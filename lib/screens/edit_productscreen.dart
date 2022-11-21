import 'package:flutter/material.dart';
class Editproductscreen extends StatefulWidget {
  static const routname = '/edit-productscreen';
  const Editproductscreen({ Key? key }) : super(key: key);

  @override
  State<Editproductscreen> createState() => _EditproductscreenState();
}

class _EditproductscreenState extends State<Editproductscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit your products'),
    ),body: Padding(
      padding: EdgeInsets.all(6.0),
      child: Form(child:ListView(children: <Widget>[
            TextFormField(decoration: InputDecoration(labelText: 'Title'),
           textInputAction: TextInputAction.next ),
      ],
      ),
      ),
    ),
    );
  }
}