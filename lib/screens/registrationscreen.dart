import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopp/screens/otpscreen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


class RegistrationScreen extends StatefulWidget {
  static const routenamed = '/RegistrationScreen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
 //const RegistrationScreen({ Key? key }) : super(key: key);
  TextEditingController ?mobileno = new TextEditingController();

 void sumbitotp() async{
    final signcode = await SmsAutoFill().getAppSignature;
    Map sendOtpdata = {
      'mobile-no': mobileno!.text.toString() ,
      'otp-signature': signcode.toString()
    };

              if(!signcode.isEmpty ){
                Navigator.of(context).pushNamed(OtpScreen.routenamed);
              }
              print(sendOtpdata.entries);
 }

  var phone ="";

 // void sendsms (String number) async{
  Widget build(BuildContext context) {
    return Scaffold(

      
      body: Container(width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(children: <Widget>[
            Expanded(
              child:  Container(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                
              
                 Image.network('https://cdn.freebiesupply.com/logos/thumbs/2x/firebase-1-logo.png',
                  width: double.infinity,),
                  Expanded(child: Text("Mobile Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                  Expanded(child: Text("Enter your mobile number to continue")),
              ],),color: Colors.yellow),
              ),
            
          
          SizedBox(height:10),
      
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(onChanged: (value){
              phone=value ;
            },keyboardType: TextInputType.phone,
            decoration: InputDecoration(prefixIcon: Icon(Icons.call),border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: 'Enter your phone number',
            contentPadding: EdgeInsets.all(10)),controller: mobileno,),
          ),
      
         
           ElevatedButton(style: ButtonStyle(),onPressed: ()async {
            sumbitotp();
            //  print('${phone}');
             // sendsms(phone);
         
           /*  await FirebaseAuth.instance.verifyPhoneNumber(
              
            phoneNumber:'${phone}',
            verificationCompleted: (PhoneAuthCredential credential) {
           
            },
            verificationFailed: (FirebaseAuthException e) {print(e.message);},
            codeSent: (String verificationId, int? resendToken) { Navigator.pushNamed(context,OtpScreen.routenamed);},
            codeAutoRetrievalTimeout: (String verificationId) {},
                 ); */
            }, child: Text('Get otp',style: TextStyle(fontSize: 20),),
            ),
         
        

      ],
      ),
      ),
    );
  }
}