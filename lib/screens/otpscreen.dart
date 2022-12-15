import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/otp.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:shopp/screens/products_overview_screens.dart';
class OtpScreen extends StatelessWidget {
 // const OtpScreen({ Key? key }) : super(key: key);
  static const routenamed = '/Otpscreen';
  TextEditingController otpcontroller = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    
    final otp = Provider.of<Otpitems>(context);
    return Scaffold(appBar: AppBar(title:Text("OtpScreen"),)
    ,body: Container(child: Column(children: <Widget>[
      TextField(decoration: InputDecoration(),onChanged: (value){
         otpcontroller.text = value;
      },),
      ElevatedButton(onPressed: () async{
        //await otp.adddata(otpcontroller.text);
        await otp.adddata(otpcontroller.text.toString());
        Navigator.of(context).pushNamed(ProductsOverviewScreen.routenamed);
        
        // var url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/credentials.json');
        // http.post(url,body:json.encode({'otp':otpcontroller.text.toString()}));
         
      }, child: Text('Save the otp'))
       
         
    ],
    ),
    ),
    );
  }
}