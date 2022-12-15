import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;


class Otpitems with ChangeNotifier{



Future<void> adddata(String otps) async{
  var url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/credentials.json');

  try{
    await http.post(url,body:json.encode({'otp':otps}));
    
    notifyListeners();
  }catch(error){
       throw error ;
  }
}
}