import 'package:flutter/material.dart';
import 'package:shopp/firebase_options.dart';
import 'package:shopp/providers/cart.dart';
import 'package:shopp/providers/order.dart';
import 'package:shopp/providers/otp.dart';
import 'package:shopp/screens/cart_screen.dart';
import 'package:shopp/screens/edit_productscreen.dart';
import 'package:shopp/screens/ordersscreen.dart';
import 'package:shopp/screens/otpscreen.dart';
import 'package:shopp/screens/products_overview_screens.dart';
import 'package:shopp/screens/registrationscreen.dart';
import 'package:shopp/screens/users_product_screen.dart';
import './screens/product_details_screen.dart';
import './providers/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  print('this is working 2');
  WidgetsFlutterBinding.ensureInitialized();
  print('not working');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   print('working 3');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(
        create: (ctx)=> Products(),
        ),

        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),

        ChangeNotifierProvider(
          create: (ctx)=> Orders(),
        ),

        ChangeNotifierProvider(create:(ctx)=> Otpitems()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily:'Lato',
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
             
          ),
          home:  RegistrationScreen(),
          debugShowCheckedModeBanner: false,
          routes:{ProductDetailsScreen.routename:(ctx)=> ProductDetailsScreen(),
                 CartScreen.route:(ctx)=> CartScreen(),
                 OrdersScreen.routenamed:(ctx)=>OrdersScreen(),
                 UserproductsScreen.routenamed:(ctx)=> UserproductsScreen(),
                 Editproductscreen.routname:(ctx) => Editproductscreen(),
                 RegistrationScreen.routenamed:(ctx) => RegistrationScreen(),
                 OtpScreen.routenamed:(ctx) => OtpScreen(),
                 ProductsOverviewScreen.routenamed:(ctx) => ProductsOverviewScreen(),
                 
                 } ,
                 
        ),
      );
  
  }
}

