import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopp/screens/otpscreen.dart';


class RegistrationScreen extends StatefulWidget {
  static const routenamed = '/RegistrationScreen';
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  
  TextEditingController ?countrycode = new TextEditingController();
  var phone ="";
  @override
  void initState(){
    print('its working 1');
    countrycode!.text = "+91";
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Registration Screen"),),

      body: Container(child: Column(children: <Widget>[
            SizedBox(height:20),
          CircleAvatar(radius: 80,),
          SizedBox(height:10),
        TextField(onChanged: (value){
          phone=value ;
        },keyboardType: TextInputType.phone,decoration: InputDecoration(contentPadding: EdgeInsets.all(10)),controller: countrycode,),
        SizedBox(
          child: ElevatedButton(onPressed: ()async {
            print('${phone}');

           await FirebaseAuth.instance.verifyPhoneNumber(
            
          phoneNumber:'${phone}',
          verificationCompleted: (PhoneAuthCredential credential) {
         
          },
          verificationFailed: (FirebaseAuthException e) {print(e.message);},
          codeSent: (String verificationId, int? resendToken) { Navigator.pushNamed(context,OtpScreen.routenamed);},
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
          }, child: Text('Get otp',style: TextStyle(fontSize: 20),),
          ),
        ),

      ],
      ),
      ),
    );
  }
}