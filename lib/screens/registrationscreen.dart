import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopp/screens/otpscreen.dart';
import 'package:twilio_flutter/twilio_flutter.dart';


class RegistrationScreen extends StatefulWidget {
  static const routenamed = '/RegistrationScreen';
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TwilioFlutter twilio_flutter ;
  
  TextEditingController ?countrycode = new TextEditingController();
  var phone ="";
  @override
  void initState(){
    //print('its working 1');
    twilio_flutter = TwilioFlutter(accountSid: 'ACcb8811e5328cc238f2977354b9d151a4', 
    authToken: '79c7a131fe5833d04577362b51c0e402', twilioNumber: '+91 934848 6728');
   // countrycode!.text = "+91";

    super.initState();
  }
  void sendsms (String number) async{
    twilio_flutter.sendSMS(toNumber: number, messageBody: 'hi this is your code');
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Registration Screen"),),

      body: Container(child: Column(children: <Widget>[
            SizedBox(height:600,child: Container(child: Column(children: <Widget>[
              
            
               Image.network('https://cdn.freebiesupply.com/logos/thumbs/2x/firebase-1-logo.png',
                height: 500,width: double.infinity,),
                Text("Mobile Number",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Text("Enter your mobile number to continue"),
            ],),color: Colors.yellow),),
          
          SizedBox(height:10),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(onChanged: (value){
            phone=value ;
          },keyboardType: TextInputType.phone,
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: 'Enter your phone number',
          contentPadding: EdgeInsets.all(10)),controller: countrycode,),
        ),
        SizedBox(
          child: ElevatedButton(style: ButtonStyle(),onPressed: ()async {
            print('${phone}');
            sendsms(phone);

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
        ),

      ],
      ),
      ),
    );
  }
}