/*import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Otps{
  final String otp ;

  Otps({required this.otp});
}
class Otpitems with ChangeNotifier{
List<Otps> _otps = [];

List<Otps> get otp{
  return _otps ;
}
Future<void> adddata(Otps otps) async{
  var url = Uri.parse('https://shopapp-14acd-default-rtdb.firebaseio.com/credentials.json');

  try{
    final response = await http.post(url,body:json.encode({'otp':otps.otp}));
    final addnewotp = Otps(otp: json.decode(response.body));
    _otps.add(addnewotp);
    notifyListeners();
  }catch(error){
       throw error ;
  }
}
}*/