import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopp/providers/otp.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

import 'package:shopp/screens/products_overview_screens.dart';
import 'package:sms_autofill/sms_autofill.dart';
class OtpScreen extends StatefulWidget {
 // const OtpScreen({ Key? key }) : super(key: key);
  static const routenamed = '/Otpscreen';
 

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with CodeAutoFill {
  
   String codevalue = "";
   bool _isloading  = true ;
  @override
  void initState(){
    super.initState();
    _listenotp();
  }

  
  


void _listenotp() async {
  
 await SmsAutoFill().listenForCode;

 if(await SmsAutoFill().code.isEmpty){
  return ;
 }else{
  Navigator.of(context).pushNamed(ProductsOverviewScreen.routenamed);
 }
 
 print("otp listen called");
}

  TextEditingController otpcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
   // String codevalue = "";
   //final otp = Provider.of<Otpitems>(context);
    return Scaffold(appBar: AppBar(title:Text("OtpScreen"),)
    ,body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center
    ,children:<Widget> [
       Container(padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
       child: PinFieldAutoFill(currentCode: codevalue,codeLength: 4,onCodeChanged:(val){
          _listenotp();
       },),),
     
    ],
    ),),
    );
        
        // var url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/credentials.json');
        // http.post(url,body:json.encode({'otp':otpcontroller.text.toString()}));
         
    
       
         
  

}

  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
  }
}
